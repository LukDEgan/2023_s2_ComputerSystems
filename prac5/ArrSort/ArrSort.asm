// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// bubble sort

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


(INNER)
@R2
D=M-1
@iteration
D=D-M
@j
D=M-D
@NEXTOUTER
D;JGT

@j
A=M
D=M
@R3
M=D
@j
A=M+1
D=M //a[j+1]
@R4
M=D
@R3
D=D-M //a[j+1] - a[j] 
@SWAP
D;JLT //swap if a[j] > a[j+1]

@NEXTINNER
0;JMP


(SWAP)
@R0
M=-1
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
@END
0;JMP