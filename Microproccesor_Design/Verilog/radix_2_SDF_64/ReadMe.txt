Για να τρέξετε το testbench και την υλοποίηση, βάζεται όλα τα αρχεία στο Vivado.
Το testbence "test_fft_16.v" τεστάρει το ολόκληρο το FFT ενώ το "test_unit.v" 
τεστάρει τα stages απο μόνα τους. Προτιμήστε το πρώτο. Το αρχείο stage_unit 
αναφέρεται στο module που υλοποιεί ένα stage του SDF, το delay buffer χρησημοποιείται 
απο το stage_unit. To fft_64 ειναι το top module που συνδέει τα stage units μεταξύ τους
