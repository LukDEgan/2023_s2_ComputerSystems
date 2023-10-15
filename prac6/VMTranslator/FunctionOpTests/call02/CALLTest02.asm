@FUNCTIONTest02.first_return_1// call FUNCTIONTest02.first 0
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@FUNCTIONTest02.first_1 // goto FUNCTIONTest02.first_1
0;JMP
(FUNCTIONTest02.first_return_1) // label FUNCTIONTest02.first_return_1

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

(FUNCTIONTest02.first_1) // function FUNCTIONTest02.first 0

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
@FUNCTIONTest02.second_return_2// call FUNCTIONTest02.second 2
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@FUNCTIONTest02.second_2 // goto FUNCTIONTest02.second_2
0;JMP
(FUNCTIONTest02.second_return_2) // label FUNCTIONTest02.second_return_2

@LCL // return 
D=M
@R13
M=D
@R13
D=M
@5
A=D-A
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
A=D-1
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

(FUNCTIONTest02.second_2) // function FUNCTIONTest02.second 2
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0

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
@ARG //pushargument 1
D=M
@1
A=D+A
D=M
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

@LCL // return 
D=M
@R13
M=D
@R13
D=M
@5
A=D-A
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
A=D-1
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

