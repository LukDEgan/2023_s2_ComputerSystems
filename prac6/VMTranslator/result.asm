@1 //pushconstant 1
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
@add2_return_1// call add2 2
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
D=A
@SP
AM=M+1
A=A-1
M=D
@ARG
D=A
@SP
AM=M+1
A=A-1
M=D
@THIS
D=A
@SP
AM=M+1
A=A-1
M=D
@THAT
D=A
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
@add2_1 // goto add2_1
0;JMP
(add2_return_1) // label add2_return_1

(END) // label END

@END // goto END
0;JMP

(add2_1) // function add2 2
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
@R14
M=D
@5
A=D-A
@R15
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
@R14
D=M
A=D-1
D=M
@THAT
M=D
@R14
D=M
@2
A=D-A
D=M
@THIS
M=D
@R14
D=M
@3
A=D-A
D=M
@ARG
M=D
@R14
D=M
@4
A=D-A
D=M
@LCL
M=D
@R15
A=M
0;JMP