project3: objdb.o project3.o
	gcc -Wall -g objdb.o project3.o -o project3
objdb.o: objdb.c objdb.h
	gcc -Wall -g -c objdb.c
project3.o: project3.c objdb.h
	gcc -Wall -g -c project3.c
