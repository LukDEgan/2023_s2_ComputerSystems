load ArrMin.asm,
output-file ArrMin03.out,
compare-to ArrMin03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;
//testing an array of size 0
set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  100, // Set R1
set RAM[2]  0,  // Set R2
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 100,  // Restore arguments in case the program used them
set RAM[2] 0,
output;        // Output to file