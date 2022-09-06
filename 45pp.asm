procedura segment
XCHGSW proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push si
	push di
	push ax
	;preuzimane ulaznih parametara
	mov si,[bp+8]
	mov di,[bp+6]

	;telo
	mov ax, word ptr[si];lodsw
	mov dx,ax
	mov ax, word ptr[di];lodsw
	mov word ptr[si], ax;stosw
	mov ax,dx
	mov word ptr[di], ax;stosw
	
	;slanje izlaznih parametara
	
	;obnova konteksta parametara
	pop ax
	pop di
	pop si
	popf
	
	pop bp
	;povratak
	ret
XCHGSW endp	
procedura ends
end
