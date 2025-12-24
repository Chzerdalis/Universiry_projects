ex. ./test 1 3 AI ή ./test 2 4 Student
1ο arg Ayto_player_ai_depth , 2o Student_program_depth, ποιος παίζει πρώτος
Το bash αρχείο τρέχει πολλα διαφορετικά test 
Το input ./test 2 3 AI βγαζει segfault (και καποια ακόμη)
To make τα κανει ολα compile

Αλλαγές 
1) grader μπόρει να κάνει evaluate όλα τα παιχνίδια που αρχιζει ή το χ ή το ο
2) minmax δουλεύει και για το χ και για το ο
3) ai.make move μπορεί και χ και ο
4) otgrader.grademoves μπορει και για χ και για ο
5) η main του μαθητή δουλεύει με βάση την εκφώνηση
6) Το json δημιουργείται απο το aυto_player και οχι απο τον μαθητή

Δεν έγιναν 
1) Το auto player βγάζει έξοδο στο terminal και οχι σε αρχείο όπως λέει η εκφώνηση
