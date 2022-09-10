name 74zad
data segment
	MAT db 1,1,1,1,2,2,2,2,3,3,3,3
	N db 3
	M db 4
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

	xor bx,bx;kroz vrste
	xor ax,ax; suma
	mov cl,N
	xor ch,ch;brojac petlje
	
petlja:
	push cx
	xor si,si; kroz elemente vrste
	
	mov cl,M
	xor ch,ch; ide korz elemente vrste
	unutrasnja:
	add al, MAT[bx][si]
	adc ah,0
	inc si
	loop unutrasnja
	
	mov dl, M
	xor dh,dh
	dec dx
	mov si,dx;M-1
	
	mov MAT[bx][si], al
	dec si
	mov MAT[bx][si], ah
	
	add bl,M
	adc bh,0
	
	xor ax,ax

	pop cx
	loop petlja
	

	mov ah, 4ch
	int 21h
	
code ends
end ut