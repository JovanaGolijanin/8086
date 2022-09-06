public rotacija
procedura segment
rotacija proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push cx
	push si
	push dx
	push ax
	
	;preuzimanje ulaznih parametara
	mov cx, [bp+6];br elemenata
	mov si, [bp+8];adresa pocetka niza
	
	;telo
	mov dx, cx
	add dx,si
	dec dx; krajnji indeks
	xor al,al
	clc
petlja:
	rcr byte ptr[si], 1
	inc si
	
	loop petlja
	
	adc al,0
	mov cl,7
	shl al,cl
	
	mov si, [bp+8]
	or byte ptr [si], al
	
	;slanje izlaznih parametara
	
	;obnova konteksta procesora
	pop ax
	pop dx
	pop si
	pop cx
	popf
	pop bp
	
	;povratak
	ret
	

rotacija endp
procedura ends
end
