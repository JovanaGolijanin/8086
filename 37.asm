name 37zad
data segment
	TXT db 'AnAm',00h
	VTXT db 20 dup(?)
	MTXT db 20 dup(?)
data ends
code segment
	assume cs:code, ds: data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax

	lea si, TXT
	xor cx,cx
petlja:
	lodsb
	cmp al, 00h
	je kraj
	inc cx
	jmp petlja
	kraj:
	mov bx, cx; cuvam za drugo kopiranje

	lea di, VTXT
	cld
	rep movsb
		
	mov cx, bx
	xor si,si
petljica: 
	cmp VTXT[si], 'a'
	jb dole
	cmp VTXT[si], 'z'
	ja dole
	sub VTXT[si], 'a'-'A'
	dole:
	inc si
	loop petljica
	
	
	mov cx,bx
	lea si, TXT
	lea di, MTXT
	cld
	rep movsb
	
	mov cx, bx
	xor si,si
druga:
	cmp MTXT[si], 'A'
	jb ispod
	cmp MTXT[si], 'Z'
	ja ispod
	add MTXT[si], 'a'-'A'
	ispod:
	inc si
	loop druga
	
	

	mov ah, 4ch
	int 21h
	
code ends
end ut
