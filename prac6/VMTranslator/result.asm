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
@TranslatorTest00.add_return_1// call TranslatorTest00.add 2
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
@TranslatorTest00.add_1 // goto TranslatorTest00.add_1
0;JMP
(TranslatorTest00.add_return_1) // label TranslatorTest00.add_return_1

(END) // label END

@END // goto END
0;JMP

(TranslatorTest00.add_1) // function TranslatorTest00.add 2
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
@5
A=D-A
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