
#ifndef _GRAPH_UI_
#define _GRAPH_UI_
#include <sstream>
#include "Graph.hpp"
using namespace std;

template <typename T>
int graphUI() {
  
  string option, line;
  int distance, sum = 0;
  bool digraph = false;
  int i;
  
  cin >> option;
  if(!option.compare("digraph")) {
    digraph = true;
  }
  Graph<T> g(digraph);

  std::stringstream stream;
  std::stringstream stream2;
  std::string words[5];
  typename std::list<T> printList;
  typename std::list<T>::iterator it_1;
  typename std::list<Edge<T>> printList_2;
  typename std::list<Edge<T>>::iterator it_2;

  while(true) {
    cin >> option;
    
    if(!option.compare("av")) {
      getline(std::cin, line);
      stream << line;

      T vtx(stream);
      if(g.addVtx(vtx))
        cout << "av " << vtx << " OK\n";
      else
        cout << "av " << vtx << " NOK\n";
    }
    else if(!option.compare("rv")) {
      getline(std::cin, line);
      stream << line;

      T vtx(stream);
      if(g.rmvVtx(vtx))
        cout << "rv " << vtx << " OK\n";
      else
        cout << "rv " << vtx << " NOK\n";
    }
    else if(!option.compare("ae")) {
      getline(std::cin, line);
      stream << line;
      i = 0;
      while(stream >> words[i]) {
        i++;
      }
      if(i == 5) {
        stream.clear();
        stream << words[0] << " " << words[1];
        stream2.clear();
        stream2 << words[2] << " " << words[3];
        distance = stoi(words[4]);
      }else{
        stream.clear();
        stream << words[0];
        stream2.clear();
        stream2 << words[1];
        distance = stoi(words[2]);
      }
      T from(stream);
      T to(stream2);
      if(g.addEdg(from, to, distance)) {
        cout << "ae " << from << " " << to << " OK\n";
      }else{
        cout << "ae " << from << " " << to << " NOK\n";
      }
    }
    else if(!option.compare("re")) {
      getline(std::cin, line);
      stream << line;
      i = 0;
      while(stream >> words[i]) {
        i++;
      }
      if(i == 4) {
        stream.clear();
        stream << words[0] << words[1];
        stream2.clear();
        stream2 << words[2] << words[3];
      }else{
        stream.clear();
        stream << words[0];
        stream2.clear();
        stream2 << words[1];
      }
      T from(stream);
      T to(stream2);

      if(g.rmvEdg(from, to)) {
        cout << "re " << from << " " << to << " OK\n";
      }else{
        cout << "re " << from << " " << to << " NOK\n";
      }
    }
    else if(!option.compare("dot")) {
      getline(std::cin, line);
      stream << line;
      string name;
      stream >> name;
      if(g.print2DotFile(name.c_str())) {
        cout << "dot " << name << " OK\n";
      }else {
        cout << "dot " << name << " NOK\n";
      }
    }
    else if(!option.compare("bfs")) {
      getline(std::cin, line);
      stream << line;
      T from(stream);
      printList = g.bfs(from);
      cout << "\n----- BFS Traversal -----\n";
      for(it_1 = printList.begin(); it_1 !=  printList.end(); it_1++) {
        if(it_1 == printList.begin()) {
          cout << *it_1;
        }else {
          cout << " -> " << *it_1;
        }
      }
      cout << "\n-------------------------\n";
    }
    else if(!option.compare("dfs")) {
      getline(std::cin, line);
      stream << line;
      T from(stream);
      printList = g.dfs(from);
      cout << "\n----- DFS Traversal -----\n";
      for(it_1 = printList.begin(); it_1 !=  printList.end(); it_1++) {
        if(it_1 == printList.begin()) {
          cout << *it_1;
        }else {
          cout << " -> " << *it_1;
        }
      }
      cout << "\n-------------------------\n";
    }
    else if(!option.compare("dijkstra")) {
      getline(std::cin, line);
      stream << line;
      i = 0;
      while(stream >> words[i]) {
        i++;
      }
      if(i == 4) {
        stream.clear();
        stream << words[0] << " " << words[1];
        stream2.clear();
        stream2 << words[2] << " " << words[3];
      }else{
        stream.clear();
        stream << words[0];
        stream2.clear();
        stream2 << words[1];
      }
      T from(stream);
      T to(stream2);

      printList = g.dijkstra(from, to);
      cout<<"Dijkstra (" << from << " - " << to << "): ";
      for(it_1 = printList.begin(); it_1 !=  printList.end(); it_1++) {
        if(it_1 == printList.begin()) {
          cout << *it_1;
        }else {
          cout << ", " << *it_1;
        }
      }
      cout<<"\n";
    }
    else if(!option.compare("bellman-ford")) {
      getline(std::cin, line);
      stream << line;
      i = 0;
      while(stream >> words[i]) {
        i++;
      }
      if(i == 4) {
        stream.clear();
        stream << words[0] << " " << words[1];
        stream2.clear();
        stream2 << words[2] << " " << words[3];
      }else{
        stream.clear();
        stream << words[0];
        stream2.clear();
        stream2 << words[1];
      }
      T from(stream);
      T to(stream2);
      try{
        printList = g.bellman_ford(from, to);
        cout<<"Bellman-Ford (" << from << " - " << to << "): ";
        for(it_1 = printList.begin(); it_1 !=  printList.end(); it_1++) {
          if(it_1 == printList.begin()) {
            cout << *it_1;
          }else {
            cout << ", " << *it_1;
          }
        }
        cout<<"\n";
      }catch (const NegativeGraphCycle& e) {
        cout<<"Bellman-Ford (" << from << " - " << to << "): Negative Graph Cycle!\n";
      }
    }
    else if(!option.compare("mst")) {

      cout << "\n--- Min Spanning Tree ---\n";
      printList_2 = g.mst();
      for(it_2 = printList_2.begin(); it_2 !=  printList_2.end(); it_2++) {
        cout << *it_2 << "\n";
        sum += it_2->dist;
      }
      cout << "MST Cost: " << sum << endl;
    }
    else if(!option.compare("q")) {
      cerr << "bye bye...\n";
      return 0;
    }
    else if(!option.compare("#")) {
      string line;
      getline(cin,line);
      cerr << "Skipping line: " << line << endl;
    }
    else {
      cout << "INPUT ERROR\n";
      return -1;
    }
    stream.clear();
  }
  return -1;  
}

#endif
