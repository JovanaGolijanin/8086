public proizvod
procedura segment
proizvod proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push ax
	push dx
	push cx
	push si
	push di
	
	;preuzimanje ulaznih parametara
	mov cx, [bp+8];N
	mov si, [bp+6];MAT1
	mov di, [bp+10];MAT2
	
	;telo
	xor ax,ax;proizvod
	xor dx,dx; suma
petlja:
	mov al, byte ptr[si]
	mov ah, byte ptr[di]
	mul ah; u ax je proizvod
	add dx, ax;suma
	
	inc si
	inc di
	loop petlja
	
	;slanje izlaznih parametara
	mov si, [bp+12]
	mov word ptr [si], dx
	
	;obnova konteksta procesora
	pop di
	pop si
	pop cx
	pop dx
	pop ax
	popf
	pop bp
	
	;povrtak
	ret 6
proizvod endp
procedura ends
end
