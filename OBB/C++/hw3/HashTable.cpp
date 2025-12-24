#include "HashTable.hpp"

string *Tomb = (string*) 0x9999;

unsigned long HashTable::getHashCode(const char *str) const {
    unsigned long hash = 97;
    int c;

    while ((c = *(str++)) != '\0')
        hash = ((hash << 5) + hash) + c; 

    return hash;
}

HashTable::HashTable(int capacity) {
    this->capacity = capacity;
    this->size = 0;
    int i;
    
    try{
        this->table = new string* [capacity + 1];

        for(i = 0; i < capacity + 1; i++) {
        this->table[i] = NULL;
        }

    }catch(const std::bad_alloc& e){
        throw std::bad_alloc();
    }
}

HashTable::HashTable(const HashTable &ht) {
    int i;

    try{
        this->table = new string* [ht.capacity + 1];

        for(i = 0; i < ht.capacity + 1; i++) {

            if(ht.table[i] == NULL) {
                this->table[i] = NULL;
            }else if(ht.table[i] == Tomb){
                this->table[i] = Tomb;
            }else{
                this->table[i] = new string;
                *(this->table[i]) = *(ht.table[i]);
            }
        }
        this->size = ht.size;
        this->capacity = ht.capacity;

    }catch(const std::bad_alloc& e){
        throw std::bad_alloc();
    }
}

HashTable::~HashTable() {
    int i;
    
    for(i = 0; i < this->capacity; i++) {
        if(this->table[i] != NULL && this->table[i] != Tomb) {
            delete this->table[i];
        }
    }
    delete[] this->table;
}

bool HashTable::isEmpty(int pos) const {
    if(pos >= this->capacity) return false;

    if(this->table[pos] == NULL) {
        return true;
    }else {
        return false;
    }
}

bool HashTable::isTomb(int pos) const {
    if(pos >= this->capacity) return false;

    if(this->table[pos] == Tomb) {
        return true;
    }else {
        return false;
    }
}

bool HashTable::isAvailable(int pos) const {
    if(isTomb(pos) || isEmpty(pos)) {
        return true;
    }else {
        return false;
    }
}

int HashTable::getSize() const{
    return this->size;
}

int HashTable::getCapacity() const{
    return this->capacity;
}

bool HashTable::contains(const string &s) const {
    int i = 0;
    unsigned int pos;
   
    pos = getHashCode(s.c_str()) % this->capacity;
    
    while(i < this->capacity) {
        
        if(!isAvailable(pos) && *(this->table[pos]) == s) {
            return true;
        }else if(isEmpty(pos)){
            return false;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }

    return false;
}

bool HashTable::contains(const char *s) const {
    int i = 0;
    unsigned int pos;
    string ss(s);

    pos = getHashCode(s) % this->capacity;
    
    while(i < this->capacity) {
        if(!isAvailable(pos) && *(this->table[pos]) == ss) {
            return true;
        }else if(isEmpty(pos)){
            return false;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }

    return false;
}

string HashTable::print() const {
  string str;
  char buf[128];
  
 for(int i=0; i<capacity; i++) {
    if( !isAvailable(i) ) {
      sprintf(buf, "%2d. -%s-\n", i, (*table[i]).c_str());
      str.append(buf);
    }
  }

  sprintf(buf, " --- CAPACITY: %d, SIZE: %d ---\n", capacity, size);
  str.append(buf);
  return str;
}

bool HashTable::add(const string &s) {
    unsigned int pos;
    int i = 0;

    if(contains(s) || s.empty()) {
        return false;
    }

    pos = getHashCode(s.c_str()) % this->capacity;
    
    while(i < this->capacity) {
        
        if(isAvailable(pos)) {
            this->table[pos] = new string(s);
            this->size++;
            return true;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }
    throw HashTableException();
    return false;
}

bool HashTable::add(const char *s) {
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
            return true;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }
    throw HashTableException();
    return false;
}

bool HashTable::remove(const string &s) {
    int i = 0;
    unsigned int pos;

    pos = getHashCode(s.c_str()) % this->capacity;
    
    while(i < this->capacity) {
        if(!isAvailable(pos) && *(this->table[pos]) == s) {
            delete this->table[pos];
            this->table[pos] = Tomb;
            this->size--;
            return true;
        }else if(isEmpty(pos)){
            return false;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }
    return false;
}

bool HashTable::remove(const char *s) {
    int i = 0;
    unsigned int pos;
    string ss(s);

    pos = getHashCode(s) % this->capacity;
    
    while(i < this->capacity) {
        if(!isAvailable(pos) && *(this->table[pos]) == ss) {
            delete this->table[pos];
            this->table[pos] = Tomb;
            this->size--;
            return true;
        }else if(isEmpty(pos)){
            return false;
        }
        i++;
        pos = (pos + 1) % this->capacity;
    }
    return false;
}

HashTable& HashTable::operator = (const HashTable &ht) {
    int i;
    
    for(i = 0; i < this->capacity; i++) {
        if(this->table[i] != NULL && this->table[i] != Tomb) {
            delete this->table[i];
        }
    }
    delete[] this->table;

    try{
        this->table = new string* [ht.capacity + 1];

        for(i = 0; i < ht.capacity + 1; i++) {

            if(ht.table[i] == NULL) {
                this->table[i] = NULL;
            }else if(ht.table[i] == Tomb){
                this->table[i] = Tomb;
            }else{
                this->table[i] = new string;
                *(this->table[i]) = *(ht.table[i]);
            }
        }
        this->size = ht.size;
        this->capacity = ht.capacity;

    }catch(const std::bad_alloc& e){
        std::cout << e.what() << '\n';
    }
    return *this;
}

HashTable& HashTable::operator += (const string& str) {
    add(str);
    return *this;
}

HashTable& HashTable::operator += (const char* s) {
    add(s);
    return *this;
}

HashTable& HashTable::operator -= (const string& str) {
    remove(str);
    return *this;
}

HashTable& HashTable::operator -= (const char* s) {
    remove(s);
    return *this;
}

HashTable HashTable::operator + (const string &str) const{
    HashTable v(*this);
    v += str;
    return v;
}

HashTable HashTable::operator + (const char* s) const{
    HashTable v(*this);
    v += s;
    return v;
}

HashTable HashTable::operator - (const string& str) const{
    HashTable v(*this);
    v -= str;
    return v;
}

HashTable HashTable::operator - (const char* s) const{
    HashTable v(*this);
    v -= s;
    return v;
}

ostream& operator << (ostream &stream, const HashTable &t) {
    stream << t.print();
    return stream;
}

HashTable::Iterator::Iterator(const HashTable *t) {
    int i;

    for(i = 0; i < t->capacity; i++) {
        if(!(t->isAvailable(i))) {
            this->curr = &(t->table[i]);
            break;
        }
    }
    ht = t;
    position = i;
    if(i == t->capacity) {
        this->curr = &(t->table[i]);
    }

}

HashTable::Iterator::Iterator(const Iterator &it) {
    this->curr = it.curr;
    this->ht = it.ht;
    this->position = it.position;
}

HashTable::Iterator& HashTable::Iterator::operator = (const Iterator &it) {
    this->curr = it.curr;
    this->ht = it.ht;
    this->position = it.position;

    return *this;
}

int HashTable::Iterator::pos () const {
    return this->position;
}

HashTable::Iterator HashTable::Iterator::operator ++ () {
    int i;

    for(i = pos() + 1; i < this->ht->capacity; i++) {
        if(!(ht->isAvailable(i))) {
            this->curr = &(this->ht->table[i]);
            this->position = i;
            return *this;
        }
    }
    this->position = this->ht->capacity;
    this->curr = &(this->ht->table[this->position]);
    return *this;
}

HashTable::Iterator HashTable::Iterator::operator ++ (int a) {
    HashTable::Iterator temp(*this);
    int i;

    for(i = pos() + 1; i < this->ht->capacity; i++) {
        if(!(ht->isAvailable(i))) {
            this->curr = &(this->ht->table[i]);
            this->position = i;
            return temp;
        }
    }

    this->position = this->ht->capacity;
    this->curr = &(this->ht->table[this->position]);
    return temp;
}

bool HashTable::Iterator::operator == (const Iterator &it) const {
    if(this->curr == it.curr && this->ht == it.ht && this->position == it.position) {
        return true;
    }
    return false;
}

bool HashTable::Iterator::operator != (const Iterator &it) const {
    return !(*this == it);
}

const string& HashTable::Iterator::operator * () {
    return *(this->curr[0]);
}

const string* HashTable::Iterator::operator -> () {
    return this->curr[0];
}

HashTable::Iterator HashTable::begin () const {
    HashTable::Iterator it(this);
    return it;
}

HashTable::Iterator HashTable::end () const {
    HashTable::Iterator it(this);
    int i;

    for(i = 0; i < this->capacity; i++) {
        it++;
    }

    return it;
}
