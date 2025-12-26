# Pipelined FFT Implementation

## Project Overview
This project presents the design, hardware implementation, and performance evaluation of three distinct Fast Fourier Transform (FFT) architectures on an FPGA platform. The research analyzes the trade-offs between computational speed, resource utilization, and scalability for real-time digital signal processing.

## Implemented Architectures

### 1. Unrolled Radix-2 and Radix-4
These designs focus on maximizing throughput by exploiting full parallelism.
* **Radix-2:** Splits the DFT into even and odd indices at each of the $log_2(N)$ stages.
* **Radix-4:** More efficient for $N$ as a power of 4, reducing the total number of multiplications and stages ($log_4(N)$) compared to Radix-2.
* **Constraint:** While fast, these architectures suffer from high resource consumption, making them difficult to scale for large input sizes on smaller FPGAs.


### 2. Radix-2 Single-Path Delay Feedback (SDF)
The SDF architecture is designed for resource efficiency and scalability.
* **Hardware Reuse:** It reuses a single butterfly compute unit per stage rather than instantiating one for every operation.
* **Streaming Support:** Naturally supports continuous streaming input and output, which is ideal for real-time applications.
* **Linear Scaling:** Unlike unrolled versions, the SDF scales its resource usage linearly with the input size.

---

## Technical Specifications

* **Data Representation:** Samples are implemented in 32-bit fixed-point format using **Q1.15 scaling** to balance precision with hardware simplicity.
* **Twiddle Factors:** Factors are pre-computed and stored in on-chip distributed memory (LUTRAM/flip-flops) to ensure constant-time access without consuming excessive resources.
* **Memory Management:** A custom memory controller was implemented to stream data serially, overcoming the I/O bandwidth bottlenecks of the FPGA.

---

## Performance Results

### Resource Utilization
* Unrolled versions exceed FPGA capacity at $N=64$ points due to $N log N$ resource growth.
* The SDF architecture successfully implemented up to $N=256$ points with low area overhead.


### Timing and Execution
* **Critical Path:** Radix-4 achieved a significantly better critical path (~7 ns) compared to Radix-2 (~12.5–14 ns) by more effectively utilizing FPGA DSP blocks.
* **Throughput:** The execution time for SDF is generalized by the formula $T_{SDF} = 2N - 2 + log N$, accounting for input streaming and pipeline delays.

### Accuracy
* Hardware outputs were validated against theoretical results, showing an exact match in behavioral simulations.

---

## Tools and Environment
* **Hardware:** ZedBoard FPGA
* **Languages:** Verilog (HDL), C++ (Software verification), Python (Data generation and analysis)
* **Design Suite:** Xilinx Vivado (Behavioral and post-implementation simulations)
