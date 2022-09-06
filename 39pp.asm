public slovo
procedura segment
slovo proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp, sp
	
	pushf
	
	;preuzimanje ulaznih parametara
	mov ax, [bp+6]
	xor ah,ah
	mov ah,al
	
	;telo
	cmp ah, 'A'
	jb ispod
	cmp ah, 'Z'
	ja ispod
	mov bx,0ffffh
	jmp kraj
	ispod:

	cmp ah, 'a'
	jb dole
	cmp ah, 'z'
	ja dole
	mov bx, 0
	jmp kraj

	dole:
	mov bx,2
	
	kraj:
	
	;slanje izlaznih parametara
	;u ax je rezultat
	
	;obnova konteksta procesora
	popf
	pop bp

	;povratak
	ret
	
slovo endp
procedura ends
end
