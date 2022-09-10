public zbir
procedura segment
zbir proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push ax
	push dx
	push cx
	push si
	
	;preuzimanje ulaznih parametara
	mov si,[bp+8];adresa niza
	mov cx,[bp+6];N
	
	;telo
	xor ax,ax
petlja:
	cmp word ptr [si], 0
	jl dalje
	add ax, word ptr [si]
	adc dx, 0
	dalje:
	add si,2
	loop petlja
	
	;slanje izlaznih parametara
	mov [bp+8], ax
	mov [bp+6], dx
	;obnova konteksta procesora
	pop si
	pop cx
	pop dx
	pop ax
	popf
	
	pop bp
	
	;povratak
	ret

zbir endp
procedura ends
end