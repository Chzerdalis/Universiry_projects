Χαράλαμπος Μαλακούδης 03516 cmalakoudis@uth.gr
Χριστόδουλος Ζερδαλής 03531 chzerdalis@uth.gr
Ορέστης Πανόπουλος 03269 opanopoulos@uth.gr

Οδηγίες μεταγλώτισης syscall:
	Προκειμένου να μεταγλωτιστεί η main και να δημιουργήσουμε την βιβλιοθήκη, στον φάκελο με τα αρχεία roots.h roots.c find_roots_lib.c, εκτελούμε τις εντολές:
	gcc -c roots.c -o roots.o
	ar rcs libroots.a roots.o
	gcc find_roots_lib.c -o find_roots_lib -L. -lroots
Επίσης, στον φάκελο έχει προστεθεί το αρχείο με τον κώδικα του syscall find_roots.c

Οδηγίες μεταγλώτισης module:
    Προκειμένου να μεταγλωτιστεί το module που φτιάξαμε αρκεί να πάμε στον κατάλογο project1_module, να
    τρέξουμε την εντολή 'make' για να δημιουργηθεί το .ko αρχείο και στην συνέχεια να τρέξουμε την εντολή 'sudo insmod project1_kyber.ko' για να γίνει η εισαγωγή του module στον πυρήνα του λειτουργικού. Για να γίνει η εξαγωγή του module αρκεί να τρέξουμε 'sudo rmmod project1_kyber.ko'

Οδηγίες μεταγλώτισης sysfs_module:
    Προκειμένου να μεταγλωτιστεί το module που φτιάξαμε αρκεί να πάμε στον κατάλογο sysfs_module, να
    τρέξουμε την εντολή 'make' για να δημιουργηθεί το .ko αρχείο και στην συνέχεια να τρέξουμε την εντολή 'sudo insmod sysfs_module.ko' για να γίνει η εισαγωγή του module στον πυρήνα του λειτουργικού. Για να γίνει η εξαγωγή του module αρκεί να τρέξουμε 'sudo rmmod sysfs_module.ko'
