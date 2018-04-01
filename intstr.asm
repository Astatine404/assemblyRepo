.model small
.stack 64

.data
	num db 1, 0, 8, 3, 4, 7
	numconv db ?

	msg db "699$"
	msgconv db ?

	atd db "  Converted msg to int$"	
.code
	main proc far
		mov ax, @data
		mov ds, ax

		mov ah, 10h
		int 16h
		sub al, 30h

		dec al
	jz callis

		call strtoint		
	jmp lst
	
	callis:
		call inttostr		
	
	lst:
		mov ax, 4c00h
		int 21h
	main endp

	inttostr proc
		mov si, 0
		mov cl, 6

	lpp:	
		mov al, num[si]
		add al, 30h
		mov numconv[si], al
		
		inc si
		dec cl
	jnz lpp

		mov dl, 24h
		mov numconv[si], dl

		lea dx, numconv
		mov ah, 09h
		int 21h
		
		ret
	inttostr endp

	strtoint proc
		mov si, 0
		mov cl, 3
	lppp:
		mov bl, msg[si]
		sub bl, 30h
		mov msgconv[si], bl
		
		inc si
		dec cl
	jnz lppp

		lea dx, atd 
		mov ah, 09h
		int 21h

		ret
	strtoint endp
end main