public rotacija
procedura segment
rotacija proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	
	;preuzimanje ulaznih parametara
	mov cx, [bp+];k
	mov si, [bp+];adresa pocetka
	mov bx [bp+];velicina u bajtovima
	mov dx, [bp+];smer, 1 desno, 0 levo
	
	;telo
	mov di, si
	add di,bx; kraj
	
	
petlja:
	mov al, byte ptr[si]
	cmp dx,1
	je desno
	
	levo:
	rcl al,1
	jmp dalje
	
	desno:
	rcr al,1
	
	dalje:
	mov byte ptr[si], al;vracam nazad
	inc si
	
	cmp di,si
	ja kraj
	
	loop petlja
	kraj:
	
	;slanje izlaznih parametara
	
	;obnova konteksta procesora
	
	popf
	pop bp
	
	;povratak
	ret
	

rotacija endp
procedura ends
end
