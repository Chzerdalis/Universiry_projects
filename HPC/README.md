## Lab 1: Sequential Code Optimization (CPU)
**Objective:** Step-by-step optimization of a sequential application on a CPU and familiarity with experimental measurement principles.

* **Primary Task:** Optimize a C implementation of the **Sobel Filter** for edge detection in grayscale images.
* **Optimization Techniques:**
    * **Loop Transformations:** Loop Interchange, Loop Unrolling (up to 16x), and Loop Fusion.
    * **Code Motion:** Function Inlining and Loop-Invariant Code Motion.
    * **Data Flow:** Common Subexpression Elimination and Strength.
* **Performance Evaluation:** Measurements require calculating the mean and standard deviation from 12 separate executions, discarding the highest and lowest values.

---

## Lab 2: Shared Memory Parallelization (OpenMP)
**Objective:** Parallelization of a sequential application using the OpenMP programming model and evaluation on a multi-core processor.

* **Primary Task:** Parallelize the **k-means clustering** algorithm, which groups observations into $k$ clusters based on distance to the nearest centroid.
* **Implementation Strategy:**
    * Identify performance hotspots through profiling.
    * Apply OpenMP directives to loops while managing private variables.
    * Evaluate performance scalability across 1, 4, 8, 14, 28, and 56 threads.
* **Hardware Target:** Measurements are conducted on a system featuring an **Intel Xeon E5-2695** processor.

---

## Lab 3: Introduction to CUDA Programming (GPU)
**Objective:** Familiarization with the CUDA environment, memory management, and basic GPU kernel development.

* **Primary Task:** Implement a **2D Convolution** filter on the GPU.
* **Technical Focus:**
    * **Memory Management:** Allocation and deallocation of device memory for input images, output images, and filter masks.
    * **Data Transfer:** Moving data from the host to the device and returning results to the host.
    * **Advanced Optimization:** Addressing the **divergence** phenomenon caused by boundary checks and implementing **padding** techniques.
* **Hardware Target:** Development and testing on the **csl-venus** system equipped with **NVIDIA Tesla K80** GPUs.

---

## Lab 4: Advanced GPU Optimization (CUDA)
**Objective:** Parallelization and optimization of a complex image processing application on the GPU.

* **Primary Task:** Implement **Contrast Limited Adaptive Histogram Equalization (CLAHE)** for image contrast enhancement.
* **Workflow Stages:**
    * **Tiled Histogram Generation:** Dividing the image into tiles, calculating local histograms, and applying clipping to limit noise.
    * **CDF & LUT Construction:** Converting clipped histograms into Cumulative Distribution Functions and building mapping tables.
    * **Bilinear Interpolation:** Calculating final pixel values by interpolating between the four nearest tile centers to remove artifacts.
* **Performance Metric:** Execution efficiency is evaluated in **Mpixels/sec** using the largest available images.
