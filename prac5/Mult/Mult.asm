// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R0
M=0

@R1
D=M
@END
D;JEQ
@R2
D=M
@END
D;JEQ

@is_neg
M=0;

@R1
D=M
@NEG
D;JLT
@LOOP
0;JMP
(NEG)
@is_neg
M=1
D=-D
@R1
M=D

(LOOP)
@R2
D=M
@R0
M=M+D
@R1
M=M-1
D=M
@LOOP
D;JGT

@is_neg
D=M
@CHANGE_SIGN
D;JGT
@END
0;JMP

(CHANGE_SIGN)
@R0
M=-M



(END)
@END
0;JMP