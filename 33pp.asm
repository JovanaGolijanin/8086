public nadji
procedura segment
nadji proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push di
	push si
	push ax
	push bx
	push cx
	;push dx
	
	;preuzimanje ulaznih parametara
	mov si, [bp+10];adresa niza
	mov cx, [bp+8]
	mov bx, [bp+6];karakter je u bl svakako
	xor bh,bh
	mov ax,cx
	
	;telo
	mov dl, 0;max broj ponavljanja
	xor dh,dh; broj ponavljanja
petlja:
	cmp byte ptr ds:[si], bl
	jne sledecirazlicit
	mov di,si
	petljica:
	cmp di,ax
	je kraj
	mov bh, byte ptr ds:[di]
	cmp byte ptr ds:[si], bh
	jne sledecirazlicit
	inc dh
	kraj:
	cmp dh,dl
	jna sledeci
	mov dl,dh
	jmp sledeci
	sledecirazlicit:
	xor dh,dh
	sledeci:
	inc si
	loop petlja
	
	;slanje izlaznih parametara
	xor dh,dh
	
	
	;obnova konteksta procesora
	;pop dx
	pop cx
	pop bx
	pop ax
	pop si
	pop di
	popf 
	pop bp
	
	
	ret 

nadji endp
procedura ends
end
