/*
* This sample implements a separable convolution 
* of a 2D image with an arbitrary filter.
*/

#include <stdio.h>
#include <stdlib.h>
#include "gpu_cpu_timers.h"

unsigned int filter_radius;

#define FILTER_LENGTH 	(2 * filter_radius + 1)
#define ABS(val)  	((val)<0.0 ? (-(val)) : (val))
#define accuracy  	0.5

 

////////////////////////////////////////////////////////////////////////////////
// Reference row convolution filter
////////////////////////////////////////////////////////////////////////////////
void convolutionRowCPU(float *h_Dst, float *h_Src, float *h_Filter, 
                       int imageW, int imageH, int filterR) {

  int x, y, k;
                      
  for (y = 0; y < imageH; y++) {
    for (x = 0; x < imageW; x++) {
    float sum = 0;

      for (k = -filterR; k <= filterR; k++) {
        int d = x + k;

        if (d >= 0 && d < imageW) {
          sum += h_Src[y * imageW + d] * h_Filter[filterR - k];
        }     

      }
      h_Dst[y * imageW + x] = sum;
    }
  }
        
}


////////////////////////////////////////////////////////////////////////////////
// Reference column convolution filter
////////////////////////////////////////////////////////////////////////////////
void convolutionColumnCPU(float *h_Dst, float *h_Src, float *h_Filter,
    			   int imageW, int imageH, int filterR) {

  int x, y, k;
  
  for (y = 0; y < imageH; y++) {
    for (x = 0; x < imageW; x++) {
    float sum = 0;

      for (k = -filterR; k <= filterR; k++) {
        int d = y + k;

        if (d >= 0 && d < imageH) {
          sum += h_Src[d * imageW + x] * h_Filter[filterR - k];
        }   

      }
      h_Dst[y * imageW + x] = sum;
    }
  }
    
}

__global__ void convolutionRowGPU(float *d_Dst, const float *d_Src, const float *d_Filter, const int imageW, const int imageH, const int filterR) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    float sum = 0;

      for (int k = -filterR; k <= filterR; k++) {
        int d = x + k;

        if (d >= 0 && d < imageH) {
          sum += d_Src[y * imageW + d] * d_Filter[filterR - k];
		}
	}
      d_Dst[y * imageW + x] = sum;
}

__global__ void convolutionColumnGPU(float *d_Dst, const float *d_Src, const float *d_Filter, const int imageW, const int imageH, const int filterR) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    float sum = 0;

      for (int k = -filterR; k <= filterR; k++) {
        int d = y + k;

        if (d >= 0 && d < imageH) {
          sum += d_Src[d * imageW + x] * d_Filter[filterR - k];
        }
      }
      d_Dst[y * imageW + x] = sum;
}

////////////////////////////////////////////////////////////////////////////////
// Main program
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
    float
    *h_Filter,
    *h_Input,
    *h_Input_padded,
    *h_Buffer,
    *h_OutputCPU;

    float *d_OutputGPU, *d_Input, *d_Filter, *h_OutputGPU, *d_Buffer;

    int imageW, imageW_padded;
    int imageH, imageH_padded;
    unsigned int i, j;

    double start_time_cpu, end_time_cpu;
    GpuTimer timer;

    printf("Enter filter radius : ");
    scanf("%d", &filter_radius);

    // Ta imageW, imageH ta dinei o xrhsths kai thewroume oti einai isa,
    // dhladh imageW = imageH = N, opou to N to dinei o xrhsths.
    // Gia aplothta thewroume tetragwnikes eikones.  

    printf("Enter image size. Should be a power of two and greater than %d : ", FILTER_LENGTH);
    scanf("%d", &imageW);
    imageH = imageW;

    //Dimentions for padded arrays
    imageH_padded = imageH + 2*filter_radius;
    imageW_padded = imageW + 2*filter_radius;

    printf("Image Width x Height = %i x %i\n\n", imageW, imageH);
    printf("Allocating and initializing host arrays...\n");

    //Change arrays sizes where needed

  //Host mallocs
    h_Filter    = (float *)malloc(FILTER_LENGTH * sizeof(float)); if(h_Filter == NULL) { printf("h_filter error\n"); return -1; }
    
	h_Input     = (float *)malloc(imageW * imageH * sizeof(float)); 
    if(h_Input == NULL) { 
        free(h_Filter);
        printf("h_input error\n"); 
        return -1;
    }

    h_Buffer    = (float *)malloc(imageW * imageH * sizeof(float));
	if(h_Buffer == NULL) {
        free(h_Filter);
        free(h_Buffer);
		printf("h_buffer error\n");
		return -1;
	}

    h_OutputCPU = (float *)malloc(imageW * imageH * sizeof(float)); 
	if(h_OutputCPU == NULL) { 
        free(h_Buffer);
        free(h_Input);
        free(h_Filter);
		printf("h_outputCPU error\n"); 
		return -1; 
	}

    h_OutputGPU = (float *)malloc(imageW_padded * imageH_padded * sizeof(float)); 
	if(h_OutputGPU == NULL) { 
		free(h_OutputCPU);
        free(h_Buffer);
        free(h_Input);
        free(h_Filter);
		printf("h_outputGPU error\n"); 
		return -1; 
	}

    h_Input_padded  = (float *)malloc(imageW_padded * imageH_padded * sizeof(float));
	if(h_Input_padded == NULL) { 
		free(h_OutputCPU);
		free(h_OutputGPU);
        free(h_Buffer);
        free(h_Input);
        free(h_Filter);
		printf("h_input error\n"); 
		return -1; 
	}

    //Cuda mallocs
    cudaMalloc((void**)&d_Input, imageW_padded * imageH_padded * sizeof(float));
    cudaMalloc((void**)&d_Filter, FILTER_LENGTH * sizeof(float));
    cudaMalloc((void**)&d_OutputGPU, imageW_padded * imageH_padded * sizeof(float));
    cudaMalloc((void**)&d_Buffer, imageW_padded * imageH_padded * sizeof(float));

    cudaError_t error = cudaGetLastError();

    if (error != cudaSuccess) {
        printf("CUDA Error: %s in %s, line %d\n", cudaGetErrorString(error), __FILE__, __LINE__);
        free(h_OutputCPU);
		free(h_OutputGPU);
        free(h_Buffer);
        free(h_Input);
        free(h_Filter);
        free(h_Input_padded);
        cudaFree(d_Input);
        cudaFree(d_Filter);
        cudaFree(d_OutputGPU);
        cudaFree(d_Buffer);
        cudaDeviceReset();
        return 1;
    }

    // to 'h_Filter' apotelei to filtro me to opoio ginetai to convolution kai
    // arxikopoieitai tuxaia. To 'h_Input' einai h eikona panw sthn opoia ginetai
    // to convolution kai arxikopoieitai kai auth tuxaia.

    srand(200);

    for (i = 0; i < FILTER_LENGTH; i++) {
        h_Filter[i] = (float)(rand() % 16);
    }

    //We first initialize as before the input array
    for (i = 0; i < imageW * imageH; i++) {
      h_Input[i] = (float)rand() / ((float)RAND_MAX / 255) + (float)rand() / (float)RAND_MAX;
    }


    printf("CPU computation...\n");
    start_time_cpu = wtime();
    convolutionRowCPU(h_Buffer, h_Input, h_Filter, imageW, imageH, filter_radius); // convolution kata grammes
    convolutionColumnCPU(h_OutputCPU, h_Buffer, h_Filter, imageW, imageH, filter_radius); // convolution kata sthles
    end_time_cpu = wtime();
    
    //Then copy to the right position of the padded array the corresponding elements of the input array
    for(i = 0; i < imageW_padded; i++) {
      for(j = 0; j < imageH_padded; j++) {

        if( ( i < filter_radius ) || ( i >= filter_radius + imageW ) || ( j < filter_radius )|| ( j >= filter_radius + imageH )) {
          //Padding value must be zero
          h_Input_padded[i*(imageH_padded) + j] = 0;
        } else {
          h_Input_padded[i*(imageH_padded) + j] = h_Input[(i - filter_radius)*imageH + j - filter_radius];
        }
      }
    }


    printf("Copy data to the GPU\n");
    timer.Start();
    cudaMemcpy(d_Input, h_Input_padded, imageW_padded * imageH_padded * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(d_Filter, h_Filter, FILTER_LENGTH * sizeof(float), cudaMemcpyHostToDevice);

    error = cudaGetLastError();
    if (error != cudaSuccess) {
      printf("CUDA Error: %s in %s, line %d\n", cudaGetErrorString(error), __FILE__, __LINE__);
      free(h_OutputCPU);
	    free(h_OutputGPU);
      free(h_Buffer);
      free(h_Input);
      free(h_Filter);
      free(h_Input_padded);
      cudaFree(d_Input);
      cudaFree(d_Filter);
      cudaFree(d_OutputGPU);
      cudaFree(d_Buffer);
      cudaDeviceReset();
      return 1;
    }  

    printf("GPU computation...\n");

    //Change grid dimensions for padded arrays
    dim3 grid_dim((imageW_padded + 31) / 32, (imageH_padded + 31) / 32);
    dim3 block_dim(32, 32);
    
    convolutionRowGPU<<<grid_dim, block_dim>>>(d_Buffer, d_Input, d_Filter, imageW_padded, imageH_padded, filter_radius);
    cudaDeviceSynchronize();               

    convolutionColumnGPU<<<grid_dim, block_dim>>>(d_OutputGPU, d_Buffer, d_Filter, imageW_padded, imageH_padded, filter_radius);

    cudaMemcpy(h_OutputGPU, d_OutputGPU, imageW_padded * imageH_padded * sizeof(float), cudaMemcpyDeviceToHost);
    timer.Stop();

    error = cudaGetLastError();
    if (error != cudaSuccess) {
      printf("CUDA Error: %s in %s, line %d\n", cudaGetErrorString(error), __FILE__, __LINE__);
      free(h_OutputCPU);
	  free(h_OutputGPU);
      free(h_Buffer);
      free(h_Input);
      free(h_Filter);
      free(h_Input_padded);
      cudaFree(d_Input);
      cudaFree(d_Filter);
      cudaFree(d_OutputGPU);
      cudaFree(d_Buffer);
      cudaDeviceReset();
      return 1;
    } 

    // Elegxos apotelesmatos
    int error_count = 0;
    for(i = 0; i < imageW_padded; i++) {
      for(j = 0; j < imageH_padded; j++) {

        if(i >= filter_radius && i < filter_radius + imageW && j >= filter_radius && j < filter_radius + imageH) {
          if (ABS(h_OutputCPU[(i - filter_radius)*(imageW) + j - filter_radius] - h_OutputGPU[i*(imageW_padded) + j]) > accuracy) {
            error_count++;
          }
          if(ABS(h_OutputCPU[(i - filter_radius)*(imageW) + j - filter_radius] - h_OutputGPU[i*(imageW_padded) + j]) > 0) {
            //printf("Difference %f filter size %d\n", ABS(h_OutputCPU[(i - filter_radius)*(imageW) + j - filter_radius] - h_OutputGPU[i*(imageW_padded) + j]), FILTER_LENGTH);
          } 
        }
      }
    }
    
    printf("Number of errors: %d\n", error_count);
    printf("CPU Time: %f sec\n", end_time_cpu - start_time_cpu);
    printf("GPU Time: %f sec\n", timer.Elapsed()/1000);

    // free all the allocated memory
    free(h_OutputCPU);
	free(h_OutputGPU);
    free(h_Buffer);
    free(h_Input);
    free(h_Filter);
    free(h_Input_padded);
    cudaFree(d_Input);
    cudaFree(d_Filter);
    cudaFree(d_OutputGPU);
    cudaFree(d_Buffer);

    // Do a device reset just in case... 
    cudaDeviceReset();

    return 0;
}
