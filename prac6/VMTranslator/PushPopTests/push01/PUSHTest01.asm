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
@ARG //pushargument 0
D=M
@0
A=D+A
D=M
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
@LCL //pushlocal 0
D=M
@0
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
@16 //pushstatic 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@5 //pushtemp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@THIS //pushthis 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@THAT //pushthat 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3 //pushpointer 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3 //pushpointer 1
D=A
@1
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

