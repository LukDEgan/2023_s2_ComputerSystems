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
@SP //eq
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_1
D;JEQ
D=0
@EQ_FALSE_2
0;JMP
(EQ_TRUE_1)
D=-1
(EQ_FALSE_2)
@SP
A=M-1
M=D

@1 //pushconstant 1
D=A
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

@SP //eq
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_3
D;JEQ
D=0
@EQ_FALSE_4
0;JMP
(EQ_TRUE_3)
D=-1
(EQ_FALSE_4)
@SP
A=M-1
M=D

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
@SP //eq
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_5
D;JEQ
D=0
@EQ_FALSE_6
0;JMP
(EQ_TRUE_5)
D=-1
(EQ_FALSE_6)
@SP
A=M-1
M=D

@SP //eq
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_7
D;JEQ
D=0
@EQ_FALSE_8
0;JMP
(EQ_TRUE_7)
D=-1
(EQ_FALSE_8)
@SP
A=M-1
M=D

@SP //eq
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_9
D;JEQ
D=0
@EQ_FALSE_10
0;JMP
(EQ_TRUE_9)
D=-1
(EQ_FALSE_10)
@SP
A=M-1
M=D

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

