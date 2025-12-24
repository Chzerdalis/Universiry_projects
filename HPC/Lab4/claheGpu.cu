#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "clahe.h"
#include "gpu_timer.h"
#include <cuda_runtime.h>

// Helper: Read PGM
PGM_IMG read_pgm(const char * path){
    FILE * in_file;
    char sbuf[256];
    PGM_IMG result;
    int v_max;

    in_file = fopen(path, "rb");
    if (in_file == NULL){
        printf("Input file not found!\n");
        exit(1);
    }
    int res;
    res = fscanf(in_file, "%s", sbuf); /*Skip P5*/
    res = fscanf(in_file, "%d",&result.w);
    res = fscanf(in_file, "%d",&result.h);
    res = fscanf(in_file, "%d",&v_max);
    fgetc(in_file); // Skip the single whitespace/newline after max_val

    //--------- pinned memory
    int n = result.w * result.h;
    cudaMallocHost((void**)&result.img, n * sizeof(unsigned char)); // pinned
    res = fread(result.img, sizeof(unsigned char), n, in_file);
    //---------

    if(res == -1) exit(1);   
    fclose(in_file);
    
    return result;
}

// Helper: Write PGM
void write_pgm(PGM_IMG img, const char * path){
    FILE * out_file;
    
    out_file = fopen(path, "wb");
    fprintf(out_file, "P5\n");
    fprintf(out_file, "%d %d\n255\n", img.w, img.h);
    fwrite(img.img, sizeof(unsigned char), img.w*img.h, out_file);
    fclose(out_file);
}

// Helper: Free PGM Memory
// Helper: Free PGM Memory
void free_pgm(PGM_IMG img) {
    if(img.img) cudaFreeHost(img.img);
}

__global__ void histogram_kernel(unsigned char *d_img, int *d_luts, int width, int height, int tile_size, int clip_limit) {
    
    //SHARED MEMORY SETUP
    __shared__ int warp_histogram[8][256]; // 8 warps per block since we have 256 threads/block
    __shared__ int histogram[256]; //combined histogram
    __shared__ int excess_per_thread[256]; //to store excess per thread in order to do reduction
    __shared__ int shared_excess; //total exxecss
                                
    //Thread ids
    int tid = threadIdx.x + threadIdx.y * blockDim.x; // 0 to 255
    int warp_id = tid / 32;

    //Initialization
    for (int i = tid; i < 8 * 256; i += blockDim.x * blockDim.y) {
        ((int*)warp_histogram)[i] = 0;
    }

    histogram[tid] = 0;
    
    if(tid == 0) {
        shared_excess = 0;
    }
    __syncthreads();

    //Per-Warp Counting (Histogram Building)
    //Calculate the global pixel coordinates this thread is responsible for
    //4 PIXELS PER THREAD

    int tx = blockIdx.x * tile_size + threadIdx.x;
    int ty = blockIdx.y * tile_size + threadIdx.y;

    if (tx < width && ty < height) {
        unsigned char val = d_img[ty * width + tx];
        atomicAdd(&warp_histogram[warp_id][val], 1);
    }

    tx += blockDim.x;
    if (tx < width && ty < height) {
        unsigned char val = d_img[ty * width + tx];
        atomicAdd(&warp_histogram[warp_id][val], 1);
    }

    ty += blockDim.y;
    if (tx < width && ty < height) {
        unsigned char val = d_img[ty * width + tx];
        atomicAdd(&warp_histogram[warp_id][val], 1);
    }

    tx -= blockDim.x;
    if (tx < width && ty < height) {
        unsigned char val = d_img[ty * width + tx];
        atomicAdd(&warp_histogram[warp_id][val], 1);
    }

    __syncthreads();

    //Sum partial histograms
    int sum = 0;
    #pragma unroll
    for (int w = 0; w < 8; w++) {
        sum += warp_histogram[w][tid];
    }
    histogram[tid] = sum;

    __syncthreads();
    
    //Calculate shared_excess with reduction and clip values
    int value = histogram[tid];
    int my_excess = 0;

    if (value > clip_limit) {
        my_excess = value - clip_limit;
        histogram[tid] = clip_limit;
    } else {
        my_excess = 0;
    }

    excess_per_thread[tid] = my_excess;

    for (int stride = blockDim.x * blockDim.y / 2; stride > 0; stride >>= 1) {
        __syncthreads();
        if (tid < stride) {
            excess_per_thread[tid] += excess_per_thread[tid + stride];
        }
    }

    __syncthreads();

    if (tid == 0) {
        shared_excess = excess_per_thread[0];
    }

    __syncthreads();

    //Redistribute Excess
    int avg_inc = shared_excess / 256;
    histogram[tid] += avg_inc;

    __syncthreads();

    //Calculate CDF and LUT using parrallel scan reduction 
    int value_to_add = 0;

    for (int stride = 1; stride < 256; stride *= 2) {
        
        //Read neighbor's valueue if it exists
        if (tid >= stride) {
            value_to_add = histogram[tid - stride];
        }
        
        //Sync to ensure everyone has read before anyone writes
        __syncthreads(); 
        
        //Write new sum
        if (tid >= stride) { //Isos na bgainei auto to if
            histogram[tid] += value_to_add;
        }
        
        //Sync to ensure everyone wrote before next stride reads
        __syncthreads();
    }

    //Calculate total pixels (needed for normalization)
    //We can just calculate this locally per thread
    int x_start = blockIdx.x * tile_size;
    int y_start = blockIdx.y * tile_size;
    int actual_w = (x_start + tile_size > width) ? (width - x_start) : tile_size;
    int actual_h = (y_start + tile_size > height) ? (height - y_start) : tile_size;

    int total_pixels = actual_w * actual_h;

    int cdf_val = histogram[tid]; 
    
    int val = (int)((float)cdf_val * 255.0f / total_pixels + 0.5f);
    if (val > 255) val = 255;
    
    int lut_idx = (blockIdx.y * gridDim.x + blockIdx.x) * 256;
    d_luts[lut_idx + tid] = val;
}

__global__ void interpolate_kernel(unsigned char *d_in, unsigned char *d_out, 
                                   cudaTextureObject_t tex_luts,
                                   int width, int height, 
                                   int tile_size, int grid_w, int grid_h) {
    //Calculate pixel coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x >= width || y >= height) return;
    
    //Find tile position
    float ty_f = (float)y / tile_size - 0.5f;
    float tx_f = (float)x / tile_size - 0.5f;
    
    int y1 = (int)floorf(ty_f);
    int x1 = (int)floorf(tx_f);
    int y2 = y1 + 1;
    int x2 = x1 + 1;
    
    //Interpolation weights
    float y_weight = ty_f - y1;
    float x_weight = tx_f - x1;
    
    //See if tile indices are out of bounds
    if (x1 < 0) x1 = 0;
    if (x2 >= grid_w) x2 = grid_w - 1;
    if (y1 < 0) y1 = 0;
    if (y2 >= grid_h) y2 = grid_h - 1;
    
    //Get original pixel value
    unsigned char val = d_in[y * width + x];
    
    //Load values from texture memory
    int tl = tex1Dfetch<int>(tex_luts, (y1 * grid_w + x1) * 256 + val);
    int tr = tex1Dfetch<int>(tex_luts, (y1 * grid_w + x2) * 256 + val);
    int bl = tex1Dfetch<int>(tex_luts, (y2 * grid_w + x1) * 256 + val);
    int br = tex1Dfetch<int>(tex_luts, (y2 * grid_w + x2) * 256 + val);
    
    //Bilinear interpolation
    float top = tl * (1.0f - x_weight) + tr * x_weight;
    float bot = bl * (1.0f - x_weight) + br * x_weight;
    float final_val = top * (1.0f - y_weight) + bot * y_weight;
    
    d_out[y * width + x] = (unsigned char)(final_val + 0.5f);
}


// Core CLAHE
PGM_IMG apply_clahe(PGM_IMG img_in) {
    PGM_IMG img_out;
    int w = img_in.w;
    int h = img_in.h;
    int grid_w, grid_h;
    
    cudaError_t err;
    //Allocate output image
    img_out.w = w;
    img_out.h = h;

    //Use Unified Memory for output image
    cudaMallocManaged((void**)&img_out.img, (size_t)w * (size_t)h * sizeof(unsigned char));

    //Calculate grid dimensions
    grid_w = (w + TILE_SIZE - 1) / TILE_SIZE;
    grid_h = (h + TILE_SIZE - 1) / TILE_SIZE;
    int num_tiles = grid_w * grid_h;
    
    //Allocate Host Memory for LUTs 
    int *host_luts = (int *)malloc(num_tiles * 256 * sizeof(int));

    //GPU Allocation 
    unsigned char *d_img;
    int *d_luts;
    
    GpuTimer timer_1;
    GpuTimer timer_2;

    timer_1.Start();
    timer_2.Start();

    //Allocate memory for input arrays
    cudaMalloc((void**)&d_img, (size_t)w * (size_t)h * sizeof(unsigned char));
    cudaMalloc((void**)&d_luts, num_tiles * 256 * sizeof(int));

    err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
        cudaFree(d_img);
        cudaFree(d_luts);
        cudaDeviceReset();
    }

    //Copy input from pinned memory
    cudaMemcpy(d_img, img_in.img, w * h * sizeof(unsigned char), cudaMemcpyHostToDevice);

    err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
        cudaFree(d_img);
        cudaFree(d_luts);
        cudaDeviceReset();
    }

    timer_1.Stop();
    printf("Data Transfer to GPU Time: %f ms\n", timer_1.Elapsed());
    timer_1.Start();

    dim3 blockSize(16, 16);  //256 threads matches 16x16 tile size
    dim3 gridSize(grid_w, grid_h); //One block per tile
    
    histogram_kernel<<<gridSize, blockSize>>>(d_img, d_luts, w, h, TILE_SIZE, CLIP_LIMIT);
    
    cudaDeviceSynchronize();
    
    // Check for errors
    err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
        cudaFree(d_img);
        cudaFree(d_luts);
        cudaDeviceReset();
    }

    timer_1.Stop();
    printf("Histogram Kernel Time: %f ms\n", timer_1.Elapsed());
    timer_1.Start();

    //-----------------------------
    //Initialize Texture Object for LUTs
    cudaResourceDesc resDesc;
    memset(&resDesc, 0, sizeof(resDesc));    

    resDesc.resType = cudaResourceTypeLinear;
    resDesc.res.linear.devPtr = d_luts;
    resDesc.res.linear.sizeInBytes = num_tiles * 256 * sizeof(int);
    resDesc.res.linear.desc = cudaCreateChannelDesc<int>();

    cudaTextureDesc texDesc;
    memset(&texDesc, 0, sizeof(texDesc));
    texDesc.readMode = cudaReadModeElementType;
    texDesc.filterMode = cudaFilterModePoint;  
    texDesc.addressMode[0] = cudaAddressModeClamp;
    texDesc.addressMode[1] = cudaAddressModeClamp;
    texDesc.normalizedCoords = 0;

    cudaTextureObject_t tex_luts;
    cudaCreateTextureObject(&tex_luts, &resDesc, &texDesc, NULL);
    //-----------------------------

    dim3 blockSize_1(16, 16);
    dim3 gridSize_1((w + 15) / 16, (h + 15) / 16);
    interpolate_kernel<<<gridSize_1, blockSize_1>>>(d_img, img_out.img, tex_luts, w, h, TILE_SIZE, grid_w, grid_h);

    cudaDeviceSynchronize();

    cudaDestroyTextureObject(tex_luts);

    err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
        cudaFree(d_img);
        cudaFree(d_luts);
        cudaDeviceReset();
    }

    timer_1.Stop();
    printf("Interpolation Kernel Time: %f ms\n", timer_1.Elapsed());

    // Cleanup
    cudaFree(d_img);
    cudaFree(d_luts);
    free(host_luts);
    timer_2.Stop();
    printf("Total GPU Time: %f ms\n", timer_2.Elapsed());
    //cudaDeviceReset(); HAPPENS IN MAIN
    return img_out;
}
