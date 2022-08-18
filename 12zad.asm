name 12zad
podaci segment
	N db 2
	pom2 dw 0
	delj dw 0
	REZ dd ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax

	xor si,si
	xor di,di; suma
	
	mov bl, N
	xor bh,bh; korak
	
petlja:

	mov al,bl
	mov ah, bl
	inc ah
	mul ah ; ax=n*(n+1)
	mov delj, ax

	xor cx,cx
	mov cl,bl ; fakt
	shl cx,1; 2n
	
	mov bp, 1; faktorijel
	;2n
	mov pom2,bx; korak
	shl pom2,1; 2*korak
	mov ax, pom2;2n
	fakt:
	mul bp; dx:ax = 2n*1
	cwd
	dec pom2
	mov bp, pom2;2n
	
	loop fakt
	
	xor dx,dx
	div delj
	
	add si, ax
	adc di,0
	
	dec bx
	cmp bx,0
	ja petlja
	

	mov ah, 4ch
	int 21h
	
program ends
end ut
