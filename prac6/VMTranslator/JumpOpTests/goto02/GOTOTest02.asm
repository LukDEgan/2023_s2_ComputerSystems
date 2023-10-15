(label1) // label label1

@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@label3 // goto label3
0;JMP

(label2) // label label2

@SP //add
AM=M-1
D=M
A=A-1
M=D+M

@label4 // goto label4
0;JMP

(label3) // label label3

@1 //pushconstant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@label2 // goto label2
0;JMP

(label4) // label label4

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
@label5 // goto label5
0;JMP

(label5) // label label5

(END) // label END

@END // goto END
0;JMP

