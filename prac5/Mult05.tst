// Sample Test file for Mult.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load Mult.asm,
output-file Mult05.out,
compare-to Mult05.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

//Testing a larger R1 because I use R1 to loop R0 = R0 + R2 R1 times if that makes senses
set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 100,  // Set R1
set RAM[2] 10;  // Set R2
repeat 1000 {
  ticktock;    // Run for 1000 clock cycles
}
set RAM[1] 100,  // Restore arguments in case program used them
set RAM[2] 10,
output;        // Output to file

