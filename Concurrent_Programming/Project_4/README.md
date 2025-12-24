# Lab Project: User-Level Threading & Concurrency

This project explores the design and implementation of **User-Level Concurrency Mechanisms** in C. It progresses from simple cooperative multitasking to a complex, preemptive user-level thread library with synchronization primitives.

---

## 🛠️ Exercise 1: Cooperative Coroutines
**File:** `ask1.c`

This exercise demonstrates a manual, cooperative multitasking model using the `ucontext.h` library. It implements a **Producer-Consumer** relationship to perform file copying.

* **Logic:** Control is explicitly passed between the Producer and Consumer using `swapcontext`.
* **Producer:** Reads data from an input file into a shared buffer of size 10,000 bytes.
* **Consumer:** Writes data from the buffer to an output file.
* **Switching:** The threads yield control only when the buffer is full or empty, respectively.



---

## 🧵 Exercise 2: Preemptive User-Level Thread Library
**Files:** `ask2.c`, `ask2.h`, `alphabet.c`

The core of the lab is a custom thread library that manages multiple execution contexts without using kernel-level Pthreads.

* **Round-Robin Scheduler:** Manages threads in a circular linked list (`next_thread`, `previous_thread`).
* **Preemptive Scheduling:** Uses a virtual timer (`setitimer`) and the `SIGALRM` signal to force threads to yield control every 1.5 seconds (decaseconds), ensuring fair CPU distribution.
* **Critical Segments:** A `critical_segment` flag is used to protect the scheduler’s internal state, preventing context switches during sensitive operations.
* **Thread Synchronization:** Implements custom semaphores (`mythreads_sem_down`, `mythreads_sem_up`) to manage shared resources.



---

## 📚 Exercise 3: Readers-Writers Problem
**File:** `ask3.c`

This exercise utilizes the thread library developed in Exercise 2 to solve the classic **Readers-Writers** synchronization problem.

* **The Readers:** Multiple threads can read a shared counter simultaneously.
* **The Writer:** A single writer thread must wait for all readers to finish before it can update the counter.
* **Coordination:** Uses the custom semaphore library (`mtx`, `wrt`) to manage access and prevent race conditions.



---

## 🔬 Technical Specifications

| Feature | Details |
| :--- | :--- |
| **Stack Size** | Each thread is allocated an 8KB stack (`STACK_SIZE`). |
| **Context Management** | Utilizes `getcontext`, `makecontext`, and `swapcontext` for state saving. |
| **Preemption** | Triggered by `SIGALRM` via `sigaction`. |
| **Cleanup** | Includes `mythreads_destroy` and `mycoroutines_destroy` to free allocated stacks and contexts. |

---

### **Test Bench: Alphabet Worker**
The file `alphabet.c` tests the library by spawning three threads with different delay intervals. It demonstrates:
1.  **Concurrent Execution:** Threads print the alphabet simultaneously at different speeds.
2.  **Semaphore Locking:** Threads lock the semaphore to print a specific sequence of characters (10–15) without interruption.
