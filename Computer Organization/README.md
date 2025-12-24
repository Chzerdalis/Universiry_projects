This course, covers the architectural principles of modern computers. The laboratory exercises guide you through MIPS assembly programming, the implementation of processor components in Verilog, and the analysis of memory hierarchy performance.

---

## 💻 Phase 1: MIPS Assembly Programming
In the first phase, you use the **MARS simulator** to understand how software interacts with hardware.

* **Lab 0: Introduction to MARS** – Learning the IDE, basic registers (e.g., `$s0`, `$t0`), and simple loops.
* **Lab 1: Flow Control & Memory** – Implementing `if-else` structures, `for` loops, and accessing arrays in the `.data` segment using `lw` (load word) and `sw` (store word).
* **Lab 2: The Stack & Functions** – Learning the **LIFO (Last In First Out)** nature of the stack to save/restore registers. You must manage "Saved" registers (`$s0-$s7`) which the Callee is responsible for restoring, and "Temporary" registers (`$t0-$t9`) handled by the Caller.
* **Lab 3: Recursion & Floating Point** – Implementing recursive algorithms (like Roman numeral conversion) and performing IEEE 754 arithmetic.

---

## 🛠️ Phase 2: Hardware Design in Verilog
In the second phase, you design the actual hardware components that execute MIPS instructions.

### Component & Single-Cycle Design
* **Lab 4: ALU & Register File** – Building the **Arithmetic Logic Unit (ALU)** to handle operations like AND, OR, ADD, SUB, and SLT. You also design a **Register File** with two read ports and one write port.
* **Lab 5: Single-Cycle MIPS** – Integrating the components into a full processor that executes one instruction per clock cycle, supporting R-format, load/store, and branch instructions.

### Advanced Architecture
* **Lab 6: Pipelining & Hazards** – Transitioning to a **5-stage pipeline**. You implement **Bypass (Forwarding)** to resolve data hazards and **Stalling** to handle dependencies, such as an instruction following a `lw`.
* **Lab 7: Pipelined Branches** – Extending the pipeline to handle jump and branch instructions (`j`, `beq`, `bne`), including flushing mechanisms to clear the pipeline when a branch is taken.



---

## ⚡ Phase 3: Performance Analysis
The final lab focuses on the memory hierarchy and system performance.

* **Lab 8: Cache & K-Means** – Simulating **Set-Associative Caches** and analyzing hit/miss rates. You use **Linux Performance Counters (perf)** on real hardware to optimize the K-Means image compression algorithm by improving its memory access patterns.

---

### MIPS Register Usage Quick-Reference
| Register Group | Registers | Preserved on Call? | Description |
| :--- | :--- | :--- | :--- |
| **$v0 - $v1** | 2 - 3 | No | Function return values  |
| **$a0 - $a3** | 4 - 7 | No | Function arguments  |
| **$t0 - $t9** | 8 - 15, 24 - 25 | No | Temporaries (Caller-saved)  158,|
| **$s0 - $s7** | 16 - 23 | **Yes** | Saved Temporaries (Callee-saved)  |
| **$sp** | 29 | **Yes** | Stack Pointer  |
| **$ra** | 31 | **Yes** | Return A [cite: 158] |
