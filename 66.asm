name 66zad
data segment
	MAT dw 1,2,3,4,5,6,7,8,9
	N db 3
	i db 1
	j db 1
	NIZS dw 3 dup(?)
	NIZK dw 3 dup(?)
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
	xor di,di; za NIZS
	xor bp,bp; za NIZK
spoljnja:
	push cx; save cx
	
	xor si,si
	mov cl,N
	xor ch,ch
	xor ax,ax
	unutrasnja:
	
	mov al, i
	mov ah, j
	add al,ah;al=i+j
	mov dl, N
	inc dl
	cmp al,dl
	jne kolona
	mov ax, MAT[bx][si]
	mov NIZS[di], ax
	add di,2
	
	kolona:
	cmp si,4
	jne dalje
	mov ax, MAT[bx][si]
	mov NIZK[bp], ax
	add bp,2

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
	
	
	
	xor bx,bx; za pocetak vrste
	mov i,1
	mov j,1
	mov cl,N
	xor ch,ch;za obe petlje
	xor di,di; za NIZS
	xor bp,bp; za NIZK
spoljnja2:
	push cx; save cx
	
	xor si,si
	mov cl,N
	xor ch,ch
	xor ax,ax
	unutrasnja2:
	
	mov al, i
	mov ah, j
	add al,ah;al=i+j
	mov dl, N
	inc dl
	cmp al,dl
	jne kolona2
	mov ax, NIZK[bp]
	mov MAT[bx][si],ax
	add bp,2
	
	kolona2:
	cmp si,4
	jne dalje2
	mov ax, NIZS[di]
	mov MAT[bx][si],ax
	add di,2

	dalje2:
	inc j
	add si,2
	loop unutrasnja2
	
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	inc i
	mov j, 1
	
	pop cx;restore cx
	loop spoljnja2

	
	mov ah, 4ch
	int 21h
	
code ends
end ut