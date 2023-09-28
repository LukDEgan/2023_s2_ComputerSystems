load ArrMin.asm,
output-file ArrMin05.out,
compare-to ArrMin05.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2;
//Testing for overflow
set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  20, // Set R1
set RAM[2]  4,  // Set R2
set RAM[20] 32767,  // Set Arr[0]
set RAM[21] -32760,  // Set Arr[1]
set RAM[22] 34,  // Set Arr[2]
set RAM[23] 32767;  // Set Arr[3]
repeat 600 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 20,  // Restore arguments in case the program used them
set RAM[2] 4,
output;        // Output to file
