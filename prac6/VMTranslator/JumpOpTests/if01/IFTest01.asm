@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // if-goto SKIP
AM=M-1
D=M
@SKIP
D;JNE

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
@END // goto END
0;JMP

(SKIP) // label SKIP

@1 //pushconstant 1
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

