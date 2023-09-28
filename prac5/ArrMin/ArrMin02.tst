load ArrMin.asm,
output-file ArrMin02.out,
compare-to ArrMin02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[44]%D2.6.2 RAM[45]%D2.6.2 RAM[46]%D2.6.2 RAM[47]%D2.6.2 RAM[48]%D2.6.2 RAM[49]%D2.6.2 RAM[50]%D2.6.2 RAM[51]%D2.6.2 RAM[52]%D2.6.2 RAM[53]%D2.6.2;

//testig a larger array wih only negative numbers
set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  44, // Set R1
set RAM[2]  10,  // Set R2
set RAM[44] -1,
set RAM[45] -6,
set RAM[46] -12,
set RAM[47] -5,
set RAM[48] -17,
set RAM[49] -4,
set RAM[50] -9,
set RAM[51] -1000,
set RAM[52] -1001,
set RAM[53] -10000,
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 44,  // Restore arguments in case the program used them
set RAM[2] 10,
output;        // Output to file
