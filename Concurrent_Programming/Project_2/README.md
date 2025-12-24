# Concurrent Programming & Synchronization Lab

This project consists of three exercises focused on implementing and utilizing synchronization primitives in C. The lab moves from low-level System V semaphore wrapping to solving complex multi-threaded synchronization problems using POSIX threads.

---

## Exercise 1: Custom Semaphore Library
**Files:** `semaphore.h`, `semaphore.c`, `msemaphore.c`

The goal of this exercise was to create a portable semaphore API (`mysem_t`) by wrapping the standard **System V IPC** semaphore system calls.

* **Logic:** The implementation uses `ftok` to generate unique keys and `semget` to create semaphore sets in the OS.
* **Operations:** * `mysem_init`: Initializes the semaphore with a value of 0 or 1 (Binary/Mutex style).
    * `mysem_down`: Decrements the semaphore (Wait/P operation).
    * `mysem_up`: Increments the semaphore (Signal/V operation).
    * `mysem_destroy`: Removes the semaphore from the system.
* **Testing:** `semaphore.c` includes a command-line interface to manually test the lifecycle of semaphores.

---

## Exercise 2: Sequential Logic
**File:** `nothreads.c`

A baseline sequential program used to demonstrate efficient algorithm design without concurrency.

* **Functionality:** Implements a primality test using the $6k \pm 1$ optimization.
* **Purpose:** Served as a computational task to be compared against later multi-threaded implementations.

---

## Exercise 3: The Narrow Bridge Problem
**File:** `ask3.c`

This is the main application of the lab, simulating a narrow bridge that can only be crossed by one direction of traffic (Red or Blue) at a time, with a limited capacity (`max_cars`).



### Key Components:
* **Producer Threads:** `producer_red` and `producer_blue` represent cars arriving at the bridge. They must wait if cars from the opposite direction are currently crossing or if the bridge is full.
* **Consumer Thread:** Acts as the bridge controller that "clears" cars after they have spent time on the bridge.
* **Synchronization Strategy:**
    * **Mutex:** A `pthread_mutex_t` protects the shared variables like `car_counter` and `car_on_brige`.
    * **Custom Semaphores:** Uses the `mysem_t` library to manage blocking:
        * `s_red` / `s_blue`: Blocks a specific direction if the other has the right of way.
        * `full`: Blocks producers when the bridge capacity is reached.
        * `empty`: Blocks the consumer when there are no cars to process.

---

## How to Run

### Compilation
To compile the bridge simulation (Exercise 3), you need to link the semaphore implementation and the pthread library:
```bash
gcc -o bridge ask3.c semaphore.c -lpthread
