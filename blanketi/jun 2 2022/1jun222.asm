name 1jun222
data segment
	N dw 5
	M dw 6
	REZ dd ?
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
	mov ax,stack
	mov ss, ax
	lea sp, tos

	xor si,si
	xor di,di;suma
	
	mov cx,N
	sub cx,2
	inc cx

	mov bp,2;i
petlja:
	mov ax,M
	sub ax,bp;M-i je u ax
	cwd
	mov bx,bp
	shr bx,1;i/2 je bx
	idiv bx;u ax je broj
	add si,ax
	adc di,0
	inc bp
	loop petlja
	
	mov word ptr REZ,si
	mov word ptr REZ+1,di

	mov ah,4ch
	int 21h
code ends
end ut
