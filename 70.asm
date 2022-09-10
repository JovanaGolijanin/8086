name 70zad
data segment
	MAT dd 1,1,1,2,2,2,3,3,3
	N db 3
	VRSTA dw ?
	suma dd 0
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
	
	mov cl,N
	xor ch,ch
	
	xor bx,bx;kroz vrste
	xor di,di; trenutni indeks vrste
	
petlja:
	push cx
	xor si,si; kroz elemente vrste
	xor ax,ax
	xor dx,dx; suma trenutna
	mov cl,N
	xor ch,ch
	
	unutrasnja:
	add ax, word ptr MAT[bx][si]
	adc dx, word ptr MAT[bx][si]+2
	add si,4
	loop unutrasnja
	
	cmp dx, word ptr suma+2
	ja zameni
	cmp ax, word ptr suma
	ja zameni
	jmp dalje
	zameni:
	mov word ptr suma, ax
	mov word ptr suma+2, dx
	
	mov VRSTA, di
	
	dalje:
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	
	inc di
	
	pop cx
	loop petlja
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut