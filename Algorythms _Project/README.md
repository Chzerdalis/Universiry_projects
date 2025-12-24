# Graph Connectivity and CPL Analysis Project

This project focuses on analyzing the behavior of a graph's **Characteristic Path Length (CPL)** and its **connectivity** as edges are iteratively removed based on their usage frequency.

---

## 🛠 Project Logic & Methodology

The program calculates the shortest paths between all pairs of nodes and identifies the most frequently utilized edge. This edge is then removed, and the process repeats recursively.

### Core Algorithm Steps:
* **Shortest Path Calculation**: Uses the Dijkstra algorithm for every node in the graph.
* **Edge Tracking**: Maintains a two-dimensional array to count the usage frequency of every edge during the Dijkstra calculations.
* **Edge Removal**: Sorts edges by frequency and removes the most used one.
* **Connectivity Check**:
    * If the graph remains **connected**, the process continues on the modified graph.
    * If the graph **splits**, the program recursively analyzes the resulting sub-graphs until the node limit is reached.

---

## 📈 Experimental Findings

The study analyzed three distinct tests. Key observations include:

| Metric | Observation |
| :--- | :--- |
| **CPL by Level** | The average CPL decreases steadily as the graph is divided into smaller sub-graphs. |
| **CPL by Edge Removal** | CPL increases while edges are removed without a split, followed by a sudden drop when the graph disconnects. |
| **Sub-graph Evolution** | In Test 3, sub-graphs often split unequally, leading to temporary CPL spikes in the larger sub-graph immediately after a division. |



---

## 🚀 Execution Instructions

1.  **File Configuration**: Before execution, you **must change the file path on line 14** of the execution script to match your local directory.
2.  **Input Files**: Ensure you use the provided test files, as they are formatted specifically for the program's reader.
3.  **Output**:
    * The program generates **text-based performance data and statistics** via the console.
    * **Note**: The program does not generate graphs. All visual charts in the documentation were created using **Excel**.

---
