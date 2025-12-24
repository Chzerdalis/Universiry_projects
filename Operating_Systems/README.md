# Operating Systems (ECE318) - Laboratory Exercises 2024-2025

## 🛠️ Project 2: Process Scheduling (SJF Variant)
[cite_start]The goal is to implement a preemptive version of the **Shortest Job First (SJF)** algorithm within a simulated Linux environment[cite: 194, 223].

### 1. Key Concepts
* [cite_start]**Burst Prediction:** Since future CPU burst times are unknown, they are estimated using an exponential aging formula[cite: 229, 231]:
    $$Exp\_Burst_{i}=\frac{Burst_{i-1}+\alpha \cdot Exp\_Burst_{i-1}}{1+\alpha}$$
    (where $\alpha = 0.5$) [cite_start][cite: 232, 234].
* [cite_start]**Goodness Metric:** To avoid starvation of processes waiting in the ready queue, a priority value ("Goodness") is calculated[cite: 226, 235]:
    $$Goodness(k)_{i}=\frac{1+Exp\_Burst(k)_{i}}{\min_{m=0}^{N}(1+Exp\_Burst(m)_{i})} \cdot \frac{\max_{m=0}^{N}(1+WaitingInRQ(m)_{i})}{1+WaitingInRQ(k)_{i}}$$
    [cite_start]The scheduler always selects the process with the **lowest** Goodness value[cite: 240].

### 2. Implementation Scope
* [cite_start]**Target Files:** `schedule.c` and `schedule.h`[cite: 200, 201].
* [cite_start]**Key Functions:** `schedule()`, `scheduler_tick()`, `activate_task()`, `deactivate_task()`, and `sched_fork()`[cite: 267, 270, 273, 275, 286, 287, 289].
* [cite_start]**Evaluation:** Students must design execution profiles for interactive (I/O-heavy) and non-interactive (CPU-heavy) applications[cite: 243, 244, 245, 246].

---

## 📂 Project 3: Userspace File System (FUSE)
[cite_start]The objective is to implement a "compressing" file system that uses **data deduplication** at the block level[cite: 13, 14, 69].

### 1. Architectural Logic

* [cite_start]**FUSE Framework:** The system runs in userspace, communicating with the Linux Kernel's Virtual File System (VFS) via the FUSE module[cite: 15, 32, 52].
* [cite_start]**Deduplication:** If two blocks (from the same or different files) have identical content, they are stored only once on the disk[cite: 14, 71, 75].
* [cite_start]**Hashing:** SHA1 hashes (via OpenSSL) are used to identify duplicate content without slow byte-by-byte comparisons[cite: 72, 73, 143].

### 2. Design Constraints
* [cite_start]**Block Size:** Fixed at 4KB[cite: 113].
* [cite_start]**Capacity:** Maximum of 10 files, each up to 64KB[cite: 118].
* [cite_start]**Functionality:** Support for `read`, `write`, `mknod`, `unlink`, `readdir`, and `getattr`[cite: 115, 126].
* [cite_start]**Storage:** Files in the "mount" directory are essentially pointers to a hidden "block store" directory containing unique data blocks and hashes[cite: 82, 84, 132, 134].
