extrn saberi:far
name 62zad
data segment
	MAT dw 1, 2, 3, 4, 5, 6, 7, 8, 9
	N db 3
	ZBIR dd 0
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
	
	
	xor ax,ax
	mov al,N
	shl al,1
	mov di,ax ;2*N
	
	xor cx,cx
	mov cl, N
	xor si,si
	xor bx,bx
petlja:
	;slanje ulaznih parametara
	lea ax, MAT[bx][si]
	push ax
	mov al, N
	xor ah,ah
	push ax
	
	;poziv
	call saberi
	
	;preuzimanje izlaznih parametara
	pop dx
	pop ax ;skida sa VRHA steka a ne sa dna!!!!
	
	add word ptr ZBIR, ax
	add word ptr ZBIR+2,dx
	
	add bx, di
	
	loop petlja


	mov ah, 4ch
	int 21h
	
code ends
end ut