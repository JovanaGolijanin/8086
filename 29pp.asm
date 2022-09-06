public prevedi 
procedura segment
prevedi proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	pushf
	push di
	push bx
	push dx
	;preuzimanje ulaznih parametara
	;(si, cx)
	
	;telo
	xor di,di; suma 
	xor ax,ax; za mnozenje
petlja:
	mov dx, 10; za mnozenje
	
	mov bl, byte ptr [si];ASCII cifra
	sub bl,'0'; dekadna cifra
	xor bh,bh
	
	;mora da je pomnozimo sa 10
	mov ax, di; suma
	mul dx; dx:ax=ax*10
	mov di, ax;16b
	
	add di, bx
	inc si
	
	loop petlja
	
	;slanje izlaznih parametara
	mov ax,di
	
	;obnova konteksta procesora
	pop dx
	pop bx
	pop di
	popf
	
	;povratak
	ret
	
	
prevedi endp
procedura ends
end
