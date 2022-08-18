name 10zad
podaci segment
	N dw 5
	pom dw 0
	REZ dw ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax

	xor si,si; suma
	xor di,di; za deljenje
	
	mov cx,N
	dec cx; br prolazaka
	mov bx, 2;korak
	mov pom, 2
	mov bp,1
	
petlja:
	mov ax, bx
	mul bp ;dx:ax=n*(n-1)!
	mov bp, ax;faktorijel u bp
	shl pom,1;stepen
	mov di, bp
	sub di, pom;razlika
	mov ax,di
	cwd
	idiv bx ;deljenje
	
	add si, ax
	
	inc bx
	loop petlja
	
	mov REZ, si

	mov ah, 4ch
	int 21h
	
program ends
end ut
