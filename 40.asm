name 40zad
data segment
	TEXT db '1111 22222 3333', 00h
	pom db 6 dup(?)
data ends
code segment
	assume cs:code, ds: data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax

	xor si,si
	xor bl,bl; broj slova u 1. reci
petljica:
	cmp TEXT[si], ' '
	je dole
	inc bl
	inc si
	jmp petljica
	
	dole:
	xor bh,bh
	inc bl
	mov si,bx; od 2. reci se krecemo
	dec bl;broj slova 
	xor di,di; kroz pomocni niz za tekucu rec
	xor dl, dl;broj slova u tekcoj reci
petlja:
	cmp TEXT[si], 00h
	je gotovo
	cmp TEXT[si], ' '
	je gotovo
	inc dl
	mov al, TEXT[si];kopiraj tekucu rec
	mov pom[di], al
	inc di
	inc si
	jmp petlja
	
	gotovo:
	cmp dl, bl
	jne uvecaj
	
	mov bp,si
	xor si,si; moram da ga sacuvam
	mov cx,bx
kopiraj:
	mov ah, pom[si]
	mov TEXT[si], ah
	inc si
	loop kopiraj
	jmp kraj
	
	uvecaj:
	cmp TEXT[si], 00h
	je kraj
	inc si
	xor dl,dl
	xor di,di

	jmp petlja
	kraj:
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
