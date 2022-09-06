public kopiraj
procedura segment
kopiraj proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push cx
	push si
	push di
	push ax
	
	;preuzimanje ulaznih parametara
	mov cx,[bp+10];M
	mov si,[bp+6]
	mov di,[bp+8]
	
	;telo
petlja:
	mov al, byte ptr[si]
	mov es:byte ptr [di], al
	inc si
	inc di
	loop petlja
	
	
	;slanje izlaznih parametara
	
	;obnova konteksta procesora
	pop ax
	pop di
	pop si
	pop cx
	popf
	pop bp
	;povratak
	ret
kopiraj endp
procedura ends
end
