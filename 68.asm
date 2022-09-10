name 68zad
data segment
	MAT dw 1,2,4,4,5,6,7,8,9
	N db 3
	i db 1
	j db 1
	ZBIRG dd 0
	ZBIRS dd 0
	rez dd ?
	pom dw ?
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
	mov ss, ax
	lea sp, tos
	
	xor bx,bx; za pocetak vrste
	mov cl,N
	xor ch,ch;za obe petlje
	xor di,di; element sa sporedne
	xor bp,bp; element sa glavne
spoljnja:
	push cx; save cx
	
	xor si,si
	mov cl,N
	xor ch,ch
	unutrasnja:
	xor ax,ax
	
	mov ah, i
	mov al, j
	cmp ah,al
	jne sporedna
	lea bp, MAT[bx][si];adresa elementa sa glavne
	mov dx, MAT[bx][si]; sacuvaj element sa glavne
	push dx
	mov ax, MAT[bx][si]
	add word ptr ZBIRG, ax
	adc word ptr ZBIRG+2, 0
	
	sporedna:
	xor ax,ax
	mov al, i
	mov ah, j
	add al,ah;al=i+j
	mov dl, N
	inc dl
	cmp al,dl
	jne dalje
	mov di, MAT[bx][si]
	mov ax, MAT[bx][si]
	add word ptr ZBIRs, ax
	adc word ptr ZBIRs+2, 0
	pop dx
	mov MAT[bx][si], dx
	mov word ptr [bp], di

	dalje:
	inc j
	add si,2
	loop unutrasnja
	
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	inc i
	mov j, 1
	
	pop cx;restore cx
	loop spoljnja

	mov ax, word ptr ZBIRS+2
	cmp word ptr ZBIRG+2, ax
	ja GminusS
	mov ax, word ptr ZBIRS
	cmp word ptr ZBIRG, ax
	ja GminusS
	mov ax, word ptr ZBIRS
	sub ax, word ptr ZBIRG
	mov word ptr ZBIRS, ax
	
	mov ax, word ptr ZBIRS+2
	sbb ax, word ptr ZBIRG+2
	mov word ptr ZBIRS+2, ax
	
	mov ax, word ptr ZBIRS
	mov dx, word ptr ZBIRS+2
	mov word ptr rez, ax
	mov word ptr rez+2, dx
	jmp kraj
	
	GminusS:
	mov ax, word ptr ZBIRG
	sub ax, word ptr ZBIRS
	mov word ptr ZBIRG, ax
	
	mov ax, word ptr ZBIRG+2
	sbb ax, word ptr ZBIRS+2
	mov word ptr ZBIRG+2, ax
	
	mov ax, word ptr ZBIRG
	mov dx, word ptr ZBIRG+2
	mov word ptr rez, ax
	mov word ptr rez+2, dx
	
	kraj:
	
	mov ah, 4ch
	int 21h
	
code ends
end ut