public suma
procedura segment 
suma proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	push cx
	push ax
	push bx
	push si
	
	;preuzimanje ulaznih parametara
	mov cx, [bp+6];N
	mov ax, [bp+8];suma
	mov bx, [bp+10];niz
	
	;telo
	
	mov si,0;suma
petlja:
	add si,[bx]
	add bx,2
	
	loop petlja
	
	;slanje izlaznih parametara
	mov di,[bp+8]
	mov [di],si
	;obnova konteksta procesora
	pop si
	pop bx
	pop ax
	pop cx
	pop bp
	
	;
	ret

	
suma endp
procedura ends
end
