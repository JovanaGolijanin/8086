name zad1
podaci segment
	N db 10
	pom dw 0
	pom2 dw 0
	REZ db ?
	OST db ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	xor si,si
	xor ax,ax
	xor dx,dx
	
	mov bx, 2
	mov cx,4
	mov bp, 1
	mov di,3

petlja:
	mov ax, bx
	mul cx ;ax=(N-2)*N
	mov pom, ax ;pom=(N-2)*N
	
	mov ax,bp
	mul di ;ax=(N-3)*(N-1)
	mov pom2, ax
	
	mov ax, pom
	div pom2 ;dx:ax = ((N-2)*N) / ((N-3)*(N-1))
	
	add si,ax
	
	add bx,2
	add bp,2
	add di,2
	add cx,2
	
	cmp cl,n
	jle petlja
	
	mov ax, si
	div N
	mov REZ, al
	mov OST, ah
	
	mov ah, 4ch
	int 21h
	
program ends
end ut

	