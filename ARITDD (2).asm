.386
.model small
.stack

.data
	num1 dd 4
	num2 dd 2

.code
	main proc far
		mov ax, @data
		mov ds, ax

		mov ah, 10h
		int 16h
		sub al, 30h

		cmp al, 1
	jz calladd
		cmp al, 2
	jz callsub
		cmp al, 3
	jz callmul
		cmp al, 4
	jz calldiv

	calladd:
		call addnums
		jmp ending
	callsub:
		call subnums
		jmp ending
	callmul:
		call mulnums
		jmp ending
	calldiv:
		call divnums
	ending:

		mov ax, 4c00h
		int 21h
	main endp

	addnums proc
		mov edx, num1
		add edx, num2
		
		add edx, 30h
		mov ah, 02h
		int 21h
		
		ret
	addnums endp

	subnums proc
		mov dx, num1
		sub dx, num2
		
		add dx, 30h
		mov ah, 02h
		int 21h
		
		ret
	subnums endp

	mulnums proc
		mov ax, num1
		mov cx, num2
		mov dx, 0000
		mul cx
		
		mov dx, ax
		add dx, 30h
		mov ah, 02h
		int 21h
		
		ret
	mulnums endp

	divnums proc
		mov ax, num1
		mov cx, num2
		mov dx, 0000
		div cx
		
		mov dx, ax
		add dx, 30h
		mov ah, 02h
		int 21h
		
		ret
	divnums endp
end main