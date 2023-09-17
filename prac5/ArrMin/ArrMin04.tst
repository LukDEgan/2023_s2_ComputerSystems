load ArrMin.asm,
output-file ArrMin04.out,
compare-to ArrMin04.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;
//testing for negative length
set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  70, // Set R1
set RAM[2]  -3,  // Set R2
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 70,  // Restore arguments in case the program used them
set RAM[2] -3,
output;        // Output to file