public sekvenca 
procedura segment
sekvenca proc far
	assume cs:procedura
	;ocuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
	
	;preuzimanje ulaznih parametara
	mov ax, [bp+10];nizi
	mov bx, [bp+8];visi
	
	;telo
	xor cx,cx;brojac petlje
	xor dl,dl;rezultat
petlja:
	cmp cx,32
	je kraj
	
	shl ax,1
	adc si, 0
	
	shl bx,1;visi
	jnc dalje
	
	shl ax,1
	adc si, 0
	shl si,1
	
	shl bx,1
	jc dalje
	
	shl ax,1
	adc si, 0
	shl si,1
	
	shl bx,1
	jnc dalje2
	inc dl
	
	jmp dalje2
	dalje:
	add bx,si
	xor si,si
	inc cx
	jmp petlja
	
	dalje2:
	add bx,si
	xor si,si
	jmp petlja
	
	
	kraj:
	
	
	;slanje izlaznih parametara
	;u dx
	mov si,[bp+6]
	xor dh,dh
	mov [si],dx
	
	;obnova konteksta procesora
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	
	popf
	pop bp
	
	;povratak
	ret
	
sekvenca endp	
procedura ends
end