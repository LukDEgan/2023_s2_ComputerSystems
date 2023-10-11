@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@16 //popstatic 3
D=A
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@16 //pushstatic 3
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@4 //pushconstant 4
D=A
@SP
A=M
M=D
@SP
M=M+1
@16 //popstatic 3
D=A
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@16 //pushstatic 3
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP //neg
A=M-1
M=-M

@16 //popstatic 2
D=A
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@16 //pushstatic 2
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
(END) // label END

@END // goto END
0;JMP

