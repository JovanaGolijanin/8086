extrn nzd:far
name 56zad
data segment
	NIZ dw 3, 6, 12, 18, 24;10
	BREL db 5
	BRPAR db 0
data ends
stack segment 
	bos dw 200 dup(?)
	tos label word
stack ends 
code segment
	assume cs:code, ds:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss, ax
	lea sp, tos

	mov cl, BREL
	xor ch,ch
	dec cx
	xor si,si
	xor di,di
spoljnja:
	mov dx, cx
	mov di,si
	add di,2
	unutrasnja:
	

	;slanje ulaznih parametara
	mov ax, NIZ[si]
	mov bx, NIZ[di]
	;poziv
	call nzd
	;preuzimanje izlaznih parametara
	cmp ax,1
	je dalje
	cmp bx, 1
	je dalje
	inc BRPAR
	dalje:
	
	add di,2
	loop unutrasnja
	
	add si,2
	mov cx, dx
	loop spoljnja
	
	mov ah, 4ch
	int 21h
	
code ends
end ut