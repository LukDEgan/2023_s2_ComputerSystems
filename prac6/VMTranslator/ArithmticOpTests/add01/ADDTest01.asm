@3 //pushconstant 3
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
@SP //add
AM=M-1
D=M
A=A-1
M=D+M

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
@SP //add
AM=M-1
D=M
A=A-1
M=D+M

@SP //add
AM=M-1
D=M
A=A-1
M=D+M

@SP //add
AM=M-1
D=M
A=A-1
M=D+M

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

