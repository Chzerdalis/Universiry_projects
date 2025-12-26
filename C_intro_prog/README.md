This repository contains a series of four C projects focusing on **Data Structures**, **Memory Management**, and **System Programming**.

---

## Project 1: Student Registry with Dynamic Arrays
A memory-resident database system for managing student records.

### Key Features
* **Student Records**: Stores AEM (ID), name, and number of failed courses.
* **Dynamic Memory**: Each record is allocated dynamically.
* **Dynamic Pointer Array**: Maintains a pointer array that grows or shrinks by a constant factor $K$ based on occupancy.
* **Search Algorithms**: Implements **Linear Search** for unsorted data and **Binary Search** for sorted data.
* **Sorting**: Uses **Insertion Sort** to organize students by AEM.
* **Commands**: Supports `add`, `rmv`, `mod`, `find`, `sort`, `print`, `clear`, and `quit`.

---

## Project 2: Advanced Structures & Hashing
An extension of Project 1 that introduces course management and optimized searching.

### Key Features
* **Course Enrollment**: Students' courses are stored in a **Singly Linked List** inside their record, sorted by course ID.
* **Fast Search**: Implements a **Hash Table** with chaining for lookups by surname.
* **Dynamic Hashing**: The table automatically doubles or halves its size based on the **Load Factor** (HIGH_LOAD/LOW_LOAD).
* **Hash Function**: Use of `djb2` string hashing algorithm.

---

## Project 3: Object Database Interface
A command-line utility for managing binary data objects within a persistent database file.

### Key Features
* **File Management**: Opens and closes database files using low-level file descriptors.
* **Import/Export**: Facilitates moving data objects between the database and external files.
* **Data Retrieval**: Features a search mechanism that returns associated names in a dynamic table.
* **Memory Safety**: Actively manages dynamic memory for strings and tables to prevent leaks.

---

## Project 4: Automated Grading System
A systems-level tool designed to compile, execute, and evaluate the performance of other C programs.

### Key Features
* **Automated Compilation**: Use of `fork()` and `exec()` to call `gcc` and monitors `stderr` for errors or warnings.
* **Execution & IPC**: Executes student programs and pipes their output to a comparison utility (`p4diff.c`).
* **Safety & Monitoring**:
    * **Timeouts**: Use of `setitimer` and `SIGALRM` to terminate infinite loops.
    * **Memory Protection**: Detects segmentation faults (`SIGSEGV`) and other signals.
* **Grading**: Generates a score based on compilation success, output correctness, and execution behavior.
