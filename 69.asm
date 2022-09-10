name 69zad
data segment
	MAT dd 1,3,2, 3,1,3,2,3,1
	N db 3
	rez dd ?
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax
	
	mov cl,N
	xor ch,ch
	
	mov bx, cx;N
	
	xor si,si
	mov di,cx
	dec di
	shl di,	1
	shl di, 1
	
	xor ax,ax
	xor dx,dx
	
petlja:
	mov ax, word ptr MAT[si]
	mov dx, word ptr MAT[si]+2
	
	add word ptr rez, ax
	adc word ptr rez+2, dx
	
	mov ax, word ptr MAT[di]
	mov dx, word ptr MAT[di]+2
	
	sub word ptr rez, ax
	sbb word ptr rez+2, dx
	
	
	mov bp, bx
	inc bp
	shl bp,1
	shl bp,1;4(N+1)
	add si,bp
	
	mov bp, bx
	dec bp
	shl bp,1
	shl bp,1;4(N-1)
	add di,bp
	
	
	loop petlja
	
	mov ah, 4ch
	int 21h
	
code ends
end ut