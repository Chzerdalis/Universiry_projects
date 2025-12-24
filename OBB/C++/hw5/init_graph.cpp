#include <cstdlib>
#include <sstream>
#include <tinyxml2.h>
#include <iostream>
#include "Graph.hpp"

using namespace std;
using namespace tinyxml2;

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

int main() {
  Graph g(true);

  XMLDocument doc;

  if (doc.LoadFile("new_map.osm") != XML_SUCCESS) {
      std::cerr << "Failed to load file\n";
      return 1;
  }

  XMLElement* root = doc.FirstChildElement("osm");
  if (!root) {
      std::cerr << "No <osm> root element found\n";
      return 1;
  }

  int numOfNodes = initNodes(root, g);

  int numOfUsedNodes = initEdges(root, g, 0);

  std::cout << "Total number of nodes: " << numOfNodes << "\n";
  std::cout << "Total number of used nodes: " << numOfUsedNodes << "\n";

  const int& from = 16157637;

  typename std::list<long int> printList;
  typename std::list<long int>::iterator it_1;

  //printList = g.bfs(from);
  cout << "\n----- BFS Traversal -----\n";
  for(it_1 = printList.begin(); it_1 !=  printList.end(); it_1++) {
    if(it_1 == printList.begin()) {
      cout << *it_1;
    }else {
      cout << " -> " << *it_1;
    }
  }
  //printList = g.dfs(from);
  cout << "\n----- BFS Traversal -----\n";
  for(it_1 = printList.begin(); it_1 !=  printList.end(); it_1++) {
    if(it_1 == printList.begin()) {
      cout << *it_1;
    }else {
      cout << " -> " << *it_1;
    }
  }

  g.rmvUnusedNodes();
  //g.printGraph();
  g.print2DotFile("graph_og.dot");
  g.compactGraph();
  g.rmvUnusedNodes();
  //g.printGraph();
  g.print2DotFile("graph_compact.dot");

  std::list<long int> dijkstraResult = g.dijkstra(4699231297, 3145926492);

  for(it_1 = dijkstraResult.begin(); it_1 !=  dijkstraResult.end(); it_1++) {
    if(it_1 == dijkstraResult.begin()) {
      cout << *it_1;
    }else {
      cout << " -> " << *it_1;
    }
  }

  return 0;
}