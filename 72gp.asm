extrn zbir:far
name 72zad
data segment
	MAT dw -1,1,1,1,1,1,-2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,-3,3,3,3,3,3
	N dw 5
	M dw 6
	SUMA dd ?
data ends
stack segment
	bos dw 100 dup(?)
	tos label word
stack ends
code segment
	assume cs:code, ds:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss,ax
	lea sp, tos
	
	mov ax,M
	shl ax,1;2M
	mov bx, N
	dec bx;N-1
	mul bx;dx:ax = 2M(N-1)
	mov bx,ax;bx= 2M(N-1)
	mov cx,N
	xor si,si;fiksno
petlja:
	cmp word ptr MAT[bx][si],0
	jge dalje
	
	;slanje ulaznih parametara
	lea ax,MAT[bx][si]
	push ax
	push M
	;poziv
	call zbir
	;preuzimanje izlaznih parametara
	pop dx; visa rec zbira
	pop ax; niza rec zbira
	mov word ptr SUMA, ax
	mov word ptr SUMA+2, dx
	
	jmp kraj
	dalje:
	mov di, M
	shl di,1;2M
	sub bx, di
	
	loop petlja
	
	kraj:
	mov ah, 4ch
	int 21h
	
code ends
end ut