name zad1
podaci segment
	N dw 7
	KOL dw 0
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	mov si, 0
	mov di, 0
	mov cx, N
	sub cx, 2 ; n-2
	mov ax, N
	mov bx, N
	mov bp, N
	
petlja:
	mov bx, bp
	mov ax, bp
	mul bx ; ax=n*n
	add ax, bx ; ax = n*n+n
	adc dx, 0 ;dx:ax = n*n+n
	div cx ; dx:ax = (n*n+n)/n-2
	add si, ax
	adc di, 0
	dec cx
	dec bp
	cmp bp, 3
	jae petlja
	mov ax, si
	mov dx, di
	div N
	mov KOL, ax
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
