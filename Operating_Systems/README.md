## 🛠️ Project 2: Process Scheduling (SJF Variant)
The goal is to implement a preemptive version of the **Shortest Job First (SJF)** algorithm within a simulated Linux environment.

### 1. Key Concepts
* **Burst Prediction:** Since future CPU burst times are unknown, they are estimated using an exponential aging formula:
    $$Exp\_Burst_{i}=\frac{Burst_{i-1}+\alpha \cdot Exp\_Burst_{i-1}}{1+\alpha}$$
    (where $\alpha = 0.5$).
* **Goodness Metric:** To avoid starvation of processes waiting in the ready queue, a priority value ("Goodness") is calculated:
    $$Goodness(k)_{i}=\frac{1+Exp\_Burst(k)_{i}}{\min_{m=0}^{N}(1+Exp\_Burst(m)_{i})} \cdot \frac{\max_{m=0}^{N}(1+WaitingInRQ(m)_{i})}{1+WaitingInRQ(k)_{i}}$$
    The scheduler always selects the process with the **lowest** Goodness.

### 2. Implementation Scope
* **Target Files:** `schedule.c` and `schedule.h`.
* **Key Functions:** `schedule()`, `scheduler_tick()`, `activate_task()`, `deactivate_task()`, and `sched_fork()` 267, 270, 273, 275, 286, 287.
* **Evaluation:** Students must design execution profiles for interactive (I/O-heavy) and non-interactive (CPU-heavy) applications 243, 244, 245.

---

## 📂 Project 3: Userspace File System (FUSE)
The objective is to implement a "compressing" file system that uses **data deduplication** at the block level.

### 1. Architectural Logic

* **FUSE Framework:** The system runs in userspace, communicating with the Linux Kernel's Virtual File System (VFS) via the FUSE module.
* **Deduplication:** If two blocks (from the same or different files) have identical content, they are stored only once on the disk.
* **Hashing:** SHA1 hashes (via OpenSSL) are used to identify duplicate content without slow byte-by-byte comparisons.

### 2. Design Constraints
* **Block Size:** Fixed at 4KB.
* **Capacity:** Maximum of 10 files, each up to 64KB.
* **Functionality:** Support for `read`, `write`, `mknod`, `unlink`, `readdir`, and `getattr`.
* **Storage:** Files in the "mount" directory are essentially pointers to a hidden "block store" directory containing unique data blocks and hashes.
