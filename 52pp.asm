public parnost 
procedura segment
parnost proc far
	assume cs:procedura
	
	;ocuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push bx
	push cx
	
	;preuzimanje ulaznih parametara
	mov bx, [bp+6]; tu je karakter
	mov dl, byte ptr[bx]
	;xor dh,dh

	;telo
	mov cx,8
	xor ax,ax
petlja:
	rcr dl,1
	jnc dalje
	inc ah
	
	dalje:
	loop petlja
	
	;slanje izlaznih parametara
	;u ah
	
	;obnova konteksta procesora
	pop cx
	pop bx
	
	popf
	pop bp
	
	;povratak
	ret
	
parnost endp	
procedura ends
end