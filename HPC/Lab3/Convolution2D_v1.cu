/*
* This sample implements a separable convolution 
* of a 2D image with an arbitrary filter.
*/

#include <stdio.h>
#include <stdlib.h>

unsigned int filter_radius;

#define FILTER_LENGTH 	(2 * filter_radius + 1)
#define ABS(val)  	((val)<0.0 ? (-(val)) : (val))
#define accuracy  	0.00005 

 

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

		h_Dst[y * imageW + x] = sum;
		}
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

		h_Dst[y * imageW + x] = sum;
		}
    }
  }
    
}

//We implement two different kernels for rows and columns instead a united one 
//in order to copy the CPU implementation 
__global__ void convolutionRowGPU(float *d_Dst, const float *d_Src, const float *d_Filter, const int imageW, const int imageH, const int filterR) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    //We dont need this check since we work inside one block and we specify the amount of threads
    //When working on a 2d grid this check is necessary
    //if (x < imageW && y < imageH) {
      float sum = 0;

      for (int k = -filterR; k <= filterR; k++) {
        int d = x + k;

        if (d >= 0 && d < imageW) {
          sum += d_Src[y * imageW + d] * d_Filter[filterR - k];
        }
		d_Dst[y * imageW + x] = sum;
	}
    //}
}

__global__ void convolutionColumnGPU(float *d_Dst, const float *d_Src, const float *d_Filter, const int imageW, const int imageH, const int filterR) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    //if (x < imageW && y < imageH) {
      float sum = 0;

      for (int k = -filterR; k <= filterR; k++) {
        int d = y + k;

        if (d >= 0 && d < imageH) {
          sum += d_Src[d * imageW + x] * d_Filter[filterR - k];
        }
		d_Dst[y * imageW + x] = sum;
	}
    //}
} 

////////////////////////////////////////////////////////////////////////////////
// Main program
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
    
    float
    *h_Filter,
    *h_Input,
    *h_Buffer,
    *h_OutputCPU;

    float *d_OutputGPU, *d_Input, *d_Filter, *h_OutputGPU, *d_Buffer;


    int imageW;
    int imageH;
    unsigned int i;

    printf("Enter filter radius : ");
    scanf("%d", &filter_radius);

    printf("Enter image size. Should be a power of two and greater than %d : ", FILTER_LENGTH);
    scanf("%d", &imageW);
    imageH = imageW;

    printf("Image Width x Height = %i x %i\n\n", imageW, imageH);
    printf("Allocating and initializing host arrays...\n");
    
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

    h_OutputGPU = (float *)malloc(imageW * imageH * sizeof(float)); 
	if(h_OutputGPU == NULL) { 
		free(h_OutputCPU);
        free(h_Buffer);
        free(h_Input);
        free(h_Filter);
		printf("h_outputGPU error\n"); 
		return -1; 
	}


    //Cuda mallocs
    cudaMalloc((void**)&d_Input, imageW * imageH * sizeof(float));
    cudaMalloc((void**)&d_Filter, FILTER_LENGTH * sizeof(float));
    cudaMalloc((void**)&d_OutputGPU, imageW * imageH * sizeof(float));
    cudaMalloc((void**)&d_Buffer, imageW * imageH * sizeof(float));

    cudaError_t error = cudaGetLastError();

    if (error != cudaSuccess) {
        printf("CUDA Error: %s in %s, line %d\n", cudaGetErrorString(error), __FILE__, __LINE__);
        free(h_OutputCPU);
		free(h_OutputGPU);
        free(h_Buffer);
        free(h_Input);
        free(h_Filter);
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

    for (i = 0; i < imageW * imageH; i++) {
        h_Input[i] = (float)rand() / ((float)RAND_MAX / 255) + (float)rand() / (float)RAND_MAX;
    }

    printf("Copy data to the GPU\n");
    cudaMemcpy(d_Input, h_Input, imageW * imageH * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(d_Filter, h_Filter, FILTER_LENGTH * sizeof(float), cudaMemcpyHostToDevice);

    error = cudaGetLastError();
    if (error != cudaSuccess) {
      printf("CUDA Error: %s in %s, line %d\n", cudaGetErrorString(error), __FILE__, __LINE__);
      free(h_OutputCPU);
	  free(h_OutputGPU);
      free(h_Buffer);
      free(h_Input);
      free(h_Filter);
      cudaFree(d_Input);
      cudaFree(d_Filter);
      cudaFree(d_OutputGPU);
      cudaFree(d_Buffer);
      cudaDeviceReset();
      return 1;
    }  

    printf("CPU computation...\n");

    convolutionRowCPU(h_Buffer, h_Input, h_Filter, imageW, imageH, filter_radius); // convolution kata grammes
    convolutionColumnCPU(h_OutputCPU, h_Buffer, h_Filter, imageW, imageH, filter_radius); // convolution kata sthles

    printf("GPU computation...\n");

    //Only one block
    dim3 grid_dim(1, 1);
    //Exact number of threads
    dim3 block_dim(imageW, imageH);
    
    convolutionRowGPU<<<grid_dim, block_dim>>>(d_Buffer, d_Input, d_Filter, imageW, imageH, filter_radius);
    cudaDeviceSynchronize();               

    convolutionColumnGPU<<<grid_dim, block_dim>>>(d_OutputGPU, d_Buffer, d_Filter, imageW, imageH, filter_radius);
    
    //Memcopy acts as a barrier
    cudaMemcpy(h_OutputGPU, d_OutputGPU, imageW * imageH * sizeof(float), cudaMemcpyDeviceToHost);

    error = cudaGetLastError();
    if (error != cudaSuccess) {
      cudaDeviceReset();
      printf("CUDA Error: %s in %s, line %d\n", cudaGetErrorString(error), __FILE__, __LINE__);
      free(h_OutputCPU);
	  free(h_OutputGPU);
      free(h_Buffer);
      free(h_Input);
      free(h_Filter);
      cudaFree(d_Input);
      cudaFree(d_Filter);
      cudaFree(d_OutputGPU);
      cudaFree(d_Buffer);
      cudaDeviceReset();
      return 1;
    } 

    // Elegxos apotelesmatos
    int error_count = 0;
	double maxDiff = 0.0;
    for (i = 0; i < imageW * imageH; i++) {
		double diff = ABS(h_OutputCPU[i] - h_OutputGPU[i]) ;
        if (diff > maxDiff) {
			maxDiff = diff;
		}
		if ( diff > accuracy) {
          //printf("Error at index %d: CPU = %f, GPU = %f\n", i, h_OutputCPU[i], h_OutputGPU[i]);
            error_count++;
        }
        if( diff > 0) {
          //printf("Difference %f filter size %d proportion %f\n", ABS(h_OutputCPU[i] - h_OutputGPU[i]), FILTER_LENGTH, ABS(h_OutputCPU[i] - h_OutputGPU[i]) / FILTER_LENGTH);
        }
    }
    printf("Number of errors: %d , max diff %f \n", error_count, maxDiff);

    // free all the allocated memory
    free(h_OutputCPU);
	free(h_OutputGPU);
    free(h_Buffer);
    free(h_Input);
    free(h_Filter);
    cudaFree(d_Input);
    cudaFree(d_Filter);
    cudaFree(d_OutputGPU);
    cudaFree(d_Buffer);

    // Do a device reset just in case...
    cudaDeviceReset();

    return 0;
}
