DATAS SEGMENT
ARRAYX DB 49,31,12,32,99,12
ARRAYY DB 42,41,33,32,41,13
SUM DB 5 DUP(0)
DATAS ENDS

CODE SEGMENT
MAIN PROC FAR
ASSUME CS:CODE,DS:DATAS
MOV AX,DATAS
MOV DS,AX
MOV CL,08H
MOV AL,00H
LEA SI,ARRAYX
LEA DI,ARRAYY
CLC
REPEAT:
ADC SUM[AL],[DI]
ADC SUM[AL],[SI]
INC SI
INC DI
DEC CL
JNZ REPEAT
MOV AX,4C00H
INT 21H
CODE ENDS
END MAIN