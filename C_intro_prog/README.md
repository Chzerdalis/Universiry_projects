# Student Registry & Systems Programming Projects

This repository contains a series of four C projects focusing on **Data Structures**, **Memory Management**, and **System Programming**.

---

## Project 1: Student Registry with Dynamic Arrays
[cite_start]A memory-resident database system for managing student records[cite: 124, 125].

### Key Features
* [cite_start]**Student Records**: Stores AEM (ID), name, and number of failed courses[cite: 129, 130].
* [cite_start]**Dynamic Memory**: Each record is allocated dynamically[cite: 131].
* [cite_start]**Dynamic Pointer Array**: Maintains a pointer array that grows or shrinks by a constant factor $K$ based on occupancy[cite: 132, 134].
* [cite_start]**Search Algorithms**: Implements **Linear Search** for unsorted data and **Binary Search** for sorted data[cite: 188, 189].
* [cite_start]**Sorting**: Uses **Insertion Sort** to organize students by AEM[cite: 192].
* [cite_start]**Commands**: Supports `add`, `rmv`, `mod`, `find`, `sort`, `print`, `clear`, and `quit`[cite: 152].

---

## Project 2: Advanced Structures & Hashing
[cite_start]An extension of Project 1 that introduces course management and optimized searching[cite: 1, 2].

### Key Features
* [cite_start]**Course Enrollment**: Students' courses are stored in a **Singly Linked List** inside their record, sorted by course ID[cite: 7, 8, 9].
* [cite_start]**Fast Search**: Implements a **Hash Table** with chaining for lookups by surname[cite: 26, 36].
* [cite_start]**Dynamic Hashing**: The table automatically doubles or halves its size based on the **Load Factor** (HIGH_LOAD/LOW_LOAD)[cite: 41, 42, 43].
* [cite_start]**Hash Function**: Uses the `djb2` string hashing algorithm[cite: 27, 28, 30, 32].
* [cite_start]**New Operations**: Includes `reg` (register), `unreg` (unregister), `isreg` (check registration), and `find-by-name`[cite: 56].

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
* **Automated Compilation**: Uses `fork()` and `exec()` to call `gcc` and monitors `stderr` for errors or warnings.
* **Execution & IPC**: Executes student programs and pipes their output to a comparison utility (`p4diff.c`).
* **Safety & Monitoring**:
    * **Timeouts**: Uses `setitimer` and `SIGALRM` to terminate infinite loops.
    * **Memory Protection**: Detects segmentation faults (`SIGSEGV`) and other signals.
* **Grading**: Generates a score based on compilation success, output correctness, and execution behavior.

---

## Performance Studies
The projects require detailed performance analysis, specifically comparing:
* [cite_start]**Binary vs. Linear Search**: Measuring comparison counts for various student counts (1k to 100k)[cite: 200, 202].
* [cite_start]**Hash Table Efficiency**: Analyzing comparison counts for the `find-by-name` command[cite: 98].
* [cite_start]**Statistical Analysis**: Calculating min, max, average, and median values from measurement logs[cite: 101, 206].
