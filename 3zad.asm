name zad1
podaci segment
	N db 5
	REZ dw ?
	OST dw ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	xor di, di
	xor si, si ;suma di:si
	mov cl,N
	xor ch,ch
	dec cx ; cx=N-1
	
	mov bl,N
	xor bh,bh ;bl=N
petlja:

	mov dl, bl; dl=N ->5
	dec bl ;bl=N-1 ->4
	mov al,dl; al=N ->4
	mul bl ; ax=N*(N-1) ->5*4=20
	add si,ax ; 20
	adc di,0
	
	loop petlja
	
	mov al,N
	mul al ; ax=N*N
	mov bx,ax ;bx=N*N
	mov ax,si
	mov dx,di
	div bx
	mov REZ, ax
	mov OST, dx
	
	
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
