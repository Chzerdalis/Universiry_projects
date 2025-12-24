#include <tinyxml2.h>
#include <iostream>

using namespace tinyxml2;

int main() {

    XMLDocument doc;
    if (doc.LoadFile("map.osm") != XML_SUCCESS) {
        std::cerr << "Failed to load file\n";
        return 1;
    }

    XMLElement* root = doc.FirstChildElement("osm");
    if (!root) {
        std::cerr << "No <osm> root element found\n";
        return 1;
    }

    XMLElement* node = root->FirstChildElement("node");
    const char* id;
    const char* lat;
    const char* lon;
    int numofnodes = 0;
    int numofusednodes = 0;

    do {
        if (!node) {
            std::cerr << "No <node> element found\n";
            return 1;
        }

        id = node->Attribute("id");
        lat = node->Attribute("lat");
        lon = node->Attribute("lon");

        printf("Node ID: %s ", id ? id : "N/A");
        printf("Latitude: %s ", lat ? lat : "N/A");
        printf("Longitude: %s\n", lon ? lon : "N/A");

        node = node->NextSiblingElement("node");
        numofnodes++;
    }while(node);

    XMLElement* way = root->FirstChildElement("way");
    int k = 0;
    do {
        if (!way) {
            std::cerr << "No <way> element found\n";
            return 1;
        }

        for (XMLElement* tag = way->FirstChildElement("tag"); tag; tag = tag->NextSiblingElement("tag")) {
            const char* key = tag->Attribute("k");
            const char* val = tag->Attribute("v");
            if (key && val) {
                if(key == std::string("highway")) {
                    k = 1;
                    std::cout << "Highway: " << val << "\n";
                }
            }
        }
        if(k) {
            const char* id = way->Attribute("id");
            const char* user = way->Attribute("user");
            const char* timestamp = way->Attribute("timestamp");
    
            // Extract <nd> references
            std::cout << "Node references:\n";
            for (XMLElement* nd = way->FirstChildElement("nd"); nd; nd = nd->NextSiblingElement("nd")) {
                const char* ref = nd->Attribute("ref");
                if (ref) {
                    std::cout << "  - " << ref << "\n";
                    numofusednodes++;
                }
            }
        }

        k = 0;
    } while ((way = way->NextSiblingElement("way")));

    std::cout << "Total number of nodes: " << numofnodes << "\n";
    std::cout << "Total number of used nodes: " << numofusednodes << "\n";
    return 0;
}
