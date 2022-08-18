name 8zad
podaci segment
	N db 9
	REZ dw ?
	OST dw ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	xor si, si; nizi deo sume
	xor di, di; visi deo sume
	
	mov cx,3 ;brojac petlje
	mov bx,1 ;da li + ili -

petlja:
	mov ax,cx
	dec ax
	mov bp, ax; bp=N-1
	dec ax ; ax=N-2
	mul cx ; dx:ax=(N-2)*N
	sub ax, bp ;ax=(N-2)*N-(N-1)
	
	test bx, 0001h; da li je paran
	jz saberi ;ako je zf=1 onda je paran
	jnz oduzmi ; ako je zf=0 onda je neparan
	
	saberi:
	add si, ax
	adc di,0
	jmp dole
	
	oduzmi:
	sub si,ax
	sbb di,0
	
	dole:
	inc bx
	add cx,3
	cmp cl,N
	jle petlja
	
	mov al,N
	mov ah,N
	mul ah ; ax= N*N
	mov bx, ax
	
	mov ax, si
	mov dx,di
	idiv bx
	
	mov REZ, ax
	mov OST, dx
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
