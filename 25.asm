name 25zad
data segment
	NIZ db 27h,43h,1fh
	BR dd 0
	N dw 0
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	;maska za 1111 na drugoj poziciji u bajtu
	mov dl, 0fh
	;maska za 1111 na prvoj poziciji u bajtu
	mov bl, 0f0h
	xor cx,cx
petlja:
	mov al, byte ptr NIZ[si]
	and al, dl; postavljamo bitove 
	cmp al, dl; proveravamo da li su jedinice na kraju ostale
	je kraj
	mov al, byte ptr NIZ[si]
	and al, bl; postavljamo bitove 
	cmp al, bl; proveravamo da li su jedinice na kraju ostale
	je kraj2
	inc cx
	inc si
	jmp petlja
	
	kraj:
	inc cx
	mov ax,2
	mul cx
	mov cx,ax
	dec cx; broj BCD cifara
	
	jmp gotovo
	
	kraj2:
	mov ax,2
	mul cx
	mov cx,ax ; broj BCD cifara
	
	gotovo:
	mov N,cx; konacan broj BCD cifara, menjam cx a N mi treba nepromenjeno
	
	mov di,1 ;za racunanje umnoska
	xor si,si ;kretanje kroz niz
	xor bh,bh;za mnozenje
petljica:	
	;prvo prva cifra u bajtu
	;maska f0
	mov bl, byte ptr NIZ[si]
	and bl,0f0h
	;moramo da je pomerimo za 4 mesta udesno
	mov bp,4
	pom:
		shr bl, 1
		dec bp
		cmp bp,0
		jne pom
	;cime mnozimo
	mov ax, 10
	mov bp, 10
	sub cx,di; stepen
	dec cx
	cmp cx,0
	je jednom1
	jng nista1
	stepen:
	mul bp; dx:ax je umnozak
	loop stepen
	jednom1:
	mul bx; dx,ax je spreman za sabiranje
	add word ptr BR, ax
	adc word ptr BR+1,dx;suma
	
	inc di
	
	jmp preskoci1
	
	nista1:
	add word ptr BR, bx
	adc word ptr BR+1,dx;suma
	
	preskoci1:
	
	mov cx,N
	cmp di,cx
	je finish
	
	
	;druga cifra
	;maska 0fh
	
	mov cx,N;oporavljam cx
	
	mov bl, byte ptr NIZ[si]
	and bl,0fh
	;cime mnozimo
	mov ax, 10
	mov bp, 10
	sub cx,di; stepen
	dec cx
	cmp cx,0
	je jednom
	jng nista
	stepen2:
	mul bp; dx:ax je umnozak
	loop stepen2
	jednom:
	mul bx; dx,ax je spreman za sabiranje
	add word ptr BR, ax
	adc word ptr BR+1,dx;suma
	
	jmp preskoci
	
	nista:
	add word ptr BR, bx
	adc word ptr BR+1,dx;suma
	
	preskoci:
	inc di; za umnozak
	inc si; sledeci bajt
	
	mov cx,N
	cmp di,cx
	jbe petljica
	
	finish:
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
