name 59zad
data segment
	MAT dd 1,4,2,5,3,6
	ZBIRI dd ?
	ZBIRJ dd ?
	N db 2
	M db 3
	I db 0
	J db 1
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax

	mov bl, N
	shl bl,1;*2
	shl bl,1;*2
	mov al, J
	mul bl; u ax je J*4N
	mov bx, ax; indeks kolone koju sabiramo
	
	xor si,si; brojac elemenata kolone
	
	mov cl,N
	xor ch,ch
	xor ax, ax
	xor dx, dx
petlja:
	add ax,word ptr MAT[bx][si]
	adc dx,word ptr MAT[bx][si]+2
	add si,4
	loop petlja
	
	mov word ptr ZBIRJ, ax
	mov word ptr ZBIRJ+2, dx
	
	
	mov bl, N
	shl bl,1;*2
	shl bl,1;*2
	mov al, I
	mul bl; u ax je I*4N
	mov bx, ax; indeks vrste koju sabiramo
	
	xor si,si; brojac elemenata vrste
	
	mov cl,M
	xor ch,ch
	xor ax, ax
	xor dx, dx
petlja2:
	add ax,word ptr MAT[bx][si]
	adc dx,word ptr MAT[bx][si]+2
	add si,8
	loop petlja2
	
	mov word ptr ZBIRI, ax
	mov word ptr ZBIRI+2, dx
	
	mov ax,  word ptr ZBIRJ+2
	cmp word ptr ZBIRI+2, ax
	jb postavi
	mov dx, word ptr ZBIRJ
	cmp word ptr ZBIRI, dx
	jb postavi
	jmp nepostavljaj
	
	postavi:
	stc
	jmp kraj
	
	nepostavljaj:
	clc
	kraj:

	mov ah, 4ch
	int 21h
	
code ends
end ut