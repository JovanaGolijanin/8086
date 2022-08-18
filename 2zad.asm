name zad1
podaci segment
	N db 2
	M db 3
	REZ dw ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	mov bl, N
	mov dl, M
	mov ax, 0
	mov al, bl
	mul bl ; ax = n*n
	mov bx, ax ; bx = n*n
	mov ax, 0
	mov al, dl
	mul dl ; ax = m*m
	sub ax, bx
	inc ax
	mov cx, ax ; br prolazaka u cx
	mov si, 0
	mov bp,0
petlja:
	add si, bx
	adc bp, 0
	inc bx
	loop petlja
	;bp:si = sum1
	
	mov cx, 0
	mov cl, M
	sub cl, N
	inc cl
	adc ch,0
	mov ax, 0
	mov al, N
	mov di, 0
petlja2:
	add di, ax
	inc ax
	loop petlja2
	;di = sum2
	
	mov bx, 0
	mov bl, N
	mov ax, 0
	mov al, bl
	mul bl ; ax = n*n
	mov bx, ax ; bx = n*n
	mov ax, si
	mov dx, bp
	div di ; dx:ax 
	div bl
	mov REZ, ax
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
