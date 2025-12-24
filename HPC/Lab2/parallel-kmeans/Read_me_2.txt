Προσθέσαμε στην main τα: -p (num of threads)
			 -x (num of chunk) το μέγεθος του chunk στο schedule(dynamic/static, chunk_size)
			 
e.x. ./seq_main -o -b -n 2000 -i Image_data/texture17695.bin -p 8 -x 32
Αν δεν τα σετάρετε τα threads είναι dynamic και το chunk 1

