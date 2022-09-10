name 65zad
data segment
	rez dd ?
	MAT dd 1,2,3,4,5,6,7,8,9
	N db 3
	M db 3
	K db 1
	i db 1
	j db 1
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
	mov cl,N
	xor ch,ch;za obe petlje
spoljnja:
	push cx; save cx
	
	xor si,si
	mov cl,N
	xor ch,ch
	xor ax,ax
	unutrasnja:
	
	mov al, j
	xor ah,ah
	mov dl, i
	div dl; j/i
	
	cmp ah, K
	jne dalje
	mov ax,  word ptr MAT[bx][si]
	add word ptr rez, ax
	mov ax,  word ptr MAT[bx][si]+2
	adc word ptr rez+2, ax

	dalje:
	inc j
	add si,4
	loop unutrasnja
	
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	inc i
	mov j, 1
	
	pop cx;restore cx
	loop spoljnja

	
	mov ah, 4ch
	int 21h
	
code ends
end ut