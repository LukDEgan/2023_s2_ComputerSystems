// Sample Test file for ArrMin.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load ArrMin.asm,
output-file ArrMin01.out,
compare-to ArrMin01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[10]%D2.6.2 RAM[11]%D2.6.2 RAM[12]%D2.6.2 RAM[13]%D2.6.2 RAM[14]%D2.6.2 RAM[15]%D2.6.2 RAM[16]%D2.6.2 RAM[17]%D2.6.2;

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  10, // Set R1
set RAM[2]  8,  // Set R2
set RAM[10] 2,
set RAM[11] -7,
set RAM[12] 15,
set RAM[13] 0,
set RAM[14] 23,
set RAM[15] -9,
set RAM[16] 42,
set RAM[17] -14,
repeat 400 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 10,  // Restore arguments in case program used them
set RAM[2] 8,
output;        // Output to file

