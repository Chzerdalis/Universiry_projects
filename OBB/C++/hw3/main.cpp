#include "HashTable.hpp"
#include "ExtHashTable.hpp"
#include <iostream>
#include <fstream>
#include <string>
#include <iostream>
#include "HashTable.hpp"

// int main(int argc, char *argv[]) {
//   if(argc<3) {
//     cout << "Insufficient number of arguments!\n";
//     cout << "Usage: ./t20 <input_txt_file1> <input_txt_file2>\n" << endl;
//     return -1;
//   }
    
//   try {  
//     ifstream in_stream (argv[1]);
//     if (!in_stream.is_open()) {
//       cout << "Unable to open file " << argv[1];
//       return -1;    
//     }
    
//     ExtHashTable table1, table2;
    
//     while ( !in_stream.eof() ) {
//       string word;
//       in_stream >> word;
//       table1 += word;
//       if(table1.contains(word)) 
//         cout << "'" << word << "' added!" << endl;
//       else
//         cout << "'" << word << "' failed!" << endl;
//     }
//     in_stream.close();
    
//     cout << " ###### HASH TABLE 1 ######" << endl;
//     cout << table1.print() << endl;
    
//     in_stream.open(argv[2]);
//     if (!in_stream.is_open()) {
//       cout << "Unable to open file " << argv[2];
//       return -1;    
//     }
    
//     while ( !in_stream.eof() ) {
//       string word;
//       in_stream >> word;
//       table2 += word;
//       if(table2.contains(word)) 
//         cout << "'" << word << "' added!" << endl;
//       else
//         cout << "'" << word << "' failed!" << endl;
//     }
//     in_stream.close();
    
//     cout << " ###### HASH TABLE 2 ######" << endl;
//     cout << table2.print() << endl;
    
//     table2 += table1;
    
//     cout << " ###### HASH TABLE 2+=1 ######" << endl;
//     cout << table2.print() << endl;
  
//   } catch(std::bad_alloc& ex) {
//     cout << "std::bad_alloc occured!\n";
//   } catch(HashTableException& ex) {
//     cout << "HashTableException occured!\n";
//   }
// }

int main(int argc, char* argv[]) {
    ExtHashTable test1;

    cout<<test1;

    test1.add(string ("elena"));
    test1.add("babe");
    test1 += "xri";
    cout<<test1;
    test1 += "alban";
    test1 += "big dick";
    cout<<test1;
    test1 += "kolos";
    test1 += "shmeiao";
    cout<<test1;
    test1 += (string ("prosopo"));
    test1 += "mallia";
    cout<<test1;
    test1 += "gidi";
    test1 += "mousiki";
    cout<<test1;
    test1 += "mati";
    test1 += "zari";
    cout<<test1;
    test1 += "euro";
    test1 += "trompas";
    test1 += "mob";
    test1 += "rox";
    cout<<test1;

    ExtHashTable test2(test1);
    cout<<test2;

    test1 -= "euro";
    test1 -= "trompas";
    cout<<test1;
    test1 -= "mob";
    test1 -= "rox";
    cout<<test1;
    test1 -= "mati";
    test1 -= "zari";
    cout<<test1;
    test1 -= "gidi";
    test1 -= "mousiki";
    cout<<test1;
    test1 -= (string ("prosopo"));
    test1 -= "mallia";
    cout<<test1;
    test1 -= "kolos";
    test1 -= "shmeiao";
    cout<<test1;
    test1 -= "alban";
    test1 -= "big dick";
    cout<<test1;

    ExtHashTable test3 = test1;

    cout<<test3;

    test3 = test1 + "kourada";
    cout<<test3;
    test3 = test1 + "papiaa";
    cout<<test3;
    test3 = test1 - "xri";
    test3 = test3 - "elena";
    test3 = test3 - "babe";
    cout<<test3;
    test3 += "kai ase na mas ferei oti uelei meta";
    test3 += "otan xazarei me troei to marazei";
    cout<<test3;

    test3 = test3 + test2;

    test1 += "kai ase na mas ferei oti uelei meta ta at";
    test1 += "otan xazarei me troei to marazei momi";

    cout<<test1;

    test1 += test3;

    cout<<test1;


    // HashTable::Iterator it = first.begin();

    // first.add(string ("xri"));
    // first.add("elena");
    // first += "xaris";
    // first += string ("lina");
    // first += "baggelis";
    // first += "baggelis";
    // first += "lamprini";
    // first += "baso";
    // first += "kwstas";
    // first += "eua";
    // first += "fillipos";
    // cout<<first<<"\n";

    // HashTable second(first);

    // for(it = first.begin(); it != first.end(); it++) {
    //     cout<<*it<<" ";
    //     cout<<"contains "<<first.contains(*it);
    //     cout<<" contains "<<first.contains(it->c_str())<<"\n";
    //     cout<<"\n";
    // }

    // cout<<" contains "<<first.contains("malakas")<<"\n";

    // first.remove(string ("xri"));
    // first.remove("elena");
    // first -= "xaris";
    // first -= string ("lina");
    // first -= "baggelis";
    // first -= "baggelis";
    // cout<<first<<"\n";
    // for(it = first.begin(); it != first.end(); it++) {
    //     cout<<*it<<" ";
    //     cout<<"contains "<<first.contains(*it);
    //     cout<<" contains "<<first.contains(it->c_str())<<"\n";
    //     cout<<"\n";
    // }
    // first -= "lamprini";
    // first -= "baso";
    // first -= "kwstas";
    // first -= "eua";
    // first -= "fillipos";
    // cout<<first<<"\n";

    // if(first.begin() == first.end()) {cout<<"   hsbdhbchb    ";}
    // it = first.begin();

    // if(it == first.end()) {cout<<"   akhbfhafabsfbahsbf    ";}
    // HashTable::Iterator ot(it);
    
    // for(; ot != first.end(); ot++) {
    //     cout<<*it<<" ";
    //     cout<<"contains "<<first.contains(*it);
    //     cout<<" contains "<<first.contains(it->c_str())<<"\n";
    //     cout<<"\n";
    // }

    // HashTable third = second;
    // cout<<second;
    // cout<<third;

    // third = second - "xri";
    // third = third - string ("elena");

    // cout<<third;

    // third = third + "xri";
    // third = third + string ("elena");

    // cout<<third;

    return 0;
}