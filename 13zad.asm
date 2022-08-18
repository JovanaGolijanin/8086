name 13zad
podaci segment
	N db 
	REZ dd ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax

	xor cx,cx
	mov cl,N
	dec cx; n-1 prolazaka 
	
	mov bx,1;korak faktorijela
	mov si,1;stepen
	
petlja:
	mov ax, si
	shl si,1;stepen

	;faktorijel
	mov ax, bx ;k
	mov bp, bx
	inc bp ;k+1
	mul bp; dx:ax= k*k+1
	
	xor dx,dx
	div si; ax=sabirak
	
	add word ptr REZ, ax
	adc word ptr REZ+2, 0
	
	loop petlja
	
	;dodajemo onu jedinicu sa pocetka
	inc word ptr REZ
	adc word ptr REZ+2, 0

	mov ah, 4ch
	int 21h
	
program ends
end ut
