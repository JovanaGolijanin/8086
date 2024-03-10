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
	push di
	;
	mov cx, [bp+6];N=4
	mov si, [bp+8]; adr BR1
	
	;telo
	xor bx,bx;suma=0
	mov di, 10; za mnozenje
petlja:
	cmp byte ptr [si], '0'
	jb nijebroj
	cmp byte ptr [si], '9'
	ja nijebroj
	sub byte ptr [si], '0';sada je decimalna cifra
	
	mov ax, bx;suma
	mul di;dx:ax je suma*10;u ax staje
	mov bx,ax;bx = suma*10
	
	mov al, byte ptr [si]
	xor ah,ah
	
	add bx,ax; s+=cifra

	inc si;sl cifra
	
	loop petlja
	
	mov ax,0;regularno izaso iz petlje
	
	jmp preskoci
	nijebroj:
	mov ax,1
	preskoci:
	;
	mov si, [bp+10];adresa rezultata
	mov word ptr [si], bx
	
	;
	pop di
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
