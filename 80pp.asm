public transponovana
procedura segment
transponovana proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push ax
	push bx
	push dx
	push cx
	push si
	push di
	
	;preuzimanje ulaznih parametara
	mov cx, [bp+6];N
	mov si, [bp+10];MAT1T
	mov ax, [bp+10];MAT1 ---- BP je to
	mov dx,bp;sacuvaj bp za kasnije
	mov bp,ax
	
	;telo
	
	
petlja:
	push cx
	
	xor di,di
	xor bx,bx
	
	push bx
	mov bx,bp; sacuvaj prethodni
	
	mov bp,dx; obnovi bp
	mov cx,[bp+6]
	
	mov bp,bx; vrati prethodni
	pop bx
	unutrasnja:
	
	mov ax,word ptr [bp][di]
	mov word ptr [bx][si], ax
	
	mov ax,word ptr [bp][di]+2
	mov word ptr [bx][si]+2, ax
	
	
	add di,4
	
	push bx
	mov bx,bp; sacuvaj prethodni
	
	mov bp,dx; obnovi bp
	push cx
	mov cx,[bp+6]
	shl cx,1
	shl cx,1;4N
	
	mov bp,bx; vrati prethodni
	pop bx
	
	add bx,cx
	pop cx
	
	loop unutrasnja
	
	add si,4
	
	push bx
	mov bx,bp; sacuvaj prethodni
	
	mov bp,dx; obnovi bp
	push cx
	mov cx,[bp+6]
	shl cx,1;2N
	
	mov bp,bx; vrati prethodni
	pop bx
	
	add bp,cx
	pop cx
	
	
	
	pop cx
	loop petlja

	;slanje izlaznih parametara
	
	
	;obnova konteksta procesora
	
	mov bp,dx; obnovi bp
	
	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	popf
	pop bp
	
	;povratak
	ret 6
transponovana endp
procedura ends
end
