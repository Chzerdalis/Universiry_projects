# Lab Project: Concurrent Programming & Thread Synchronization

This project consists of four exercises focused on managing shared resources and synchronizing threads using the **POSIX Threads (Pthreads)** library in C. It progresses from implementing low-level synchronization primitives to solving complex coordination problems.

---

## 🛠️ Exercise 1: Custom Semaphore Library
**Files:** `ask1.h`, `ask1.c`

The objective of this exercise was to build a custom semaphore implementation (`mysem_t`) from scratch. Since standard semaphores are typically provided by the OS, this task required using **Pthread Mutexes** and **Condition Variables** to emulate semaphore behavior.

* **Core Functions:** The library provides `mysem_init`, `mysem_up` (signal), `mysem_down` (wait), and `mysem_destroy`.
* **State Management:** The structure tracks an integer value (`val`), an initialization flag (`init`), and a count of waiting threads (`wait`) to ensure correct blocking and signaling.

---

## 🔢 Exercise 2: Multi-threaded Prime Checker
**File:** `ask2.c`

This exercise implements a **Producer-Consumer** model to perform parallel computations.

* **The Producer (Main Thread):** Reads integers from user input and places them into a shared buffer (or shared variable).
* **The Consumers (Worker Threads):** A pool of $N$ threads wait for work. When a number is available, a thread grabs it, checks if it is prime using the `isPrime` function, and outputs the result.
* **Termination:** The system gracefully shuts down all worker threads when the user inputs `-1`.

---

## 🌉 Exercise 3: The Narrow Bridge Problem
**File:** `ask3.c`

This exercise simulates a narrow bridge that can only be crossed by one direction of traffic (Red or Blue) at a time and has a maximum weight capacity.

* **Traffic Management:** Red and Blue "cars" are represented by threads that must acquire permission before "entering" the bridge.
* **Coordination:** It uses the custom semaphores from Exercise 1 to track how many cars are currently on the bridge (`car_on_brige`) and ensures that if Blue cars are crossing, Red cars must wait, and vice versa.
* **The Controller:** A consumer thread simulates the bridge's capacity management, signaling when cars "exit" so new ones can enter.

---

## 🎢 Exercise 4: The Roller Coaster Problem
**File:** `ask4.c`

This exercise models a synchronization barrier where a "Train" thread and multiple "Passenger" threads must interact.

* **Boarding Logic:** Passengers arrive and wait in line. The train cannot start until it has reached its `max_passengers` capacity.
* **Ride Execution:** Once full, the train thread "runs" (simulated by `sleep`), and the passengers must wait until the ride is finished before they can unblock and exit.
* **Dynamic Arrival:** The program accepts user input to define specific time intervals and quantities for spawning new passenger threads.

