.model small
.stack 64

.data
	num1 db 48
	num2 db 2
	
.code
	main proc far
		mov ax, @data
		mov ds, ax

		mov ah, 10h
		int 16h
		sub al, 31h

		cmp al, 00h
	jz calladd
		cmp al, 01h
	jz callsub
		cmp al, 02h
	jz callmul
		cmp al, 03h
	jz calldiv

	calladd:
		call addnum
		jmp ending
	callsub:
		call subnum
		jmp ending
	callmul:
		call mulnum
		jmp ending
	calldiv:
		call divnum

	ending:
		mov ax, 4c00h
		int 21h
	main endp

	addnum proc
		mov al, num1
		add al, num2
		mov ah, 00
	
		mov bl, 0ah
		div bl
		mov cl, ah

		mov dl, al
		mov ah, 02h
		add dl, 30h
		int 21h
		mov dl, cl
		mov ah, 02h
		add dl, 30h
		int 21h
				

		ret
	addnum endp

	subnum proc
		mov al, num1
		sub al, num2
		mov ah, 00
	
		mov bl, 0ah
		div bl
		mov cl, ah

		mov dl, al
		mov ah, 02h
		add dl, 30h
		int 21h
		mov dl, cl
		mov ah, 02h
		add dl, 30h
		int 21h

		ret
	subnum endp

	mulnum proc
		mov al, num1
		mov dl, num2
		mul dl
		mov ah, 00

		mov bl, 0ah
		div bl
		mov cl, ah

		mov dl, al
		mov ah, 02h
		add dl, 30h
		int 21h
		mov dl, cl
		mov ah, 02h
		add dl, 30h
		int 21h

		ret
	mulnum endp

	divnum proc
		mov al, num1
		mov dl, num2
		mov ah, 00
		div dl

		mov ah, 00
		mov bl, 0ah
		div bl
		mov cl, ah

		mov dl, al
		mov ah, 02h
		add dl, 30h
		int 21h
		mov dl, cl
		mov ah, 02h
		add dl, 30h
		int 21h		

		ret
	divnum endp
end main