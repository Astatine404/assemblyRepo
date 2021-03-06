.MODEL SMALL
.STACK 64
.DATA
	HOR DB ?
	VER DB ?
	TL DB ?
	TR DB ?
	BLE DB ?
	BR DB ?
	CNT DB ?
.CODE
MOV AX,@DATA
MOV DS,AX
MOV HOR,205D
MOV VER,186D
MOV TL,201D
MOV TR,187D
MOV BLE,200D
MOV BR,188D

#CLEAR SCREEN
MOV AH,06H
MOV BH,71H
MOV CX,0000H
MOV DX,184FH
INT 10H

#SET CURSOR
MOV AH,02H
MOV BH,00D  #PAGE NUMBER
MOV DH,08D
MOV DL,27D
INT 10H

#PRINT TL
MOV DL,TL
MOV AH,06H
INT 21H

#PRINT HOR
MOV CNT,28D
HORLP:
MOV DL,HOR
MOV AH,06H
INT 21H
INC CNT
CMP CNT,58D
JNZ HORLP

#PRINT TR
MOV DL,TR
MOV AH,06H
INT 21H


MOV CL,09D
MOV CH,32D
NLINE:
#SET CURSOR
MOV AH,02H
MOV BH,00D  #PAGE NUMBER
MOV DH,CL
MOV DL,27D
INT 10H
#PRINT CURR LINE
 #PRINT VER
MOV DL,VER
MOV AH,06H
INT 21H
MOV CNT,28D
HORLP1:
MOV DL,CH
MOV AH,06H
INT 21H
INC CH
CMP CH,255D
JZ EXITLP
INC CNT
CMP CNT,58D
JNZ HORLP1
 #PRINT VER
MOV DL,VER
MOV AH,06H
INT 21H
INC CL
CMP CL,17D
JNZ NLINE
EXITLP:
#PRINT VER
 #SET CURSOR
MOV AH,02H
MOV BH,00D  #PAGE NUMBER
MOV DH,CL
MOV DL,58D
INT 10H
MOV DL,VER
MOV AH,06H
INT 21H
INC CL

#PRINT LAST LINE
MOV AH,02H
MOV BH,00D  #PAGE NUMBER
MOV DH,CL
MOV DL,27D
INT 10H
 #PRINT BLE
MOV DL,BLE
MOV AH,06H
INT 21H
 #PRINT HOR
MOV CNT,28D
HORLP2:
MOV DL,HOR
MOV AH,06H
INT 21H
INC CNT
CMP CNT,58D
JNZ HORLP2
 #PRINT BR
MOV DL,BR
MOV AH,06H
INT 21H

MOV AX,4C00H
INT 21H

END