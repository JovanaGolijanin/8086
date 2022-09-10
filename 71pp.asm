public razlika
procedura segment
razlika proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push ax
	push dx
	push cx
	push bx
	push si
	
	;preuzimanje ulaznih parametara
	mov si,[bp+10];adresa niza
	mov cx,[bp+8];N
	mov bx,[bp+6];K
	
	;telo
	xor ax,ax
	mov cx, bx
	cmp cx,0
	jle dalje
petlja:
	add al, ds:byte ptr [si]
	adc ah,0
	inc si
	loop petlja
	
	mov cx,[bp+8];N
	sub cx,bx;N-K
	mov si,[bp+10];adresa niza
	add si, bx;dodaj k na adresu
	
	xor dx,dx
druga:
	add dl, ds:byte ptr[si]
	adc dh,0
	inc si
	loop druga
	
	sub ax, dx
	
	dalje:
	;slanje izlaznih parametara
	mov [bp+10], ax
	;obnova konteksta procesora
	pop si
	pop bx
	pop cx
	pop dx
	pop ax
	popf
	
	pop bp
	
	;povratak
	ret 4

razlika endp
procedura ends
end