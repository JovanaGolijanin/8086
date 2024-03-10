public konvertuj
procedura segment
konvertuj proc far
	assume cs:procedura
	
	push bp
	mov bp,sp
	
	pushf
	push bx
	push cx
	push dx
	push si
	
	;
	mov cx, [bp+6];N=4
	mov si, [bp+8]; adr BR1
	
	;telo
	xor bx,bx
	xor dx,dx;suma
	xor ax,ax
	mov al, 10; za mnozenje
petlja:
	cmp byte ptr [si], '0'
	jb nijebroj
	cmp byte ptr [si], '9'
	ja nijebroj
	sub byte ptr [si], '0';sada je decimalna cifra
	mov al, 10; za mnozenje
	mov ah, byte ptr [si]
	mul ah; u ax je cifra*10
	add bx, ax
	adc dx,0
	inc si;sl cifra
	
	loop petlja
	
	nijebroj:
	mov ax,1
	
	;
	mov si, [bp+10];adresa rezultata
	mov word ptr [si], bx
	mov word ptr [si]+2, dx;rez1
	
	;
	pop si
	pop dx
	pop cx
	pop bx
	popf
	pop bp
	
	;
	ret 4
	
konvertuj endp
procedura ends
end
