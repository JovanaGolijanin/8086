name 6zad
podaci segment
	N db 10
	pom dw 0
	pom1 dw 0
	pom3 dw 0
	pom4 dw 0
	REZ dw ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	xor si,si
	xor di,di; suma di:si
	xor cx,cx
	mov cl, N
	shr cl,1 ;N/2
	dec cx; cx=(N/2)-1
	xor bx,bx
	mov bl,N ;korak
	
petlja:
	mov bp, bx
	add bp,2 ; bp=N+2
	mov ax, bx ;
	sub ax,2 ; ax=N-2
	mul bx ; dx:ax = (N-2)*N
	mul bp ; dx:ax = (N-2)*N*(N+2)
	mov pom1, ax
	
	mov bp, bx
	sub bp, 3 ; bp= N-3
	mov pom3, bx
	inc pom3 ; pom3= N+1
	mov ax, bx
	dec ax ; ax= N-1
	mul pom3
	mul bp ;dx:ax = (N-3)*(N-1)*(N+1)
	mov pom4, ax
	
	xor dx,dx
	mov ax, pom1
	div pom4
	add si, ax
	adc di, 0
	
	sub bx,2
	loop petlja
	
	mov REZ, si
	
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
