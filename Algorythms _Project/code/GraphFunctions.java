package AlgoProject;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.PriorityQueue;

public class GraphFunctions {
    int[][] graph;
    boolean[][] twoDimGraph;
    int[] numNeighbours;
    int[][] edges;
    int[][] shortedEdges;
    node[] nodes;
    boolean[] nodes1;
    int numOfNodes = 0;
    int sumDist = 0;

    void initGraph(GraphFunctions currentGraph, boolean connected, boolean option) {
        int i, y, c1, c2, sum;

        if(connected) {
            numOfNodes = currentGraph.numOfNodes;
            nodes = new node[numOfNodes + 1];
            numNeighbours = new int[numOfNodes + 1];
            nodes1 = new boolean[numOfNodes + 1];
            twoDimGraph = new boolean[numOfNodes + 1][numOfNodes + 1];
            edges = new int[numOfNodes + 1][numOfNodes + 1];

            for (i = 0; i < numOfNodes + 1; i++) {
                for (y = 0; y < numOfNodes + 1; y++) {
                    twoDimGraph[i][y] = currentGraph.twoDimGraph[i][y];
                }
            }

            for(i = 0; i < numOfNodes + 1; i++) {
                numNeighbours[i] = currentGraph.numNeighbours[i];
            }

            initNodes();
        }else{
            for(i = 1; i < currentGraph.nodes1.length; i++) {
                if(currentGraph.nodes1[i] == option) {
                    numOfNodes++;
                }
            }

            nodes = new node[numOfNodes + 1];
            nodes1 = new boolean[numOfNodes + 1];
            twoDimGraph = new boolean[numOfNodes + 1][numOfNodes + 1];
            numNeighbours = new int[numOfNodes + 1];
            edges = new int[numOfNodes + 1][numOfNodes + 1];

            for (i = 1, c1 = 0; i < currentGraph.numOfNodes + 1; i++) {
                if(currentGraph.nodes1[i] == option) {
                    c1++;
                    for (y = 1, c2 = 0, sum = 0; y < currentGraph.numOfNodes + 1; y++) {
                        if (currentGraph.nodes1[y] == option) {
                            c2++;
                            twoDimGraph[c1][c2] = currentGraph.twoDimGraph[i][y];
                            if(currentGraph.twoDimGraph[i][y]) {
                                sum += 1;
                            }
                        }
                    }
                    numNeighbours[c1] = sum;
                }
            }
            initNodes();
        }
    }

    boolean readGraph(String filename) {
        String line;
        String delimiter = " ";
        ArrayList<int[]> ints = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            // Read the header (if present)
            if ((line = br.readLine()) != null) {
                String[] headers = line.split(delimiter);
                //System.out.println("Headers: ");
                for (String header : headers) {
                    //System.out.print(header + " ");
                }
                System.out.println();
            }

            // Read the rest of the file
            while ((line = br.readLine()) != null) {
                //Use comma as separator
                String[] values = line.split(/*delimiter*/"\\s+");
                ints.add(new int[]{Integer.parseInt(values[0]), Integer.parseInt(values[1])});
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        graph = new int[ints.size()][2];
        for (int i = 0; i < ints.size(); i++) {
            graph[i] = new int[]{ints.get(i)[0], ints.get(i)[1]};
            //System.out.println(graph[i][0] + "->" + graph[i][1]);
        }
        init2dGraph();
        return true;
    }

    void init2dGraph() {
        int max = 0, i, j,neibours = 0;

        for  (i= 0; i < graph.length; i++) {
            if (graph[i][0] > max) { max = graph[i][0];}
            if (graph[i][1] > max) { max = graph[i][1];}
        }
        numOfNodes = max;
        nodes = new node[max + 1];
        nodes1 = new boolean[max + 1];
        numNeighbours = new int[numOfNodes + 1];
        twoDimGraph = new boolean[max + 1][max + 1];
        edges = new int[numOfNodes + 1][numOfNodes + 1];

        for (i = 0; i < graph.length; i++) {
            twoDimGraph[graph[i][0]][graph[i][1]] = true;
            twoDimGraph[graph[i][1]][graph[i][0]] = true;
        }
        for(i = 1; i < twoDimGraph.length; i++) {
            for(j = 1; j < twoDimGraph.length; j++) {
                if(twoDimGraph[i][j]) {
                    numNeighbours[i]++;
                }
            }
        }

        initNodes();
    }

    boolean isConnected() {
        PriorityQueue<node> queue = new PriorityQueue<>(new Comparator());
        node currentNode;
        int num = 0, i;

        if(numOfNodes <= 2) {
            return false;
        }
        for(i = 1; i < numOfNodes + 1; i++) {
            if(nodes[i].neighbours != null) {
                break;
            }
        }
        setDistances(i);
        queue.add(nodes[i]);

        while(!queue.isEmpty()) {
            currentNode = queue.poll();
            if(!currentNode.verified) {
                for (int j = 0; j < currentNode.neighbours.length; j++) {
                    if (!nodes[currentNode.neighbours[j]].verified) {
                        if (nodes[currentNode.neighbours[j]].distance > currentNode.distance + 1) {
                            nodes[currentNode.neighbours[j]].distance = currentNode.distance + 1;
                        }
                        queue.add(nodes[currentNode.neighbours[j]]);
                    }
                }
                currentNode.verified = true;
                num++;
                nodes1[currentNode.node] = true;
            }
        }
        return (num == numOfNodes);
    }

    void calcDijkstra(int start) {
        PriorityQueue<node> queue = new PriorityQueue<>(new Comparator());
        node currentNode;
        setDistances(start);
        queue.add(nodes[start]);

        while(!queue.isEmpty()) {
            currentNode = queue.poll();
            if(!currentNode.verified) {
                for (int j = 0; j < currentNode.neighbours.length; j++) {
                    if (!nodes[currentNode.neighbours[j]].verified) {
                        if (nodes[currentNode.neighbours[j]].distance > currentNode.distance + 1) {
                            nodes[currentNode.neighbours[j]].distance = currentNode.distance + 1;
                        }
                        queue.add(nodes[currentNode.neighbours[j]]);
                    }
                }
                numOfVertices(currentNode.node);
                currentNode.verified = true;
            }
        }

        for (int i = 1; i  < nodes.length; i++) {
            sumDist += (int) nodes[i].distance;
        }
    }

    void numOfVertices(int node) {
        int i, sNode = 0;

        while(nodes[node].distance != 0) {
            for(i = 0; i < nodes[node].neighbours.length; i++) {
                if (nodes[nodes[node].neighbours[i]].verified && nodes[nodes[node].neighbours[i]].distance == nodes[node].distance - 1) {
                    sNode = nodes[node].neighbours[i];
                    break;
                }
            }
            edges[node][sNode]++;
            edges[sNode][node]++;
            node = sNode;
        }
    }

    double calcCPL() {
        int sum = 0;
        double CPL;

        CPL = (double) sumDist / (numOfNodes*(numOfNodes - 1));
        System.out.println("CPL: " + CPL);

        return CPL;
    }

    public class  node {
        int node;
        int[] neighbours;
        double distance;
        boolean verified;

        node(int node) {
            if(numNeighbours[node] == 0) {
                this.neighbours = null;
            }else{
                int j = 0;
                this.neighbours = new int[numNeighbours[node]];
                this.verified = true;
                this.node = node;
                this.distance = Double.POSITIVE_INFINITY;

                for (int i = 1; i < twoDimGraph.length ; i++) {
                    if (twoDimGraph[node][i]) {
                        this.neighbours[j] = i;
                        j++;
                    }
                }
            }
        }
    }

    void sortVertices() {
        int i,j,num = 0;

        for(i = 1; i < twoDimGraph.length; i++) {
            for(j = i; j < twoDimGraph.length; j++) {
                if(twoDimGraph[i][j]) {
                    num++;
                }
            }
        }

        shortedEdges = new int[num][3];
        int z = 0;
        for(i = 1; i < twoDimGraph.length; i++) {
            for(j = i; j < twoDimGraph.length; j++) {
                if(twoDimGraph[i][j]) {
                    shortedEdges[z][0] = i;
                    shortedEdges[z][1] = j;
                    shortedEdges[z++][2] = edges[i][j];
                }
            }
        }
        mergesort(shortedEdges, num);

    }

    public static void merge(int[][] merged, int[][] array1, int[][] array2, int l1, int l2) {
        int i = 0, j = 0, k = 0;

        while (i < l1 && j < l2) {
            if (array1[i][2] <= array2[j][2]) {
                merged[k++] = array1[i++];
            }else {
                merged[k++] = array2[j++];
            }
        }
        while (i < l1) {
            merged[k++] = array1[i++];
        }
        while (j < l2) {
            merged[k++] = array2[j++];
        }
    }

    public static void mergesort(int[][] sorted, int size) {
        if(size < 2){
            return;
        }
        int middle = size/2;
        int[][] left = new int[middle][3];
        int[][] right = new int[size - middle][3];

        System.arraycopy(sorted, 0, left, 0, middle);
        System.arraycopy(sorted, middle, right, 0, size - middle);
        mergesort(left, middle);
        mergesort(right, size - middle);

        merge(sorted, left, right, middle, size - middle);
    }

    void removeVertice() {
        twoDimGraph[shortedEdges[shortedEdges.length - 1][1]][shortedEdges[shortedEdges.length - 1][0]] = false;
        numNeighbours[shortedEdges[shortedEdges.length - 1][1]]--;
        twoDimGraph[shortedEdges[shortedEdges.length - 1][0]][shortedEdges[shortedEdges.length - 1][1]] = false;
        numNeighbours[shortedEdges[shortedEdges.length - 1][0]]--;

        initNodes();
    }

    public class Comparator implements java.util.Comparator<node> {
        @Override
        public int compare(node o1, node o2) {
            return (int) (o1.distance - o2.distance);
        }
    }

    void printNumOfVertices() {
        int i,j = 0;

        //System.out.println("Num of paths that take path:");
        for(i = shortedEdges.length - 1; i >= 0; i--) {
            //System.out.printf("Vertex (%-5d , %5d):%9d\n", vertices[i][0], vertices[i][1], vertices[i][2]);
            j += shortedEdges[i][2];
        }
        System.out.printf("Top vertex (%-5d , %5d):%9d\n", shortedEdges[shortedEdges.length - 1][0], shortedEdges[shortedEdges.length - 1][1], shortedEdges[shortedEdges.length - 1][2]);
        //System.out.println(j);
    }

    void setDistances(int startNode) {
        for (int i = 1; i < nodes.length; i++) {
            nodes[i].distance = Double.POSITIVE_INFINITY;
            nodes[i].verified = false;
        }
        nodes[startNode].distance = 0;

    }
    
    void print2dGraph() {
        System.out.print("   ");
        for (int j = 1; j < twoDimGraph.length; j++) {
            System.out.print(j + " ");
            if (j < 10) {
                System.out.print(" ");
            }
        }
        System.out.println();
        for (int i = 1; i < twoDimGraph.length; i++) {
            System.out.print(i+" ");
            if (i < 10) {
                System.out.print(" ");
            }
            for (int j = 1; j < twoDimGraph.length; j++) {
                if(twoDimGraph[i][j]) {
                    System.out.print(1 + "  ");
                }else{
                    System.out.print(0 + "  ");
                }
            }
            System.out.println();
        }
        System.out.print("\n");
    }

    void initNodes() {
        int i;

        for (i = 1; i < twoDimGraph.length; i++) {
            nodes[i] = new node(i);
        }
    }

    void deleteGraph() {
        int i;
        for(i=0; i < nodes.length; i++) {
            nodes[i] = null;
        }
        graph = null;
        twoDimGraph = null;
        numNeighbours = null;
        shortedEdges = null;
        edges = null;
        nodes = null;
        nodes1 = null;
    }
    //    void printDijkstra() {
//        System.out.print("   ");
//        for (int j = 1; j < dijkstraGraph.length; j++) {
//            System.out.print(j + " ");
//            if (j < 10) {
//                System.out.print(" ");
//            }
//        }
//        System.out.println();
//        for (int i = 1; i < dijkstraGraph.length; i++) {
//            System.out.print(i+" ");
//            if (i < 10) {
//                System.out.print(" ");
//            }
//            for (int j = 1; j < dijkstraGraph.length; j++) {
//                System.out.print(dijkstraGraph[i][j] + "  ");
//            }
//            System.out.println();
//        }
//    }
}
