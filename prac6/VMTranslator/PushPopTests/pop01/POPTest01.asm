@2 //pushconstant 2
D=A
@SP
A=M
M=D
@SP
M=M+1
@ARG //popargument 0
D=M
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
@3 //pushconstant 3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //poplocal 0
D=M
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
@4 //pushconstant 4
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@5 //pushconstant 5
D=A
@SP
A=M
M=D
@SP
M=M+1
@5 //poptemp 0
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
@6 //pushconstant 6
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS //popthis 0
D=M
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
@7 //pushconstant 7
D=A
@SP
A=M
M=D
@SP
M=M+1
@THAT //popthat 0
D=M
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

