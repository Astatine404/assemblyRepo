.MODEL SMALL
.STACK 64
.DATA
	N DB 00H
	INARR DB 30 DUP(30H)
	LARGEST DB ?
	SMALLEST DB ?
.CODE
MAIN PROC FAR
MOV AX,@DATA
MOV DS,AX

#TAKE INPUT
MOV AH,10H
INT 16H
MOV N,AL
SUB N,30H
MOV CL,N
LEA SI,INARR
REPINPUT:
MOV AH,10H
INT 16H
SUB AL,30H
MOV [SI],AL
INC SI
DEC CL
JNZ REPINPUT

#FIND LARGEST (LARGEST IS IN BL)
MOV BL,00H
MOV CL,N
LEA SI,INARR
ARRITER:
MOV BH,[SI]
CMP BL,BH
JS REPLACE
JMP INCREMENT
REPLACE:
MOV BL,BH
INCREMENT:
INC SI
DEC CL
JNZ ARRITER
MOV LARGEST,BL

#FIND SMALLEST (SMALLEST IS IN BL)
MOV BL,100D
MOV CL,N
LEA SI,INARR
ARRITER2:
MOV BH,[SI]
CMP BH,BL
JS REPLACE2
JMP INCREMENT2
REPLACE2:
MOV BL,BH
INCREMENT2:
INC SI
DEC CL
JNZ ARRITER2
MOV SMALLEST,BL

#PRINTING SMALLEST
MOV AL,SMALLEST
MOV AH,00H
MOV BL,0AH
DIV BL
 #PRINT QUOTIENT IN AL
MOV BH,AH
ADD AL,30H
MOV DL,AL
MOV AH,02H
INT 21H
 #PRINT REMAINDER IN BH
MOV DL,BH
ADD DL,30H
MOV AH,02H
INT 21H

#PRINT NEWLINE
MOV DL,0AH
MOV AH,02H
INT 21H

#PRINTING LARGEST
MOV AL,LARGEST
MOV AH,00H
MOV BL,0AH
DIV BL
 #PRINT QUOTIENT IN AL
MOV BH,AH
ADD AL,30H
MOV DL,AL
MOV AH,02H
INT 21H
 #PRINT REMAINDER IN BH
MOV DL,BH
ADD DL,30H
MOV AH,02H
INT 21H

MOV AX,4C00H
INT 21H
NOP
MAIN ENDP
END MAIN
