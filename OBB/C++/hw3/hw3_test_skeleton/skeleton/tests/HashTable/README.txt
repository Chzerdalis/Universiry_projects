t1: Ελέγχει την εισαγωγή μη αποδεκτής τιμής στον κατασκευαστή HashTable(int)
t2: Ελέγχει τη μέθοδο HashTable::add
t3: Ελέγχει τη μέθοδο HashTable::remove. 
    Προϋπoθέσεις: HashTable::add(string &)
t4: Ελέγχει τον copy constructor.
    Προϋπoθέσεις: HashTable::add(string &)
t5: Ελέγχει τον τελεστή HashTable::operator=(HashTable &t)
    Προϋπoθέσεις: HashTable::add(string &)
t6: Ελέγχει τον τελεστή HashTable::operator+=(string&)
    Προϋπoθέσεις: HashTable::operator= 
t7: Ελέγχει τον τελεστή HashTable::operator-=(string&). 
    Προϋπoθέσεις: HashTable::add(string &), HashTable::operator= 
t8: Ελέγχει τον τελεστή HashTable::operator+(string&)
    Προϋπoθέσεις: HashTable::operator= 
t9: Ελέγχει τον τελεστή HashTable::operator-(string&)
    Προϋπoθέσεις: HashTable::operator+(string&)
t10:Ελέγχει τον τελεστή HashTable::operator+(HashTable&)
    Προϋπoθέσεις: HashTable::operator+=(string&)
