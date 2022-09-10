name 64zad
data segment
	MAT db 1,2,3,4,5,6,7,8,9
	N db 3
	BROJ db 4 
	NIZ db 9 dup(?)
	i db 1
	j db 1
	rez dw ?
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
	
	xor bx,bx; za pocetak vrste
	xor di,di; kroz pomocni niz
	mov cl,N
	xor ch,ch;za obe petlje
spoljnja:
	push cx; save cx
	
	xor si,si
	mov cl,N
	xor ch,ch
	xor ax,ax
	unutrasnja:
	mov al, i
	add al, j
	cmp al, BROJ
	jne dalje
	mov ah, MAT[bx][si]
	mov NIZ[di], ah
	inc di;to je i broj elemenata niza
	dalje:
	inc j
	inc si
	loop unutrasnja
	
	add bl, N
	adc bh,0
	inc i
	mov j, 1
	
	pop cx;restore cx
	loop spoljnja
	
	
	mov cx,di; broj elemenata
	dec cx
	xor ax,ax
	xor si,si; za prolazak od pocetka
	
	mov al, NIZ[si]
	inc si
	petlja:
	mov ah, NIZ[si]
	mul ah
	inc si
	loop petlja
	
	mov rez, ax

	
	mov ah, 4ch
	int 21h
	
code ends
end ut