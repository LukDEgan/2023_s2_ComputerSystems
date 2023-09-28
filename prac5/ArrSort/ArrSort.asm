// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// bubble sort

//R3 is a[j] value
//R4 is a[j+1] value
//R5 is sign of a[j]
//R6 is sign of a[j+1]
//R10 is i
//R11 is j
//R12 is iteration 

//Checking bounds
@R1
D=M
@END2
D;JLE
@R2
D=M
@END2
D;JLE

//Initializing
@R0
M=0
@R1
D=M
@R2
M=M+D
M=M-1
@R10
M=D-1
@R11
M=D-1
@R12
M=-1

//outer loop start, checking if i is beyond limit
(OUTER)
@R10
M=M+1
@R12
M=M+1
@R10
D=M
@R2
D=M-D //for(i<n-1)
@END
D;JLE

@R1
D=M
@R11
M=D

//inner loop start checking if j is within limit
(INNER)
@R2
D=M-1
@R12
D=D-M
@R11
D=M-D
@OUTER
D;JGT

//next, getting a[j] and a[j+1]
@R11
A=M+1
D=M 
@R4 //storing a[j+1] value in R4
M=D
@R11
A=M
D=M
@R3 //getting a[j] value and storing in R3
M=D
@FIRSTPOS
D;JGE
@R4
D=M
@SUB
D;JLT
@NEXTINNER
0;JMP
(FIRSTPOS)
@R4
D=M
@SWAP
D;JLT

(SUB)
@R3
D=D-M //a[j+1] - a[j] 
@NEXTINNER
D;JGE //swap if a[j] > a[j+1]

(SWAP)
@R4
D=M
@R11
A=M
M=D
@R3
D=M
@R11
A=M+1
M=D


(NEXTINNER)
@R11
M=M+1
@INNER
0;JMP




(END)
@R0
M=-1
(END2)
@END2
0;JMP