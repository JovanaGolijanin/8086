public uporedi
procedura segment
uporedi proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	pushf
	push si
	push di
	push ax
	
	;preuzimanje ulaznih parametara
	mov si,[bp+8]
	mov di,[bp+6]
	
	;telo
	cmp si,di
	je isti
	jne razliciti
	isti:
	mov ax,0
	jmp preskoci
	razliciti:
	mov ax,1
	preskoci:
	
	;slanje izlaznih parametara
	mov [bp+8],ax
	;obnova konteksta procesora
	pop ax
	pop di
	pop si
	popf
	pop bp
	;povratak
	ret 2
uporedi endp
procedura ends
end

