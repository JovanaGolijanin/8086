name 3labpr
data segment
	brel db 5
	niz1 dw 2,2,2,2,2 ;10
	niz2 dw 1,1,1,1,1 ;5
	razlika dd 0
	sum1 dd 0
	sum2 dd 0
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	
	lea bx, [niz1]
	lea si, [niz2]
	
	xor ax, ax
	xor dx,dx
	
	xor di, di
	xor bp, bp
	
	xor ch, ch
	mov cl,brel
	petlja:
	add ax, [bx]
	adc dx,0
	add di, [si]
	adc bp,0
	
	add bx,2
	add si,2
	
	loop petlja
	
	mov word ptr sum1, ax
	mov word ptr sum1+2, dx
	mov word ptr sum2, di
	mov word ptr sum2+2, bp
	
	cmp dx, bp 
	ja s1
	jb s2
	je istiVisi
	s1:
	sub ax, di
	sbb dx, 0
	sub dx, bp
	sbb dx,0
	mov word ptr razlika, ax
	mov word ptr razlika+2, dx
	jmp ispod
	s2:
	sub di, ax
	sbb bp, 0
	sub bp,dx
	sbb bp,0
	mov word ptr razlika, di
	mov word ptr razlika+2, bp
	jmp ispod
	istiVisi:
	cmp ax, di
	ja s1
	jb s2
	
	ispod:
	
	mov ah,4ch
	int 21h
code ends
end start