public saberi
procedura segment
saberi proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push ax
	push bx
	push cx
	push dx
	
	;preuzimanje ulaznih parametara
	mov bx, [bp+8];adresa vrste
	mov cl, byte ptr[bp+6];N
	xor ch,ch; cx=N
	
	;telo
	xor ax,ax
	xor dx,dx
	
petlja:
	add ax,word ptr [bx]
	adc dx, 0
	
	add bx,2
	loop petlja
	
	
	;slanje izlaznih parametara
	mov word ptr [bp+8], ax
	mov word ptr [bp+6], dx
	
	
	;obnova konteksta procesora
	pop dx
	pop cx
	pop bx
	pop ax
	popf
	pop bp
	
	;povratak
	ret
	
saberi endp
procedura ends
end
