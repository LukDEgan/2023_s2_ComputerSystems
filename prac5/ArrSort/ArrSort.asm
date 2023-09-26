// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// bubble sort

//R3 is a[j] value
//R4 is a[j+1] value
//R5 is sign of a[j]
//R6 is sign of a[j+1]
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
@i
M=D
@j
M=D
@R2
M=M+D
M=M-1
@iteration
M=0

//outer loop start, checking if i is beyond limit
(OUTER)
@i
D=M
@R2
D=M-D //for(i<n-1)
D=D-1
@END
D;JLE

@R1
D=M
@j
M=D

//inner loop start checking if j is within limit
(INNER)
@R2
D=M-1
@iteration
D=D-M
@j
D=M-D
@NEXTOUTER
D;JGT

//next, getting a[j] and a[j+1]
@j
A=M
D=M
@R3 //getting a[j] value and storing in R3
M=D
@R5
M=D
@j
A=M+1
D=M 
@R4 //storing a[j+1] value in R4
M=D
@R6
M=D
//do xor logic to see if numbers have different sign (A AND NOT B) + (B AND NOT A)
@R5
D=M
@R6
M=!M
D=D&M
@R7
M=D
@R6
M=!M
D=M
@R5
M=!M
D=D&M
@R8
M=D
@R7
D=D|M
@SUB
D;JEQ
@SWAP
0;JMP


(SUB)
@R3
D=D-M //a[j+1] - a[j] 
@SWAP
D;JLT //swap if a[j] > a[j+1]

@NEXTINNER
0;JMP


(SWAP)
@R4
D=M
@j
A=M
M=D

@R3
D=M
@j
A=M+1
M=D


(NEXTINNER)
@j
M=M+1
@INNER
0;JMP


(NEXTOUTER)
@i
M=M+1
@iteration
M=M+1
@OUTER
0;JMP


(END)
@R0
M=-1
(END2)
@END2
0;JMP