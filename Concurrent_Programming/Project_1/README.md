# Lab: Concurrency, Pipes, and Parallel Sorting

This lab consists of three exercises focused on multithreading, inter-thread communication, and parallel algorithm design using the C programming language and the POSIX Threads (`pthread`) library.

---

## Exercise 1: Multi-threaded Prime Detection
**Files:** `nothreads.c`, `ask2.c`

This exercise explores the transition from sequential processing to a parallelized worker-pool model.

* **Primality Logic:** Both implementations use an optimized algorithm that checks for factors up to $\sqrt{n}$ using the $6k \pm 1$ rule.
* **Sequential Version (`nothreads.c`):** Reads integers in a `while(1)` loop and processes them one by one.
* **Parallel Version (`ask2.c`):**
    * **Worker Pool:** Spawns a user-specified number of worker threads (`num_workers`) that stay active until a termination signal (-1) is received.
    * **Load Balancing:** The main thread reads input and assigns the task to the first available thread by monitoring a `thread_available` flag.
    * **Synchronization:** Uses a shared `info_t` structure to pass data and state between the main thread and workers.

---

## Exercise 2: User-Level Pipe Implementation
**Files:** `p_pipe.c`, `p_pipe.h`, `demo.c`

This exercise involves creating a custom inter-thread communication primitive that mimics standard Unix pipes using a circular buffer.

* **Pipe Library (`p_pipe.c`):**
    * **Management:** Uses a `database_t` to track read/write offsets and a `pipe_descriptor_t` to manage the state of each pipe.
    * **Functionality:** Implements `pipe_open` for allocation, `pipe_write` for data insertion, and `pipe_read` for retrieval.
    * **Blocking Mechanism:** Implements synchronous behavior where `pipe_write` blocks if the buffer is full, and `pipe_read` blocks if the buffer is empty.
* **Demonstration (`demo.c`):**
    * Two threads collaborate to copy a file (`test1.jpeg`) through two separate pipes (`pd1`, `pd2`).
    * Thread 1 reads from a file and writes to Pipe 1, while simultaneously reading from Pipe 2 to write to a copy.
    * Thread 2 reads from Pipe 1 and writes to Pipe 2.



---

## Exercise 3: Recursive External Merge Sort
**File:** `ask3.c`

This exercise implements a parallelized version of the Merge Sort algorithm designed to handle data segments through file I/O.

* **Divide and Conquer:** The program recursively divides the input file into smaller segments.
* **Threshold Logic:** When a segment size is 64 integers or smaller, it is sorted in memory using `insertion_sort` and written back to the file.
* **Parallelism:** For segments larger than 64, the program spawns two child threads (`pthread_create`) to sort each half concurrently.
* **External Merging:** Once child threads finish, the parent thread merges the results using temporary files to maintain sorted order across the specific file range.



---

## Technical Summary

| Feature | Implementation Detail |
| :--- | :--- |
| **Concurrency** | `pthread` library (creation and termination) |
| **I/O Operations** | Binary file handling with `fseek`, `fread`, and `fwrite` |
| **Communication** | Custom circular buffers with blocking logic |
| **Memory** | Dynamic allocation using `malloc` and `realloc` for thread metadata |
