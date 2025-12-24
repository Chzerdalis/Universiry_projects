all: build

build: t1 t2 t3 t4 t5 t6 t7 t8 t9 t10

library:
	-cd ../.. && make

INC_PATH = ../..
LIB_PATH = ../..
LIB = HashTable
FLAGS = -Wall -g -std=c++11 -fsanitize=address

t1: t1.cpp
	g++ ${FLAGS} t1.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t1
t2: t2.cpp
	g++ ${FLAGS} t2.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t2
t3: t3.cpp
	g++ ${FLAGS} t3.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t3
t4: t4.cpp
	g++ ${FLAGS} t4.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t4
t5: t5.cpp
	g++ ${FLAGS} t5.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t5
t6: t6.cpp
	g++ ${FLAGS} t6.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t6
t7: t7.cpp
	g++ ${FLAGS} t7.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t7
t8: t8.cpp
	g++ ${FLAGS} t8.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t8
t9: t9.cpp
	g++ ${FLAGS} t9.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t9
t10: t10.cpp
	g++ ${FLAGS} t10.cpp -I ${INC_PATH} -L ${LIB_PATH} -l${LIB} -o t10
	
out:
	./t1 > t1_1.out
	./t2 10 in1_un.txt > t2_1.out
	./t2 32 in1_un.txt > t2_2.out
	./t2 32 in1_db.txt > t2_3.out
	./t3 32 in1_db.txt > t3_1.out
	./t4 32 in1_db.txt > t4_1.out
	./t5 32 in1_db.txt > t5_1.out
	./t6 10 in1_un.txt > t6_1.out
	./t6 32 in1_db.txt > t6_2.out
	./t7 32 in1_db.txt > t7_1.out
	./t8 32 in1_db.txt > t8_1.out
	./t8 10 in1_db.txt > t8_2.out
	./t9 32 in1_db.txt > t9_1.out
	./t10 50 in1_un.txt in1_half.txt in2.txt > t10_1.out
	./t10 30000 huge-b-10000.dict huge-b-5000.dict huge-a-5000.dict > t10_2.out
	
diff:
	diff t1_1.std t1_1.out
	diff t2_1.std t2_1.out
	diff t2_2.std t2_2.out
	diff t2_3.std t2_3.out
	diff t3_1.std t3_1.out
	diff t4_1.std t4_1.out
	diff t5_1.std t5_1.out
	diff t6_1.std t6_1.out
	diff t6_2.std t6_2.out
	diff t7_1.std t7_1.out
	diff t8_1.std t8_1.out
	diff t8_2.std t8_2.out
	diff t9_1.std t9_1.out
	diff t10_1.std t10_1.out
	diff t10_2.std t10_2.out
	
clean:
	-rm t1 t2 t3 t4 t5 t6 t7 t8 t9 t10
