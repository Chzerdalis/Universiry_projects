CFLAGS=-Wall -g -std=c++11 -fsanitize=address

all: libHashTable

HashTable.o: HashTable.cpp HashTable.hpp
	g++ ${CFLAGS} HashTable.cpp -c
	
HashTableIterator.o: HashTableIterator.cpp HashTable.hpp
	g++ ${CFLAGS} HashTableIterator.cpp -c
	
libHashTable: HashTable.o HashTableIterator.o 
	ar cr  libHashTable.a HashTable.o HashTableIterator.o 
	
clean:
	rm -f *.o libHashTable.a

