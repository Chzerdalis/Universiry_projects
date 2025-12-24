
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
#include "NegativeGraphCycle.hpp"


template<typename T>
struct Edge {
  T from;
  T to;
  int dist;
  Edge(T f, T t, int d): from(f), to(t), dist(d) {
  }
  bool operator<(const Edge<T>& e) const { //Operator used in priority queue
    return dist > e.dist;
  }
  bool operator>(const Edge<T>& e) const {
    return dist < e.dist;
  }
  template<typename U>
  friend std::ostream& operator<<(std::ostream& out, const Edge<U>& e);
};

template<typename T>
std::ostream& operator<<(std::ostream& out, const Edge<T>& e) {
  out << e.from << " -- " << e.to << " (" << e.dist << ")";
  return out;
};

template<typename T>
//extra struct that helps group the node info 
struct Node {
  T object;
  int distance; //Used in priority queue in Dijstra algorithm
  std::list<Edge<T>> listEdges; //contains all the neighbours og this node
  bool operator<(const Node<T>& n) const { //Operator used in priority queue
    return distance > n.distance;
  }
  bool operator>(const Node<T>& n) const {
    return distance < n.distance;
  }
};

template <typename T>
class Graph {
  typename std::vector<Node<T>> nodes; //Our stucture is a vector of nodes with lists of edges
  typename std::map<T,int> position; //This shows which node is older or newer
  bool directed;
  int num_nodes = 1;

public:
  Graph(bool isDirectedGraph = true) {
    directed = isDirectedGraph;
    nodes.resize(0);    
  };

  bool contains(const T& info) {
    typename std::vector<Node<T>>::iterator it = nodes.begin();
    for(; it != nodes.end(); it++) {
      if(it->object == info) {
        return true;
      }
    }
    return false;
  };

  bool addVtx(const T& info) {
    
    if(contains(info)) {
      return false;
    }
    
    Node<T> newN{info};
    nodes.push_back(newN);
    position.insert(std::pair<T, int>(info, num_nodes++));
    
    return true;
  };

  bool rmvVtx(const T& info) {
    if(!contains(info)) {
      return false;
    }

    typename std::vector<Node<T>>::iterator it_1 = nodes.begin();
    typename std::list<Edge<T>>::iterator it_2 = it_1->listEdges.begin();
    typename std::vector<Node<T>>::iterator it_3 = nodes.begin();

    for(; it_1 != nodes.end(); it_1++) {
      if(it_1->object == info) {
        break;
      }
    }

    //remove all edges
    for(; it_3 != nodes.end(); it_3++) {
      it_2 = it_3->listEdges.begin();
      for(; it_2 != it_3->listEdges.end(); it_2++) {
        if(it_2->to == it_1->object) {
          rmvEdg(it_2->from, it_2->to);
          break;
        }
      }
    }
    
    it_1->listEdges.clear();
    nodes.erase(it_1);
    position.erase(it_1->object);
    return true;
  };

  bool addEdg(const T& from, const T& to, int distance) {
    if(!(contains(from) && contains(to))) {
      return false;
    }
    typename std::vector<Node<T>>::iterator it_1 = nodes.begin(); 
    typename std::list<Edge<T>>::iterator it_2;
    typename std::list<Edge<T>>::iterator pos;

    for(; it_1 != nodes.end(); it_1++) {
      if(it_1->object == from) {
        break;
      }
    }
    pos = it_1->listEdges.begin();
    for(it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
      if(it_2->to == to) {
        return false;
      }
      //Checks is value on position in oreder for the edges to be from older nodes to newer nodes
      if(position.at(it_2->to) < position.at(to)) {
        pos = it_2;
        pos++;
      }
    }

    Edge<T> newE{from, to, distance};
    it_1->listEdges.insert(pos, newE);

    if(!directed) {
      addEdg(to, from, distance);
    }

    return true;
  };

  bool rmvEdg(const T& from, const T& to) {
    if(!(contains(from) && contains(to))) {
      return false;
    }
    typename std::vector<Node<T>>::iterator it_1 = nodes.begin(); 
    typename std::list<Edge<T>>::iterator it_2;

    for(; it_1 != nodes.end(); it_1++) {
      if(it_1->object == from) {
        break;
      }
    }

    for(it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
      if(it_2->to == to) {
        it_1->listEdges.erase(it_2);

        if(!directed) {
          rmvEdg(to, from);
        }

        return true;
      }
    }

    return false;
  };

  typename std::list<T> dfs(const T& info) {
    typename std::list<T> dfsOrder;
    typename std::map<T,bool> boolMap; //Shows if a node is visited 
    if(!contains(info)) {
      return dfsOrder;
    }
    typename std::vector<Node<T>>::const_iterator it_1 = nodes.begin(); 
    //initialize
    for(; it_1 != nodes.end(); it_1++) {
      boolMap.insert(std::pair<T, bool>(it_1->object, false));
    }

    dfsRecur(info, dfsOrder, boolMap);
  
    return dfsOrder;
  }

  void dfsRecur(const T& info, typename std::list<T>& dfsOrder, typename std::map<T,bool>& boolMap) {
    typename std::vector<Node<T>>::const_iterator it_1 = nodes.begin(); 
    typename std::list<Edge<T>>::const_iterator it_2;

    for(; it_1 != nodes.end(); it_1++) {
      if(it_1->object == info) break;
    }
    
    dfsOrder.push_back(it_1->object);
    boolMap.erase(it_1->object);
    boolMap.insert(std::pair<T, bool>(it_1->object, true));

    for(it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
      if(boolMap.at(it_2->to) == false) {
        dfsRecur(it_2->to, dfsOrder, boolMap);
      }
    }
  }

  typename std::list<T> bfs(const T& info) {
    typename std::map<T,bool> boolMap; //Shows if a node is visited 
    typename std::list<T> bfsOrder;
    if(!contains(info)) {
      return bfsOrder;
    }

    typename std::vector<Node<T>>::const_iterator it_1 = nodes.begin(); 
    typename std::list<Edge<T>>::const_iterator it_2;
    typename std::queue<T> queue;
    T obj;

    //initialize
    for(; it_1 != nodes.end(); it_1++) {
      boolMap.insert(std::pair<T, bool>(it_1->object, false));
    }
    //Find node
    for(it_1 = nodes.begin(); it_1 != nodes.end(); it_1++) {
      if(it_1->object == info) break;
    }
    //algorithm
    queue.push(it_1->object);
    while(!queue.empty()) {
      obj = queue.front();
      queue.pop();
    
      if(boolMap.at(obj) == false) {
        boolMap.erase(obj);
        boolMap.insert(std::pair<T, bool>(obj, true));
        bfsOrder.push_back(obj);

        for(it_1 = nodes.begin(); it_1 != nodes.end(); it_1++) {
          if(it_1->object == obj) break;
        }

        for(it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
          if(boolMap.at(it_2->to) == false) {
            queue.push(it_2->to);
          }
        }
      }
    }

    return bfsOrder;
  }

  typename std::list<Edge<T>> mst() {
    typename std::priority_queue<Edge<T>> pqueue;
    typename std::list<Edge<T>> mstList;
    typename std::map<T,bool> boolMap; //Shows which nodes are visited
    typename std::list<T> connected; //Check is graph is connected
    typename std::vector<Node<T>>::iterator it_1 = nodes.begin();
    T currentNode = it_1->object;
    Edge<T> curentEdge = *(it_1->listEdges.begin());
    int numOfEdges = nodes.size() - 1;
    int edgeCount = 0;

    if(directed) {
      return mstList;
    }
    //Check is graph is connected
    connected = bfs(it_1->object);
    if(connected.size() != nodes.size()) {
      return mstList;
    }
    //initialize
    for(; it_1 != nodes.end(); it_1++) {
      boolMap.insert(std::pair<T, bool>(it_1->object, false));
    }
    //algorithm
    mstAddQueue(currentNode, pqueue, boolMap);

    while(!pqueue.empty() && edgeCount != numOfEdges) {
      curentEdge = pqueue.top();
      pqueue.pop();
      currentNode = curentEdge.to;

      if(boolMap.at(currentNode) == false) {
        typename std::list<Edge<T>>::iterator pos = mstList.begin();

        for(; pos != mstList.end(); pos++) {
          if(pos->dist >= curentEdge.dist) {
            break;
          }
        }
        if(position.at(curentEdge.from) > position.at(curentEdge.to)) {
          T temp = curentEdge.from;
          curentEdge.from = curentEdge.to;
          curentEdge.to = temp;
        }
        mstList.insert(pos, curentEdge);
        mstAddQueue(currentNode, pqueue, boolMap);
        edgeCount++;
      }
    }

    return mstList;
  }

  void mstAddQueue(T obj, typename std::priority_queue<Edge<T>>& pqueue, typename std::map<T,bool>& boolMap) {
    typename std::vector<Node<T>>::const_iterator it_1 = nodes.begin();
    typename std::list<Edge<T>>::const_iterator it_2;

    boolMap.erase(obj);
    boolMap.insert(std::pair<T, bool>(obj, true));
    //Finds node
    for(it_1 = nodes.begin(); it_1 != nodes.end(); it_1++) {
      if(it_1->object == obj) break;
    }

    for(it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
      if(boolMap.at(it_2->to) == false) {
        pqueue.push(*it_2);
      }
    }
  }
  
  bool print2DotFile(const char *filename) const{
    std::ofstream file(filename);
    typename std::vector<Node<T>>::const_iterator it_1 = nodes.begin(); 
    typename std::list<Edge<T>>::const_iterator it_2;

    if (!file.is_open()) {
      return false;
    }

    file << "digraph G {\n";
    for (; it_1 != nodes.end(); it_1++) {
      for (it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
        file << "    " << it_1->object << " -> " << it_2->to << "[label = \"" << it_2->dist << "\" ]" << ";\n";
      }
    }
    file << "}\n";
    return true;
  }

  typename std::list<T> dijkstra(const T& from, const T& to) {
    typename std::list<T> path;
    typename std::priority_queue<Node<T>> pqueue;
    typename std::map<T, int> nodeDistances; //Saves the distance of every from the start
    typename std::map<T, bool> verified; //Shows if node is verified/visited
    typename std::map<T, T> prev; //Used to find the shortest path
    typename std::vector<Node<T>>::iterator it_1 = nodes.begin();
    typename std::list<Edge<T>>::iterator it_2;
    Node<T> currentNode = *it_1;
    int newDist;

    //check if nodes exist
    if(!(contains(from) && contains(to))) {
      std::cout<<from << " " << to << "\n";
      return path;
    }
    //Initialize algorithm structures
    for(; it_1 != nodes.end(); it_1++) {
      verified.insert(std::pair<T, bool>(it_1->object, false));
      prev.insert(std::pair<T, T>(it_1->object, it_1->object));
      if(it_1->object == from) {
        nodeDistances.insert(std::pair<T, int>(it_1->object, 0));
      }else{
        nodeDistances.insert(std::pair<T, int>(it_1->object, std::numeric_limits<int>::max()));
      }
    }

    //Find node 
    for(it_1 = nodes.begin(); it_1 != nodes.end(); it_1++) {
      if(it_1->object == from) break;
    }
    it_1->distance = 0;
    pqueue.push(*it_1);

    //start of algorithm
    while(!pqueue.empty()) {
      currentNode = pqueue.top();
      pqueue.pop();

      if(verified.at(currentNode.object) == false) {
        verified.erase(currentNode.object);
        verified.insert(std::pair<T, bool>(currentNode.object, true));

        if(currentNode.object == to) {
          break;
        }

        for(it_2 = currentNode.listEdges.begin(); it_2 != currentNode.listEdges.end(); it_2++) {
          
          if(verified.at(it_2->to) == false) {
            newDist = nodeDistances.at(currentNode.object) + it_2->dist;

            if(newDist < nodeDistances.at(it_2->to)) {
              nodeDistances.erase(it_2->to);
              nodeDistances.insert(std::pair<T, int>(it_2->to, newDist));
              prev.erase(it_2->to);
              prev.insert(std::pair<T, T>(it_2->to, currentNode.object));

              for(it_1 = nodes.begin(); it_1 != nodes.end(); it_1++) {
                if(it_2->to == it_1->object) break;
              }

              it_1->distance = newDist;
              pqueue.push(*it_1);
            }
          }
        }
      }
    }
    if(currentNode.object != to) {
          return path;
    }
    path.push_front(currentNode.object);
    //Backtracking path
    while(currentNode.object != from) {
      currentNode.object = prev.at(currentNode.object);
      path.push_front(currentNode.object);
    }
    return path;
  }

  typename std::list<T> bellman_ford(const T& from, const T& to) {
    typename std::list<T> path;
    typename std::map<T, int> nodeDistances; //Saves the distance of every from the star
    typename std::map<T, T> prev; //Used to find the shortest path
    typename std::vector<Node<T>>::iterator it_1 = nodes.begin();
    typename std::list<Edge<T>>::iterator it_2;
    int vertices = nodes.size(), i;

    //check if nodes exist
    if(!(contains(from) && contains(to))) {
      std::cout<<from << " " << to << "\n";
      return path;
    }
    //Initialize algorithm structures
    for(; it_1 != nodes.end(); it_1++) {
      prev.insert(std::pair<T, T>(it_1->object, it_1->object));
      if(it_1->object == from) {
        nodeDistances.insert(std::pair<T, int>(it_1->object, 0));
      }else{
        nodeDistances.insert(std::pair<T, int>(it_1->object, std::numeric_limits<int>::max()));
      }
    }
    //Algorithm
    for(i = 0; i < vertices - 1; i++) {
      for(it_1 = nodes.begin(); it_1 != nodes.end(); it_1++) {
        for(it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
          if(nodeDistances.at(it_2->from) != std::numeric_limits<int>::max()
          && nodeDistances.at(it_2->from) + it_2->dist< nodeDistances.at(it_2->to)) {
            nodeDistances.erase(it_2->to);
            nodeDistances.insert(std::pair<T, int>(it_2->to, nodeDistances.at(it_2->from) + it_2->dist));
            prev.erase(it_2->to);
            prev.insert(std::pair<T, T>(it_2->to, it_2->from));
          }
        }
      }
    }

    for(i = 0; i < vertices - 1; i++) {
      for(it_1 = nodes.begin(); it_1 != nodes.end(); it_1++) {
        for(it_2 = it_1->listEdges.begin(); it_2 != it_1->listEdges.end(); it_2++) {
          if(nodeDistances.at(it_2->from) != std::numeric_limits<int>::max()
          && nodeDistances.at(it_2->from) + it_2->dist< nodeDistances.at(it_2->to)) {
            throw NegativeGraphCycle();
          }
        }
      }
    }
    //Backtracking of the path
    T obj = to;
    path.push_front(obj);
    while(obj != from) {
      obj = prev.at(obj);
      path.push_front(obj);
    }
    return path;
  }
};


#endif
