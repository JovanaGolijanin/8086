name 11zad
podaci segment
	N db 5
	pom dw 0
	pom2 dw 0
	REZ dd ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax

	xor si,si
	xor di,di
	
	xor cx,cx
	mov cl,N; br prolazaka
	dec cl
	
	mov bx, 2; korak
	mov bp, 1; faktorijel
	mov pom, 1; stepen
	mov pom2, 0
	
	
petlja:
	mov ax,bp; faktorijel n-1
	mov dx, pom2
	mul bx;dx:ax n*(n-1)!
	mov bp, ax
	mov pom2, dx
	shl pom,1
	div pom; ax= rezultat, dx ostatak
	
	add si, ax
	adc di,0
	
	inc bx
	
	loop petlja
	
	;za prvi korak
	add si,1
	adc di,0
	
	mov word ptr REZ, si
	mov word ptr REZ+2, di
	
	
	

	mov ah, 4ch
	int 21h
	
program ends
end ut
