name 5zad
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
	
	xor si,si
	xor di,di ;suma di:si
	
	xor cx,cx
	mov cl,N
	dec cx ; cx=N-1
	xor bx,bx
	mov bl, N ;bx=N
	
petlja:
	mov al, bl
	inc al; al=N+1
	mov ah, bl
	dec ah; ah=N-1
	mul ah ;ax=(N-1)*(N+1)
	
	add si, ax
	adc di,0
	add di,dx
	
	dec bx
	loop petlja
	
	mov al, N
	mov ah, N
	mul ah ; ax= N*N
	mov bx, ax
	mov ax, si
	mov dx, di
	div bx
	mov REZ, ax
	mov OST, dx
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
