@test // goto test
0;JMP

(test) // label test

@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@END // goto END
0;JMP

(test) // label test

@2 //pushconstant 2
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
(END) // label END

@END // goto END
0;JMP

