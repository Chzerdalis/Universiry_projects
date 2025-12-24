#ifndef _GRAPH_UI_
#define _GRAPH_UI_
#include <sstream>
#include "Graph.hpp"
#include <cstdlib>
#include <tinyxml2.h>
#include <iostream>

using namespace std;
using namespace tinyxml2;

int graphUI();
int initNodes(XMLElement* root, Graph& g);
int initEdges(XMLElement* root, Graph& g, int pedestrian);

int graphUI() {
  
  string option, line;
  int i;

  Graph g;

  std::stringstream stream;
  std::stringstream stream2;
  std::string words[5];
  std::list<long int> printList;
  std::list<long int>::iterator it_1;
  std::list<Edge> printList_2;
  std::list<Edge>::iterator it_2;

  XMLDocument doc;

  while(true) {
    std::cout << "\n\nCommands\ninit <file.osm (0 from cars) (1 from pedestrians)>\ndot <file name>\n" << 
    "bfs <node id>\ndfs <node id>\ndijkstra<node id1, node id2>\ncompact\n";
    std::cout << "\nEnter command: ";

    cin >> option;
    cout << "\n";
    if(!option.compare("init")) {
      getline(std::cin, line);
      stream << line;

      i = 0;
      while(stream >> words[i]) {
        i++;
      }
      if(words[0].empty() || words[1].empty()) {
        std::cerr << "Invalid input\n";
        continue;
      } 
      if (doc.LoadFile(words[0].c_str()) != XML_SUCCESS) {
          std::cerr << "Failed to load file\n";
          return 1;
      }

      XMLElement* root = doc.FirstChildElement("osm");
      if (!root) {
          std::cerr << "No <osm> root element found\n";
          return 1;
      }

      int numOfNodes = initNodes(root, g);
      int numOfUsedNodes = initEdges(root, g, std::stoi(words[1]));

      std::cout << "Total number of nodes: " << numOfNodes << "\n";
      std::cout << "Total number of used nodes: " << numOfUsedNodes << "\n";

      g.rmvUnusedNodes();
    } else if(!option.compare("compact")) {
      getline(std::cin, line);
      stream << line;
      string name;
      stream >> name;
      g.compactGraph();
      g.rmvUnusedNodes();
    }else if(!option.compare("dot")) {
      getline(std::cin, line);
      stream << line;
      string name;
      stream >> name;
      if(g.print2DotFile(name.c_str())) {
        cout << "dot " << name << " OK\n";
      } else {
        cout << "dot " << name << " NOK\n";
      }
    }else if(!option.compare("bfs")) {
      getline(std::cin, line);
      int from = std::stoi(line);
      printList = g.bfs(from);
      cout << "\n----- BFS Traversal -----\n";
      for(it_1 = printList.begin(); it_1 != printList.end(); it_1++) {
        if(it_1 == printList.begin()) {
          cout << *it_1;
        } else {
          cout << " -> " << *it_1;
        }
      }
      cout << "\n-------------------------\n";
    }else if(!option.compare("dfs")) {
      getline(std::cin, line);
      int from = std::stoi(line);
      printList = g.dfs(from);
      cout << "\n----- DFS Traversal -----\n";
      for(it_1 = printList.begin(); it_1 != printList.end(); it_1++) {
        if(it_1 == printList.begin()) {
          cout << *it_1;
        } else {
          cout << " -> " << *it_1;
        }
      }
      cout << "\n-------------------------\n";
    }else if(!option.compare("dijkstra")) {
      getline(std::cin, line);
      stream << line;
      i = 0;
      while(stream >> words[i]) {
        i++;
      }
      int from, to;
      if(i == 4) {
        from = std::stoi(words[0]);
        to = std::stoi(words[2]);
      } else {
        from = std::stoi(words[0]);
        to = std::stoi(words[1]);
      }
      printList = g.dijkstra(from, to);
      cout << "Dijkstra (" << from << " - " << to << "): ";
      for(it_1 = printList.begin(); it_1 != printList.end(); it_1++) {
        if(it_1 == printList.begin()) {
          cout << *it_1;
        } else {
          cout << ", " << *it_1;
        }
      }
      cout << "\n";
    }else {
      cout << "INPUT ERROR\n";
    }
    stream.clear();
  }
  return -1;  
}

int initNodes(XMLElement* root, Graph& g) {
  XMLElement* node = root->FirstChildElement("node");
  const char* id;
  const char* lat;
  const char* lon;

  int numofnodes = 0;

  if (!node) {
      std::cerr << "No <node> element found\n";
      return numofnodes;
  }

  do {
      id = node->Attribute("id");
      lat = node->Attribute("lat");
      lon = node->Attribute("lon");

      // Add node to graph
      long int nodeId;
      std::istringstream(id) >> nodeId;
      g.addVtx(nodeId, std::stod(lat), std::stod(lon));

      numofnodes++;
  }while((node = node->NextSiblingElement("node")));

  return numofnodes;
}

int initEdges(XMLElement* root, Graph& g, int pedestrian = 0) {
  XMLElement* way = root->FirstChildElement("way");
  int wayIsStreet = 0;

  if (!way) {
        std::cerr << "No <way> element found\n";
        return -1;
    }

  do {
    std::string streetName = "NoN";
    std::string streetType;
    int twoWay = 0;

    //Parse <tag> elements of the way to determine if it is a street
    for (XMLElement* tag = way->FirstChildElement("tag"); tag; tag = tag->NextSiblingElement("tag")) {  
        const char* key = tag->Attribute("k");
        const char* val = tag->Attribute("v");

        if (key && val) {
            if(key == std::string("highway")) {
                wayIsStreet = 1;
                streetType = val;
            }else if(key == std::string("name")) {
                streetName = val; 
            }else if(key == std::string("oneway")) {
                if(val == std::string("yes")) {
                    twoWay = 1;
                }
            }
        }
        if(streetName == "NoN") {
            streetName = streetType;
        } 
    }

    if(wayIsStreet) {
        //Find and add edges to the graph
        XMLElement* prev =  way->FirstChildElement("nd");
        XMLElement* nd = prev->NextSiblingElement("nd");

        for (; nd; nd = nd->NextSiblingElement("nd")) {
            prev = nd->PreviousSiblingElement("nd");

            const char* ref = nd->Attribute("ref");
            const char* prevref = prev->Attribute("ref");
            if (ref) {
                // Add edge to graph
                long int fromId;
                long int toId;
                std::istringstream(prevref) >> fromId;
                std::istringstream(ref) >> toId;
                double multFactor = 0;
                
                if(streetType == "motorway" || streetType == "trunk") {
                    multFactor = 0.5;
                }else if(streetType == "primary" || streetType == "secondary") {
                    multFactor = 0.75;
                }else if(streetType == "tertiary" || streetType == "residential") {
                    multFactor = 1;
                }else if(streetType == "living_street" || streetType == "unclassified") {
                    multFactor = 1.25;
                }else if(streetType == "service" || streetType == "track") {
                    multFactor = 1.5;
                }

                if(pedestrian) {
                  multFactor = 1;
                }

                double distance = g.find_distance(fromId, toId);
                if(multFactor != 0) {
                  if(twoWay) {
                    g.addEdg(toId, fromId, distance, streetName);
                  }
                  g.addEdg(fromId, toId, (int)(multFactor*distance), streetName);
                }
            }
        }
      }
      wayIsStreet = 0;
  } while ((way = way->NextSiblingElement("way")));
  return 1;
}

#endif