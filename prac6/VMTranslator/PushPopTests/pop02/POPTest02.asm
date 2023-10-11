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

@16 //popstatic 17
D=A
@17
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@16 //popstatic 17
D=A
@17
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

