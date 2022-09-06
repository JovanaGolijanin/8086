public nzd
procedura segment
nzd proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	pushf
	
	;preuzimanje ulaznih parametara
	
	;telo
petlja:
	cmp ax,bx
	je kraj
	cmp ax,bx
	ja a
	b:
	sub bx, ax
	jmp preskoci
	a:
	sub ax, bx
	preskoci:
	jmp petlja
	kraj:
	
	;slanje izlaznih parametara
	
	;obnova konteksta procesora
	popf
	
	;povratak
	ret
	

nzd endp
procedura ends
end
