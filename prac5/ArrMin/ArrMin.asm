// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


//R3 is min value so far
//R4 is current element value
// Put your code here.
//check length is > 0
@R2
D=M
@END
D;JLE

//indexing starts at 0. Changing R2 to hold the last elements address instead. 
//If arr starts at 1000 and has 4 elements last element is at 1003 so must minus 1 from R1 M
@R1
D=M-1
@R2
M=M+D

//Initialise r0 to first element
@R1
A=M
D=M
@R0
M=D

//Begin loop
(LOOP)
//First check if the current element is within the array
@R1
D=M //get address of current
@R2
D=D-M //current address - end address. If gt 0, current address > end address, therefore out of bounds, jump to end
@END
D;JGT

@R1
A=M
D=M
@SUB
D;JLT
@R0
D=M
@SUB
D;JLT

@R1
A=M
D=M
@R4
M=D
@R0
D=M
@R3
M=D

@R4
M=!M
D=D&M
@R7
M=D
@R4
M=!M
D=M
@R3
M=!M
D=D&M
@R8
M=D
@R7
D=D|M
@SUB
D;JGE
@R1
A=M
D=M
@SWAP
D;JLT

(SUB)
@R1
A=M //if not, load current element address into A
D=M //load current element value into D
@R0
D=D-M //current value - curr min value >= 0. then  curr min <= curr value so move to next element
@NEXT
D;JGE

(SWAP)
@R1 // if not, swap elements
A=M // load current element into A and get value into D
D=M
@R0 // load D into R0
M=D


(NEXT)
@R1 //address moves up one to next element
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP


