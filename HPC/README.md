# ECE 415: High-Performance Systems Programming - Lab Overview

[cite_start]**Instructor:** Christos D. Antonopoulos [cite: 4, 164, 212, 392]
[cite_start]**Department:** Electrical and Computer Engineering, University of Thessaly [cite: 3, 163, 211, 391]

---

## Lab 1: Sequential Code Optimization (CPU)
[cite_start]**Objective:** Step-by-step optimization of a sequential application on a CPU and familiarity with experimental measurement principles[cite: 218].

* [cite_start]**Primary Task:** Optimize a C implementation of the **Sobel Filter** for edge detection in grayscale images[cite: 222].
* **Optimization Techniques:**
    * [cite_start]**Loop Transformations:** Loop Interchange, Loop Unrolling (up to 16x), and Loop Fusion[cite: 263, 271, 282, 285].
    * [cite_start]**Code Motion:** Function Inlining and Loop-Invariant Code Motion[cite: 295, 306].
    * [cite_start]**Data Flow:** Common Subexpression Elimination and Strength Reduction[cite: 311, 320].
* [cite_start]**Performance Evaluation:** Measurements require calculating the mean and standard deviation from 12 separate executions, discarding the highest and lowest values[cite: 347].

---

## Lab 2: Shared Memory Parallelization (OpenMP)
[cite_start]**Objective:** Parallelization of a sequential application using the OpenMP programming model and evaluation on a multi-core processor[cite: 167, 169].

* [cite_start]**Primary Task:** Parallelize the **k-means clustering** algorithm, which groups observations into $k$ clusters based on distance to the nearest centroid[cite: 170, 171].
* **Implementation Strategy:**
    * [cite_start]Identify performance hotspots through profiling[cite: 184].
    * [cite_start]Apply OpenMP directives to loops while managing private variables[cite: 186, 187].
    * [cite_start]Evaluate performance scalability across 1, 4, 8, 14, 28, and 56 threads[cite: 191].
* [cite_start]**Hardware Target:** Measurements are conducted on a system featuring an **Intel Xeon E5-2695** processor[cite: 174].

---

## Lab 3: Introduction to CUDA Programming (GPU)
[cite_start]**Objective:** Familiarization with the CUDA environment, memory management, and basic GPU kernel development[cite: 6].

* [cite_start]**Primary Task:** Implement a **2D Convolution** filter on the GPU[cite: 86, 95].
* **Technical Focus:**
    * [cite_start]**Memory Management:** Allocation and deallocation of device memory for input images, output images, and filter masks[cite: 103, 104].
    * [cite_start]**Data Transfer:** Moving data from the host to the device and returning results to the host[cite: 105].
    * [cite_start]**Advanced Optimization:** Addressing the **divergence** phenomenon caused by boundary checks and implementing **padding** techniques [cite: 132-134].
* [cite_start]**Hardware Target:** Development and testing on the **csl-venus** system equipped with **NVIDIA Tesla K80** GPUs[cite: 148, 149].

---

## Lab 4: Advanced GPU Optimization (CUDA)
[cite_start]**Objective:** Parallelization and optimization of a complex image processing application on the GPU[cite: 394].

* [cite_start]**Primary Task:** Implement **Contrast Limited Adaptive Histogram Equalization (CLAHE)** for image contrast enhancement[cite: 398, 416].
* **Workflow Stages:**
    * [cite_start]**Tiled Histogram Generation:** Dividing the image into tiles, calculating local histograms, and applying clipping to limit noise [cite: 431-433].
    * [cite_start]**CDF & LUT Construction:** Converting clipped histograms into Cumulative Distribution Functions and building mapping tables[cite: 434].
    * [cite_start]**Bilinear Interpolation:** Calculating final pixel values by interpolating between the four nearest tile centers to remove artifacts [cite: 439-443].
* [cite_start]**Performance Metric:** Execution efficiency is evaluated in **Mpixels/sec** using the largest available images[cite: 466].
