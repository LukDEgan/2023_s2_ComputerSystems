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
(END) // label END

@END // goto END
0;JMP

