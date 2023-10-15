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

@SP //sub
AM=M-1
D=M
A=A-1
M=M-D

@4 //pushconstant 4
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP //sub
AM=M-1
D=M
A=A-1
M=M-D

@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@2 //pushconstant 2
D=A
@SP
A=M
M=D
@SP
M=M+1
@3 //pushconstant 3
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP //sub
AM=M-1
D=M
A=A-1
M=M-D

@SP //sub
AM=M-1
D=M
A=A-1
M=M-D

@SP //sub
AM=M-1
D=M
A=A-1
M=M-D

@16 //popstatic 0
D=A
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(END) // label END

@END // goto END
0;JMP

