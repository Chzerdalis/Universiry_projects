all: library 11 12 13 14 12e 13e 14e

library:
	cd ../.. && make

INC_PATH = ../../
LIB_PATH = ../../
LIB = HashTable
FLAGS = -Wall -g -std=c++11 -fsanitize=address

11: t11.cpp
	g++ ${FLAGS} t11.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t11
12: t12.cpp
	g++ ${FLAGS} t12.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t12
13: t13.cpp
	g++ ${FLAGS} t13.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t13
14: t14.cpp
	g++ ${FLAGS} t14.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t14
12e: t12e.cpp
	g++ ${FLAGS} t12e.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t12e
13e: t13e.cpp
	g++ ${FLAGS} t13e.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t13e
14e: t14e.cpp
	g++ ${FLAGS} t14e.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t14e

out:
	./t11 0 > t11_1.out
	./t11 10 > t11_2.out
	./t12 32 in2.txt > t12_1.out
	./t13 64 in1_db.txt in1_half.txt in2.txt > t13_1.out
	./t14 32 in1_un.txt > t14_1.out
	./t12e in2.txt > t12e_1.out
	./t13e in1_db.txt in1_half.txt in2.txt > t13e_1.out
	./t14e in1_un.txt > t14e_1.out
	
diff:
	diff t11_1.std t11_1.out
	diff t11_2.std t11_2.out
	diff t12_1.std t12_1.out
	diff t12e_1.std t12e_1.out
	diff t13_1.std t13_1.out
	diff t13e_1.std t13e_1.out
	diff t14_1.std t14_1.out
	diff t14e_1.std t14e_1.out
	
clean:
	-rm t13 t14
