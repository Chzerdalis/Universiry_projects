# Read Me: Computer Organization and Design (ECE 232) Labs

[cite_start]This course, covers the architectural principles of modern computers[cite: 1, 55, 418]. [cite_start]The laboratory exercises guide you through MIPS assembly programming, the implementation of processor components in Verilog, and the analysis of memory hierarchy performance[cite: 965, 1023, 1024, 324].

---

## 💻 Phase 1: MIPS Assembly Programming
[cite_start]In the first phase, you use the **MARS simulator** to understand how software interacts with hardware[cite: 971, 980].

* [cite_start]**Lab 0: Introduction to MARS** – Learning the IDE, basic registers (e.g., `$s0`, `$t0`), and simple loops[cite: 966, 981, 1004].
* [cite_start]**Lab 1: Flow Control & Memory** – Implementing `if-else` structures, `for` loops, and accessing arrays in the `.data` segment using `lw` (load word) and `sw` (store word)[cite: 557, 560, 561, 650].
* [cite_start]**Lab 2: The Stack & Functions** – Learning the **LIFO (Last In First Out)** nature of the stack to save/restore registers[cite: 83, 89]. [cite_start]You must manage "Saved" registers (`$s0-$s7`) which the Callee is responsible for restoring, and "Temporary" registers (`$t0-$t9`) handled by the Caller[cite: 160, 162].
* [cite_start]**Lab 3: Recursion & Floating Point** – Implementing recursive algorithms (like Roman numeral conversion) and performing IEEE 754 arithmetic[cite: 4, 18, 49].

---

## 🛠️ Phase 2: Hardware Design in Verilog
[cite_start]In the second phase, you design the actual hardware components that execute MIPS instructions[cite: 1023, 1025].

### Component & Single-Cycle Design
* [cite_start]**Lab 4: ALU & Register File** – Building the **Arithmetic Logic Unit (ALU)** to handle operations like AND, OR, ADD, SUB, and SLT[cite: 1029, 1031]. [cite_start]You also design a **Register File** with two read ports and one write port[cite: 1051, 1053].
* [cite_start]**Lab 5: Single-Cycle MIPS** – Integrating the components into a full processor that executes one instruction per clock cycle, supporting R-format, load/store, and branch instructions[cite: 805, 807, 895].

### Advanced Architecture
* [cite_start]**Lab 6: Pipelining & Hazards** – Transitioning to a **5-stage pipeline**[cite: 475, 476]. [cite_start]You implement **Bypass (Forwarding)** to resolve data hazards and **Stalling** to handle dependencies, such as an instruction following a `lw`[cite: 517, 524, 526].
* [cite_start]**Lab 7: Pipelined Branches** – Extending the pipeline to handle jump and branch instructions (`j`, `beq`, `bne`), including flushing mechanisms to clear the pipeline when a branch is taken[cite: 422, 423, 427].



---

## ⚡ Phase 3: Performance Analysis
[cite_start]The final lab focuses on the memory hierarchy and system performance[cite: 269, 279].

* [cite_start]**Lab 8: Cache & K-Means** – Simulating **Set-Associative Caches** and analyzing hit/miss rates[cite: 261, 267, 271]. [cite_start]You use **Linux Performance Counters (perf)** on real hardware to optimize the K-Means image compression algorithm by improving its memory access patterns[cite: 325, 332, 286].

---

### MIPS Register Usage Quick-Reference
| Register Group | Registers | Preserved on Call? | Description |
| :--- | :--- | :--- | :--- |
| **$v0 - $v1** | 2 - 3 | No | [cite_start]Function return values [cite: 158] |
| **$a0 - $a3** | 4 - 7 | No | [cite_start]Function arguments [cite: 158] |
| **$t0 - $t9** | 8 - 15, 24 - 25 | No | [cite_start]Temporaries (Caller-saved) [cite: 158, 160] |
| **$s0 - $s7** | 16 - 23 | **Yes** | [cite_start]Saved Temporaries (Callee-saved) [cite: 158, 162] |
| **$sp** | 29 | **Yes** | [cite_start]Stack Pointer [cite: 158] |
| **$ra** | 31 | **Yes** | [cite_start]Return Address [cite: 158] |
