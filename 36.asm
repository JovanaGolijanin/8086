name 36zad
data segment
	TEKST db 'Samo !',00h
data ends
code segment
	assume cs:code, ds: data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax

	xor si,si
	xor cx,cx
petlja:
	lodsb
	cmp al, 00h
	je kraj
	inc cx
	jmp petlja
	kraj:
	
	xor si,si
petljica: 
	cmp TEKST[si], 'a'
	jb dole
	cmp TEKST[si], 'z'
	ja dole
	sub TEKST[si], 'a'-'A'
	jmp ispod
	dole:
	cmp TEKST[si], 'A'
	jb ispod
	cmp TEKST[si], 'Z'
	ja ispod
	add TEKST[si], 'a'-'A'
	ispod:
	inc si
	loop petljica
	

	mov ah, 4ch
	int 21h
	
code ends
end ut
