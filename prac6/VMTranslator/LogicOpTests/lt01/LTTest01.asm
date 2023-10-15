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
@SP //lt
AM=M-1
D=M
A=A-1
D=M-D
@LT_TRUE_1
D;JLT
D=0
@LT_FALSE_2
0;JMP
(LT_TRUE_1)
D=-1
(LT_FALSE_2)
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

@SP //lt
AM=M-1
D=M
A=A-1
D=M-D
@LT_TRUE_3
D;JLT
D=0
@LT_FALSE_4
0;JMP
(LT_TRUE_3)
D=-1
(LT_FALSE_4)
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
@SP //lt
AM=M-1
D=M
A=A-1
D=M-D
@LT_TRUE_5
D;JLT
D=0
@LT_FALSE_6
0;JMP
(LT_TRUE_5)
D=-1
(LT_FALSE_6)
@SP
A=M-1
M=D

@SP //lt
AM=M-1
D=M
A=A-1
D=M-D
@LT_TRUE_7
D;JLT
D=0
@LT_FALSE_8
0;JMP
(LT_TRUE_7)
D=-1
(LT_FALSE_8)
@SP
A=M-1
M=D

@SP //lt
AM=M-1
D=M
A=A-1
D=M-D
@LT_TRUE_9
D;JLT
D=0
@LT_FALSE_10
0;JMP
(LT_TRUE_9)
D=-1
(LT_FALSE_10)
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

