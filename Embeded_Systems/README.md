# ECE 340: Embedded Systems Laboratory Overview

## Lab 1: Hardware Design of a Floating Point Unit (FPU)

**Objective:** To design, simulate, and implement a single-precision Floating Point (FP) Adder in Verilog targeting the Xilinx Zedboard.

### Key Components:
* **Standard Compliance:** The design follows the **IEEE 754-1985 standard** for 32-bit single-precision floating point numbers.

* **Architecture:**
    * **Single-Cycle Design:** Initial design focusing on logical correctness through behavioral simulation.
    * **Pipelined Design:** Expansion into a **two-stage pipeline** to improve clock frequency and overall performance.
* **I/O Integration:** The final system displays results using the Zedboard's onboard LEDs and peripheral 7-segment displays (PMOD).
* **User Interface:** Implementation of a data memory system that allows users to scan through test inputs using push buttons, featuring digital **debouncing** and edge detection logic.


---

## Lab 2: Processor-Based SoC Design & SW Development

**Objective:** To introduce the software side of FPGA-based SoCs by creating an ARM Cortex-A9 processor system and integrating custom hardware.

### Key Components:
* **SoC Architecture:** Utilization of the **Zynq-7000 MPSoC**, which partitions the system into the **Processing System (PS)** (ARM cores) and **Programmable Logic (PL)** (FPGA fabric).

* **Communication:** Interfacing PS and PL using the industry-standard **AXI4-Lite** bus.
* **Software Development:**
    * **Polling vs. Interrupts:** Moving from inefficient polling to interrupt-driven systems using the Generic Interrupt Controller (GIC).
    * **Profiling:** Using hardware timers to benchmark code and identify performance bottlenecks.
* **Custom IP Integration:** Converting the Lab 1 FP Adder into a **custom AXI4 peripheral**, allowing the ARM CPU to control and monitor hardware operations.

---

## Lab 3: FPGAs as Accelerators

**Objective:** To accelerate computationally demanding tasks by offloading them from the CPU to dedicated hardware accelerators using **High-Level Synthesis (HLS)**.

### Key Components:
* **Algorithm:** Implementation of **Local Sequence Alignment (LSAL)**, a dynamic programming algorithm used in bioinformatics for DNA/protein comparison.
* **Development Flow:**
    * **Profiling:** Initial implementation on x86 and ARM CPUs, analyzed using the **Roofline Model** and Intel Advisor to detect bottlenecks.

    * **HLS Design:** Using **Vitis HLS** to convert C/C++ code into optimized RTL.
    * **Optimization Directives:** Applying pragmas for **Loop Pipelining ($II=1$)**, **Unrolling**, **Array Partitioning**, and **Memory Bursting** (memcpy) to maximize throughput.
* **System Integration:** Utilizing the **OpenCL API** within the Vitis Unified Software Platform to manage communication between the host (ARM) and the hardware kernel.
* **Environment:** Execution within a **Petalinux** (embedded Linux) environment on the Zedboard.

---

## Toolset and Environment

* **Hardware Design:** Xilinx Vivado (Synthesis, Placement, Routing).
* **Software Design:** Xilinx Vitis IDE / Vitis Unified Software Platform.
* **Development Boards:** Digilent Zedboard (Zynq-7000).
* **OS/Runtime:** Bare-metal (Lab 2) and Petalinux (Lab 3).
