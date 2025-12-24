#ifndef _GRAPH_HPP_
#define _GRAPH_HPP_

#include <list>
#include <ostream>
#include <vector>
#include <iostream>
#include <fstream>
#include <map>
#include <queue>
#include <limits>
#include <string>
#include <cmath>
#include <set>

struct Edge {
    long int from;
    long int to;
    int dist;
    std::string streetName;

    Edge(long int f, long int t, int d, const std::string& s)
        : from(f), to(t), dist(d), streetName(s) {
    }

    bool operator<(const Edge& e) const { // Operator used in priority queue
        return dist > e.dist;
    }
    bool operator>(const Edge& e) const {
        return dist < e.dist;
    }

    friend std::ostream& operator<<(std::ostream& out, const Edge& e) {
        out << e.from << " -- " << e.to << " (" << e.dist << ")";
        return out;
    }
};

struct Node {
    long int object;
    int distance; // Used in priority queue in Dijkstra algorithm
    std::list<Edge> listEdges; // Contains all neighbor edges
    double latitude;
    double longitude;

    bool operator<(const Node& n) const { // Operator used in priority queue
        return distance > n.distance;
    }
    bool operator>(const Node& n) const {
        return distance < n.distance;
    }
};

class Graph {
    std::vector<Node> nodes;               // Our structure is a vector of nodes with lists of edges
    std::map<long int, int> position;           // Shows which node is older or newer
    bool directed;
    int num_nodes = 1;

public:
    Graph(bool isDirectedGraph = true) : directed(isDirectedGraph) {
        nodes.resize(0);
    }

    bool contains(const long int& info) {
        for (auto& node : nodes) {
            if (node.object == info) {
                return true;
            }
        }
        return false;
    }

    bool addVtx(const long int& info, double lat = 0, double lon = 0) {
        if (contains(info)) {
            return false;
        }
        Node newN;
        newN.object = info;
        newN.latitude = lat;
        newN.longitude = lon;
        newN.distance = std::numeric_limits<int>::max();
        nodes.push_back(newN);
        position.insert(std::pair<long int, int>(info, num_nodes++));
        return true;
    }

    bool rmvVtx(const long int& info) {
        if (!contains(info)) {
            return false;
        }

        auto it_1 = nodes.begin();
        for (; it_1 != nodes.end(); ++it_1) {
            if (it_1->object == info) {
                break;
            }
        }
        // Remove all edges from any node that point to this vertex
        //std::cout << "Removing edges from other nodes to " << it_1->object << "\n";
        for (auto& node : nodes) {
            for (auto it = node.listEdges.begin(); it != node.listEdges.end();) {
                if (it->to == it_1->object) {
                    it = node.listEdges.erase(it);
                    std::cout << "Removed edge from " << node.object << " to " << it_1->object << "\n";
                }
                else {
                    ++it;
                }
            }
        }

        it_1->listEdges.clear();
        int removedObject = it_1->object;
        nodes.erase(it_1);
        position.erase(removedObject);
        return true;
    }

    bool addEdg(const long int& from, const long int& to, int distance, const std::string& streetName) {
        if (!(contains(from) && contains(to))) {
            std::cout << "Cannot add edge from " << from << " to " << to << "\n";
            return false;
        }
        auto it_1 = nodes.begin();
        for (; it_1 != nodes.end(); ++it_1) {
            if (it_1->object == from) {
                break;
            }
        }
        auto pos = it_1->listEdges.begin();
        for (auto it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); ++it_2) {
            if (it_2->to == to) {
                return false;
            }
            // Checks for order: from older nodes to newer nodes
            if (position.at(it_2->to) < position.at(to)) {
                pos = it_2;
                pos++;
            }
        }
        
        Edge newE(from, to, distance, streetName);
        it_1->listEdges.insert(pos, newE);

        if (!directed) {
            addEdg(to, from, distance, streetName);
        }

        return true;
    }

    bool rmvEdg(const long int& from, const long int& to) {
        if (!(contains(from) && contains(to))) {
            return false;
        }
        auto it_1 = nodes.begin();
        for (; it_1 != nodes.end(); ++it_1) {
            if (it_1->object == from) {
                break;
            }
        }
        for (auto it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); ++it_2) {
            if (it_2->to == to) {
                it_1->listEdges.erase(it_2);
                if (!directed) {
                    rmvEdg(to, from);
                }
                return true;
            }
        }
        return false;
    }

    std::list<long int> dfs(const long int& info) {
        std::list<long int> dfsOrder;
        std::map<long int, bool> boolMap;
        if (!contains(info)) {
            return dfsOrder;
        }
        for (auto& node : nodes) {
            boolMap.insert(std::pair<int, bool>(node.object, false));
        }
        dfsRecur(info, dfsOrder, boolMap);
        return dfsOrder;
    }

    void dfsRecur(const long int& info, std::list<long int>& dfsOrder, std::map<long int, bool>& boolMap) {
        auto it = nodes.begin();
        for (; it != nodes.end(); ++it) {
            if (it->object == info)
                break;
        }
        dfsOrder.push_back(it->object);
        boolMap[it->object] = true;
        for (auto& edge : it->listEdges) {
            if (boolMap[edge.to] == false) {
                dfsRecur(edge.to, dfsOrder, boolMap);
            }
        }
    }

    std::list<long int> bfs(const long int& info) {
        std::map<long int, bool> boolMap;
        std::list<long int> bfsOrder;
        if (!contains(info)) {
            return bfsOrder;
        }
        for (auto& node : nodes) {
            boolMap.insert(std::pair<int, bool>(node.object, false));
        }
        std::queue<int> queue;
        queue.push(info);
        while (!queue.empty()) {
            int obj = queue.front();
            queue.pop();

            if (!boolMap[obj]) {
                boolMap[obj] = true;
                bfsOrder.push_back(obj);
                std::cout << "BFS: " << obj << "\n";
                auto it = nodes.begin();
                for (; it != nodes.end(); ++it) {
                    if (it->object == obj)
                        break;
                }
                for (auto& edge : it->listEdges) {
                    if (!boolMap[edge.to]) {
                        queue.push(edge.to);
                    }
                }
            }
        }
        return bfsOrder;
    }

    bool print2DotFile(const char *filename) const {
        std::ofstream file(filename);
        if (!file.is_open()) {
            return false;
        }

        file << "digraph G {\n";
        for (auto const & node : nodes) {
            for (auto const & edge : node.listEdges) {
                file << "    " << node.object << " -> " << edge.to
                     << "[label = \"" << edge.streetName << "\n" << edge.dist << "\" ];\n";
            }
        }
        file << "}\n";
        return true;
    }

    std::list<long int> dijkstra(const long int& from, const long int& to) {
        std::list<long int> path;
        std::priority_queue<Node> pqueue;
        std::map<long int, int> nodeDistances; // Distance from start node
        std::map<long int, bool> verified;     // Node visited flag
        std::map<long int, long int> prev;          // To reconstruct path

        for (auto& node : nodes) {
            verified.insert(std::pair<long int, bool>(node.object, false));
            prev.insert(std::pair<long int, int>(node.object, node.object));
            if (node.object == from) {
                nodeDistances.insert(std::pair<long int, int>(node.object, 0));
            } else {
                nodeDistances.insert(std::pair<long int, int>(node.object, std::numeric_limits<int>::max()));
            }
        }

        auto it = nodes.begin();
        for (; it != nodes.end(); ++it) {
            if (it->object == from) {
                break;
            }
        }
        it->distance = 0;
        pqueue.push(*it);

        Node currentNode;
        while (!pqueue.empty()) {
            currentNode = pqueue.top();
            pqueue.pop();

            if (!verified[currentNode.object]) {
                verified[currentNode.object] = true;

                if (currentNode.object == to) {
                    break;
                }

                for (auto& edge : currentNode.listEdges) {
                    if (!verified[edge.to]) {
                        int newDist = nodeDistances[currentNode.object] + edge.dist;
                        if (newDist < nodeDistances[edge.to]) {
                            nodeDistances[edge.to] = newDist;
                            prev[edge.to] = currentNode.object;

                            auto it2 = nodes.begin();
                            for (; it2 != nodes.end(); ++it2) {
                                if (it2->object == edge.to)
                                    break;
                            }
                            it2->distance = newDist;
                            pqueue.push(*it2);
                        }
                    }
                }
            }
        }
        if (currentNode.object != to) {
            return path;
        }
        path.push_front(currentNode.object);
        while (currentNode.object != from) {
            currentNode.object = prev[currentNode.object];
            path.push_front(currentNode.object);
        }
        return path;
    }

    int find_distance(const long int& from, const long int& to) {
        auto it_1 = nodes.begin();
        for (; it_1 != nodes.end(); ++it_1) {
            if (it_1->object == from)
                break;
        }
        auto it_2 = nodes.begin();
        for (; it_2 != nodes.end(); ++it_2) {
            if (it_2->object == to)
                break;
        }
        if (it_1 == nodes.end() || it_2 == nodes.end()) {
            return -1;
        }
        double lat1 = it_1->latitude;
        double lon1 = it_1->longitude;
        double lat2 = it_2->latitude;
        double lon2 = it_2->longitude;

        double distance = std::sqrt((lat2 - lat1) * (lat2 - lat1) +
                                    (lon2 - lon1) * (lon2 - lon1));

        //multiply by 1000000 to convert to int and not lose persision
        return (int)(distance * 1000000);
    }

    void rmvUnusedNodes() {
        std::cout << nodes.size() << "\n";
        std::list<long int> vrxToRemuve;

        for (auto current = nodes.begin(); current != nodes.end(); current++) {  
            //If the current node has no edges   
            if(current->listEdges.size() == 0) {
                int numOfEdgeTo = 0;

                for (auto it_node = nodes.begin(); it_node != nodes.end(); it_node++) {
                    for(auto it_edge = it_node->listEdges.begin(); it_edge != it_node->listEdges.end(); it_edge++) {
                        if(current->object == it_edge->to) {
                            numOfEdgeTo++;
                        }
                    }
                }

                //If no other node points to the current node
                //then we can remove it
                if(numOfEdgeTo == 0) {
                    vrxToRemuve.push_back(current->object);
                }
            }
        }

        for(auto current = vrxToRemuve.begin(); current != vrxToRemuve.end(); current++) {
            rmvVtx(*current);
        }
        std::cout << nodes.size() <<"\n";
    }

    void compactGraph() {
        double distance = 0;
        std::string new_name;
        std::set<long int> assotiated;

        for (auto current = nodes.begin(); current != nodes.end(); current++) {     
            assotiated.clear();

            //If current node points to only one other node possibility to merge
            if(current->listEdges.size() == 1) {
                int numOfEdgeTo = 0;
                typename std::list<Edge>::iterator edgeTo;

                //Search all nodes in the graph to find which point to the currect node
                for (auto it_nodes = nodes.begin(); it_nodes != nodes.end(); it_nodes++) {
                    for(auto it_edges = it_nodes->listEdges.begin(); it_edges != it_nodes->listEdges.end(); it_edges++) {
                        //if a node points to the current node and its not the node that the curent points to
                        if(current->object == it_edges->to && current->listEdges.begin()->to != it_edges->from) {
                            numOfEdgeTo++;
                            //Save iterator for later
                            edgeTo = it_edges;
                        }
                    }
                }
                
                //if only one node points to the current node (not the one that the current node points to)
                if(numOfEdgeTo == 1) {
                    distance = current->listEdges.begin()->dist + edgeTo->dist;

                    //combine the street names if needed
                    if(edgeTo->streetName != current->listEdges.begin()->streetName) {
                        new_name = current->listEdges.begin()->streetName + "-" + edgeTo->streetName;
                    }else{
                        new_name = current->listEdges.begin()->streetName;
                    }

                    addEdg(edgeTo->from, current->listEdges.begin()->to, distance, new_name);
                    rmvEdg(current->object, current->listEdges.begin()->to);
                    rmvEdg(edgeTo->from, current->object);
                }
            //if the current node points to two other nodes possibility to merge
            }else if(current->listEdges.size() == 2) {
                int numOfEdgeTo = 0;

                //This data strucure is used to keep all the nodes assosiated with the current node
                //If only two are assosiated then we can merge
                assotiated.insert(current->listEdges.front().to);
                assotiated.insert(current->listEdges.back().to);

                for (auto it_nodes = nodes.begin(); it_nodes != nodes.end(); it_nodes++) {
                    for(auto it_edges = it_nodes->listEdges.begin(); it_edges != it_nodes->listEdges.end(); it_edges++) {
                        if(current->object == it_edges->to) {
                            //if the nodes are not the ones that the current node points to
                            //the size will be more than two
                            numOfEdgeTo++;
                            assotiated.insert(it_edges->from);
                        }
                    }
                }
                //if two nodes point to the currect node and the current node also points to them 
                //we need to merge
                if(assotiated.size() == 2 && numOfEdgeTo == 2) {
                    distance = current->listEdges.front().dist + current->listEdges.back().dist;

                    if(current->listEdges.front().streetName != current->listEdges.back().streetName) {
                        new_name = current->listEdges.front().streetName  + "-" + current->listEdges.back().streetName;
                    }else{
                        new_name = current->listEdges.front().streetName ;
                    }

                    long int first = current->listEdges.front().to;
                    long int second = current->listEdges.back().to;

                    addEdg(first,  second, distance, new_name);
                    addEdg(second, first, distance, new_name);

                    rmvEdg(current->object, second);
                    rmvEdg(second, current->object);
                    rmvEdg(current->object, first);
                    rmvEdg(first, current->object);
                }
            }
        }
        std::cout << nodes.size() << "\n";
    }

    void printGraph() {
        for (auto& node : nodes) {
            std::cout << "Node: " << node.object << "\n";
            for (auto& edge : node.listEdges) {
                std::cout << "  Edge: " << edge.from << " -- " << edge.to << " (" << edge.dist << ")\n";
            }
        }
    }
};

#endif
