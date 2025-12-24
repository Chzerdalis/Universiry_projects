package AlgoProject;

public class Execution {
    static double[][] PLOT_1 = new double[2][1000];
    static double[] PLOT_2 = new double[10000];
    static int[] PLOT_3 = new int[1000];
    static int k = 0;

    public static void main(String[] args) {
        int i;
        long start = System.currentTimeMillis();
        GraphFunctions graph = new GraphFunctions();

        graph.readGraph("C:\\Users\\Χριστόδουλος\\JAVA\\AlgoPro\\src\\AlgoProject\\karate.edgelist");
        runGraphs(graph,"1", 0, 1);
        long finish = System.currentTimeMillis();
        long timeElapsed = finish - start;
        System.out.println();
        for(i = 0; i < 1000; i++) {
            if(PLOT_1[1][i] == 0) break;
            System.out.println(PLOT_1[1][i] / PLOT_1[0][i]);
        }
        System.out.println();
        for(i = 0; i < 1000; i++) {
            if(PLOT_3[i] == 0) break;
            System.out.println(PLOT_3[i]);
        }
        System.out.println();
        for(i = 0; i < 10000; i++) {
            if(PLOT_2[i] == 0) break;
            System.out.println(PLOT_2[i]);
        }
        System.out.println("\nTime :" + timeElapsed);
    }

    static void runGraphs(GraphFunctions currentGraph, String id, int depth, int bigger) {
        double CPL;
        System.out.println("\nID of graph: " + id);
        System.out.println("Number of nodes: " + currentGraph.numOfNodes);
        if(currentGraph.numOfNodes == 1) {
            return;
        }
        for (int i = 1; i < currentGraph.twoDimGraph.length ; i++) {
            currentGraph.calcDijkstra(i);
        }
        CPL = currentGraph.calcCPL();
        PLOT_1[1][depth] += CPL;
        PLOT_1[0][depth]++;
        if(bigger == 1) {
            PLOT_2[k++] = CPL;
        }
        currentGraph.sortVertices();
        currentGraph.printNumOfVertices();
        currentGraph.removeVertice();
        if(currentGraph.isConnected()) {

            GraphFunctions newGraph = new GraphFunctions();
            newGraph.initGraph(currentGraph, true, true);
            currentGraph.deleteGraph();
            runGraphs(newGraph, id, depth, bigger);
        }else{
            if(currentGraph.numOfNodes == 2) {
                return;
            }
            GraphFunctions newGraph1 = new GraphFunctions();
            GraphFunctions newGraph2 = new GraphFunctions();

            newGraph1.initGraph(currentGraph, false, true);
            newGraph2.initGraph(currentGraph, false, false);
            currentGraph.deleteGraph();
            if(bigger == 1) {
                PLOT_3[depth] = newGraph1.numOfNodes + newGraph2.numOfNodes;
                if (newGraph1.numOfNodes > newGraph2.numOfNodes) {
                    runGraphs(newGraph1, STR."\{id}1", depth + 1, 1);
                    runGraphs(newGraph2, STR."\{id}0", depth + 1, 0);
                } else {
                    runGraphs(newGraph1, STR."\{id}1", depth + 1, 0);
                    runGraphs(newGraph2, STR."\{id}0", depth + 1, 1);
                }
            }else{
                runGraphs(newGraph1, STR."\{id}1", depth + 1, 0);
                runGraphs(newGraph2, STR."\{id}0", depth + 1, 0);
            }
        }
    }
}
