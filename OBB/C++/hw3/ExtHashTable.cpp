#include "ExtHashTable.hpp"


void ExtHashTable::rehash() {
    double ratio = (double) this->size/ (double) this->capacity;
    int newCapacity = 0;

    if(this->size == 0) {
        return;
    }else if(ratio <= this->lower_bound_ratio) {
        newCapacity = this->capacity/2;
    }else if(ratio >= this->upper_bound_ratio) {
        newCapacity = this->capacity*2;
    }else{
        return;
    }

    ExtHashTable copy(this->upper_bound_ratio, this->lower_bound_ratio, newCapacity);

    for(HashTable::Iterator it = begin(); it != end(); it++) {
        copy.HashTable::add(*it);
    }

    cout<<"--> Size: "<<copy.size<<", New capacity: "<<copy.capacity<<"\n";

    *this = copy;
}

ExtHashTable::ExtHashTable(double upper_bound_ratio,double lower_bound_ratio,
int capacity) : HashTable(capacity){
    this->upper_bound_ratio = upper_bound_ratio;
    this->lower_bound_ratio = lower_bound_ratio;
}

ExtHashTable::ExtHashTable(const ExtHashTable &t) : HashTable(t){
    this->upper_bound_ratio = t.upper_bound_ratio;
    this->lower_bound_ratio = t.lower_bound_ratio;
}

bool ExtHashTable::add(const string &str) {
    unsigned int pos;
    int i = 0;

    if(contains(str) || str.empty()) {
        return false;
    }

    pos = getHashCode(str.c_str()) % this->capacity;
    
    while(i < this->capacity) {
        if(isAvailable(pos)) {
            this->table[pos] = new string(str);
            this->size++;
            break;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }
    rehash();
    return true;
}

bool ExtHashTable::add(const char *s) {
    unsigned int pos;
    int i = 0;

    if(contains(s) || string (s).empty()) {
        return false;
    }

    pos = getHashCode(s) % this->capacity;
    
    while(i < this->capacity) {
        
        if(isAvailable(pos)) {
            this->table[pos] = new string(s);
            this->size++;
            break;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }
    rehash();
    return true;
}

bool ExtHashTable::remove(const string &str) {
    if(HashTable::remove(str)) {
        rehash();
        return true;
    }
    return false;
}

bool ExtHashTable::remove(const char *s) {
    if(HashTable::remove(s)) {
        rehash();
        return true;
    }
    return false;
}

ExtHashTable& ExtHashTable::operator = (const ExtHashTable &t) {
    HashTable::operator = (t);
    
    this->upper_bound_ratio = t.upper_bound_ratio;
    this->lower_bound_ratio = t.lower_bound_ratio;
    return *this;
}

ExtHashTable ExtHashTable::operator+(const string &str) const {
    ExtHashTable v(*this);
    v.add(str);
    return v;
}

ExtHashTable ExtHashTable::operator+(const char* s) const {
    ExtHashTable v(*this);
    v.add(s);
    return v;
}

ExtHashTable ExtHashTable::operator-(const string &str) const {
    ExtHashTable v(*this);
    v.remove(str);
    return v;
}

ExtHashTable ExtHashTable::operator-(const char* s) const {
    ExtHashTable v(*this);
    v.remove(s);
    return v;
}

ExtHashTable& ExtHashTable::operator += (const string &str) {
    add(str);
    return *this;
}

ExtHashTable& ExtHashTable::operator += (const char* s) {
    add(s);
    return *this;
}

ExtHashTable& ExtHashTable::operator -= (const string &str) {
    remove(str);
    return *this;
}

ExtHashTable& ExtHashTable::operator -= (const char* s) {
    remove(s);
    return *this;
}

ExtHashTable ExtHashTable::operator+(const ExtHashTable &t) const {
    ExtHashTable v(*this);

    for(HashTable::Iterator it = t.begin(); it!= t.end(); it++) {
        v.add(*it);
    }

    return v;
}

ExtHashTable& ExtHashTable::operator+=(const ExtHashTable &t) {

    for(HashTable::Iterator it = t.begin(); it!= t.end(); it++) {
        add(*it);
    }

    return *this;
}
