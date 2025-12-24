#ifndef HashTable_HPP
#define HashTable_HPP

#include <string>
#include <cstring>
#include <iostream>
#include <exception> 
#include "HashTableException.hpp"

using namespace std;
class HashTable {
  
protected:
    int size;
    int capacity;
    string **table;

    unsigned long getHashCode(const char *str) const; 

    bool isEmpty(int pos) const;
    bool isTomb(int pos) const;
    bool isAvailable(int pos) const;
  
public:  
    HashTable(int capacity=8);
    HashTable(const HashTable &ht);
    ~HashTable();

    int getSize() const;
    int getCapacity() const;
  
    bool contains(const string &s) const;
    bool contains(const char *s) const;
    string print() const;

    virtual bool add(const string &s);
    virtual bool add(const char *s);
    virtual bool remove(const string &s);
    virtual bool remove(const char *s);
  
    HashTable& operator = (const HashTable &ht);
  
    HashTable& operator += (const string& str);
    HashTable& operator += (const char* s);
    HashTable& operator -= (const string& str);
    HashTable& operator -= (const char* s);
  
    HashTable operator + (const string& str) const;
    HashTable operator + (const char* s) const;
    HashTable operator - (const string& str) const;
    HashTable operator - (const char* s) const;

    friend ostream& operator<<(ostream &stream, const HashTable &t);

    class Iterator;

    Iterator begin() const;
    Iterator end() const;
};

class HashTable::Iterator {
    string **curr;
    const HashTable *ht;
    int position;
    
public:    
    Iterator(const HashTable *t);
    Iterator(const Iterator &it);
    Iterator& operator=(const Iterator &it);
    Iterator operator++();
    Iterator operator++(int a);
    bool operator==(const Iterator &it) const ;
    bool operator!=(const Iterator &it) const;
    const string& operator*();
    const string* operator->();
    int pos() const;
};

#endif
