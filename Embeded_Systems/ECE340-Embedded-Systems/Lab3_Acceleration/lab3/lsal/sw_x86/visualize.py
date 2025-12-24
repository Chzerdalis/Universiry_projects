import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import argparse
import re


def parse_alignment_data(text):
    """
    Extracts query, database, similarity matrix, and direction matrix from a given text input.
    """
    lines = text.strip().splitlines()

    query = []
    database = []
    similarity_matrix = []
    direction_matrix = []

    # Parse query, database, similarity matrix, and direction matrix
    for i, line in enumerate(lines):
        if line.startswith("Query:"):
            query = line.replace("Query:", "").strip().split()
        elif line.startswith("Database:"):
            database = line.replace("Database:", "").strip().split()
        elif line.startswith("Similarity Matrix:"):
            matrix_lines = lines[i + 1:]
            for l in matrix_lines:
                if l.strip() == "" or l.startswith("Direction Matrix:"):
                    break
                row = [int(x) for x in re.findall(r'\d+', l)]
                similarity_matrix.append(row)
        elif line.startswith("Direction Matrix:"):
            matrix_lines = lines[i + 1:]
            for l in matrix_lines:
                if l.strip() == "":
                    break
                row = [
                    2 if "NW" in x else
                    1 if "N" in x else
                    3 if "W" in x else
                    0 if "C" in x else -1
                    for x in l.split()
                ]
                direction_matrix.append(row)

    return query, database, similarity_matrix, direction_matrix


def plot_similarity_matrix(query, database, matrix):
    matrix = np.array(matrix)
    fig_width = min(20, max(10, len(query) * 0.3))
    fig_height = min(20, max(10, len(database) * 0.3))
    fig, ax = plt.subplots(figsize=(fig_width, fig_height))
    cax = ax.imshow(matrix, cmap="viridis", aspect="auto")
    plt.colorbar(cax)

    ax.set_xticks(range(len(query)))  # Shift x-ticks by 1
    ax.set_yticks(range(len(database)))
    ax.set_xticklabels(query, rotation=90, fontsize=8 if len(query) > 20 else 10)
    ax.set_yticklabels(database, fontsize=8 if len(database) > 20 else 10)

    # ax.set_xticks(np.arange(-0.5, len(query), 1), minor=True)
    # ax.set_yticks(np.arange(-0.5, len(database), 1), minor=True)
    # ax.grid(which="minor", color="black", linestyle="-", linewidth=0.5)
    ax.tick_params(which="minor", size=0)

    if len(query) <= 20 and len(database) <= 20:
        for i in range(len(matrix)):
            for j in range(len(matrix[i])):
                ax.text(j, i, str(matrix[i, j]), va="center", ha="center", color="white")

    ax.set_xlabel("Query")
    ax.set_ylabel("Database")
    plt.title("Similarity Matrix")

    fig.subplots_adjust(left=0.15, right=0.85, top=0.9, bottom=0.15)
    plt.savefig("similarity_matrix.png", dpi=300, bbox_inches="tight")


def plot_direction_matrix(query, database, direction_matrix):
    """
    Plots the direction matrix using arrows to indicate direction.
    Directions:
        0: C (center) - •
        1: N (north)  - ↑
        2: NW         - ↖
        3: W (west)   - ←
    """
    arrow_map = {
        0: (1, 1),    # •
        1: (0, -1),   # ↑
        2: (-1, -1),  # ↖
        3: (-1, 0)    # ←
    }

    scale = 1
    size = max(len(query), len(database)) * scale
    fig, ax = plt.subplots(figsize=(size, size))
    ax.set_aspect('equal')

    ax.set_xlim(-0.5, len(query)-0.5)
    ax.set_ylim(len(database)-0.5, -0.5)  # invert y-axis so (0,0) is top-left

    for i in range(len(database)):
        for j in range(len(query)):
            direction = direction_matrix[i][j]
            if direction == 0:
                # Draw a dot for "center"
                ax.plot(j, i, marker='o', color='k', markersize=4)
            else:
                dx, dy = arrow_map[direction]
                ax.arrow(j, i, dx*0.3, dy*0.3, head_width=0.2, head_length=0.2, fc='k', ec='k')

    ax.set_xticks(range(len(query)))
    ax.set_xticklabels(query, rotation=90, fontsize=8)
    ax.set_yticks(range(len(database)))
    ax.set_yticklabels(database, fontsize=8)

    ax.set_xlabel("Query")
    ax.set_ylabel("Database")
    ax.set_title("Direction Matrix with Arrows")
    ax.grid(False)

    # plt.tight_layout()
    plt.savefig("direction_matrix_arrows.png", dpi=300, bbox_inches="tight")


if __name__ == '__main__':
    matplotlib.use("TkAgg")

    # Argument parser to handle command line arguments
    parser = argparse.ArgumentParser(description="Visualize similarity and direction matrices from alignment data.")
    parser.add_argument("input_file", help="Path to the input file containing alignment data.")
    args = parser.parse_args()

    # Set default file to 'out'
    if args.input_file is None:
        args.input_file = "out"

    # Read the input file
    with open(args.input_file, 'r') as file:
        content = file.read()

    query, database, similarity_matrix, direction_matrix = parse_alignment_data(content)

    plot_similarity_matrix(query, database, similarity_matrix)
    # plot_direction_matrix(query, database, direction_matrix)

    try:
        plt.show()
    except KeyboardInterrupt:
        print("Stopping the program.")
