# Pipelined FFT Implementation
[cite_start]**Course:** ECE494 Microprocessor Design [cite: 7, 5]
[cite_start]**Institution:** University of Thessaly, Department of Electrical and Computer Engineering [cite: 7, 14, 15]

## Project Overview
[cite_start]This project presents the design, hardware implementation, and performance evaluation of three distinct Fast Fourier Transform (FFT) architectures on an FPGA platform[cite: 7, 26]. [cite_start]The research analyzes the trade-offs between computational speed, resource utilization, and scalability for real-time digital signal processing[cite: 7, 23, 31].

## Implemented Architectures

### 1. Unrolled Radix-2 and Radix-4
[cite_start]These designs focus on maximizing throughput by exploiting full parallelism[cite: 7, 228].
* [cite_start]**Radix-2:** Splits the DFT into even and odd indices at each of the $log_2(N)$ stages[cite: 7, 43, 116].
* [cite_start]**Radix-4:** More efficient for $N$ as a power of 4, reducing the total number of multiplications and stages ($log_4(N)$) compared to Radix-2[cite: 7, 45, 165].
* [cite_start]**Constraint:** While fast, these architectures suffer from high resource consumption, making them difficult to scale for large input sizes on smaller FPGAs[cite: 7, 20, 307].



### 2. Radix-2 Single-Path Delay Feedback (SDF)
[cite_start]The SDF architecture is designed for resource efficiency and scalability[cite: 7, 312].
* [cite_start]**Hardware Reuse:** It reuses a single butterfly compute unit per stage rather than instantiating one for every operation[cite: 7, 312].
* [cite_start]**Streaming Support:** Naturally supports continuous streaming input and output, which is ideal for real-time applications[cite: 7, 321].
* [cite_start]**Linear Scaling:** Unlike unrolled versions, the SDF scales its resource usage linearly with the input size[cite: 7, 356].



---

## Technical Specifications

* [cite_start]**Data Representation:** Samples are implemented in 32-bit fixed-point format using **Q1.15 scaling** to balance precision with hardware simplicity[cite: 7, 222, 226].
* [cite_start]**Twiddle Factors:** Factors are pre-computed and stored in on-chip distributed memory (LUTRAM/flip-flops) to ensure constant-time access without consuming excessive resources[cite: 7, 173, 176].
* [cite_start]**Memory Management:** A custom memory controller was implemented to stream data serially, overcoming the I/O bandwidth bottlenecks of the FPGA[cite: 7, 269].

---

## Performance Results

### Resource Utilization
* [cite_start]Unrolled versions exceed FPGA capacity at $N=64$ points due to $N log N$ resource growth[cite: 7, 307, 309].
* [cite_start]The SDF architecture successfully implemented up to $N=256$ points with low area overhead[cite: 7, 353, 356].



### Timing and Execution
* [cite_start]**Critical Path:** Radix-4 achieved a significantly better critical path (~7 ns) compared to Radix-2 (~12.5–14 ns) by more effectively utilizing FPGA DSP blocks[cite: 7, 401, 402].
* [cite_start]**Throughput:** The execution time for SDF is generalized by the formula $T_{SDF} = 2N - 2 + log N$, accounting for input streaming and pipeline delays[cite: 7, 434, 435].



### Accuracy
* [cite_start]Hardware outputs were validated against theoretical results, showing an exact match in behavioral simulations[cite: 7, 500].



---

## Tools and Environment
* [cite_start]**Hardware:** ZedBoard FPGA [cite: 7, 513]
* [cite_start]**Languages:** Verilog (HDL), C++ (Software verification), Python (Data generation and analysis) [cite: 7, 513, 514]
* [cite_start]**Design Suite:** Xilinx Vivado (Behavioral and post-implementation simulations) [cite: 7, 512]
