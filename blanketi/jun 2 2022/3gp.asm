extrn uporedi:far
name 3jun222gp
data segment
	MAT db 2,1,2,1,1, 9,5,7,5,9, 2,6,7,8,4, 0,3,3,0,3, 3,3,7,3,3
	N db 5
	I db 1
	REZ db ?
data ends
stack segment
	bos dw 200 dup(?)
	tos label word
stack ends
code segment 
	assume cs:code, ds:data, es:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov es,ax
	mov ax,stack
	mov ss, ax
	lea sp, tos

	xor bx,bx
	mov cl,N
	xor ch,ch
petlja:
	push cx
	xor si,si
	mov cl,N
	xor ch,ch
	mov di,cx
	dec di;N-1
	shr cx,1;upola manje prolazaka
unutrasnja:
	;slanje ulaznih parametara
	mov al, MAT[bx][si]
	xor ah,ah
	push ax
	mov al, MAT[bx][di]
	xor ah,ah
	push ax
	;poziv
	call uporedi
	;preuzimanje izlaznih parametara
	pop ax;ako je 0 jednaki su
	
	cmp ax, 0
	jne dalje
	inc si
	dec di
	loop unutrasnja
	cmp si,di
	jne dalje
	mov dl,I
	mov REZ, dl
	jmp kraj
	
	dalje:
	add bl,N
	adc bh,0
	inc I	
	pop cx
	loop petlja
	mov dl,0
	mov REZ, dl
	
	kraj:

	mov ah,4ch
	int 21h
code ends
end ut
