public neopada
procedura segment 
neopada proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push dx
	pushf
	
	;preuzimanje ulaznih parametara

	
	;telo
	mov dl, byte ptr[di]
	cmp byte ptr[si],dl
	ja nije
	mov al, byte ptr[si]
	inc si
	nije:
	mov al, byte ptr[di]
	inc di

	
	;slanje izlaznih parametara

	;obnova konteksta procesora
	popf
	pop dx
	
	;
	ret

	
neopada endp
procedura ends
end
