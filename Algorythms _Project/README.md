# Graph Connectivity and CPL Analysis Project

[cite_start]This project focuses on analyzing the behavior of a graph's **Characteristic Path Length (CPL)** and its **connectivity** as edges are iteratively removed based on their usage frequency[cite: 2, 3].

---

## 🛠 Project Logic & Methodology

[cite_start]The program calculates the shortest paths between all pairs of nodes and identifies the most frequently utilized edge[cite: 3]. [cite_start]This edge is then removed, and the process repeats recursively[cite: 12, 16].

### Core Algorithm Steps:
* [cite_start]**Shortest Path Calculation**: Uses the Dijkstra algorithm for every node in the graph[cite: 9, 35].
* [cite_start]**Edge Tracking**: Maintains a two-dimensional array to count the usage frequency of every edge during the Dijkstra calculations[cite: 29, 59].
* [cite_start]**Edge Removal**: Sorts edges by frequency and removes the most used one[cite: 11, 12].
* **Connectivity Check**:
    * [cite_start]If the graph remains **connected**, the process continues on the modified graph[cite: 13, 16].
    * [cite_start]If the graph **splits**, the program recursively analyzes the resulting sub-graphs until the node limit is reached[cite: 17, 24].

---

## 📈 Experimental Findings

[cite_start]The study analyzed three distinct tests[cite: 85]. Key observations include:

| Metric | Observation |
| :--- | :--- |
| **CPL by Level** | [cite_start]The average CPL decreases steadily as the graph is divided into smaller sub-graphs[cite: 115, 163]. |
| **CPL by Edge Removal** | [cite_start]CPL increases while edges are removed without a split, followed by a sudden drop when the graph disconnects[cite: 127, 128]. |
| **Sub-graph Evolution** | [cite_start]In Test 3, sub-graphs often split unequally, leading to temporary CPL spikes in the larger sub-graph immediately after a division[cite: 230, 231]. |



---

## 🚀 Execution Instructions

1.  **File Configuration**: Before execution, you **must change the file path on line 14** of the execution script to match your local directory.
2.  **Input Files**: Ensure you use the provided test files, as they are formatted specifically for the program's reader.
3.  **Output**:
    * The program generates **text-based performance data and statistics** via the console.
    * **Note**: The program does not generate graphs. All visual charts in the documentation were created using **Excel**.

---