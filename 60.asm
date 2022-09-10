name 60zad
data segment
	MAT dw 1, 2, 3, 4, 5, 6, 7, 8, 9
	VEK dw 3 dup(?)
	DIM db 3
	pom dw 0
	pom2 dw 0
	pom3 dw 0 ;koliko el je manje od DIM
	suma dw 0
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax
	
	xor bx,bx
	mov cl, DIM
	xor ch,ch
	mov al, DIM
	xor ah,ah; za uporedjivanje
	mov bp, ax
	shl al,1; ax je 2*dim
	mov pom, ax
	xor di,di; za vektor
	xor ax,ax
	
spoljna:
	mov pom2,cx
	xor si,si
	xor dx,dx
	
	mov cl, DIM
	xor ch,ch
	unutrasnja:
	
	cmp MAT[bx][si], bp
	jae preskoci
	inc pom3
	preskoci:
	add dx, MAT[bx][si]
	add ax, MAT[bx][si]
	add si, pom;2*dim
	
	loop unutrasnja
	
	mov VEK[di], dx
	add di,2
	add bx,2
	
	mov cx, pom2
	loop spoljna
	
	and pom3, 1
	jz paran
	clc
	jmp kraj
	paran:
	stc
	kraj:

	mov ah, 4ch
	int 21h
	
code ends
end ut