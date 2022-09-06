public sumParnih
procedura segment 
sumParnih proc far
	assume cs:procedura
	
	;cuvanje konteksta procora
	push bp
	mov bp,sp
	
	push ax
	push dx
	push cx
	push bx
	push di
	push si
	;preuzimanje ulaznih parametara
	
	;telo
	mov ax,0
	mov dx,0 ;suma parnih
	mov cx, [bp+6];N
	mov bx, [bp+12];adresa niza
	mov di,0001; maska, da li neparan
petlja:
	test [bx],di
	jnz preskoci;ako je naparan preskoci
	add ax,[bx]
	adc dx,0; smesta 2 u dx
	preskoci:
	add bx,2
	loop petlja
	
	;slanje izlaznih parametara
	mov si, [bp+10]
	mov [si],ax
	mov si, [bp+8]
	mov [si],dx
	
	;obnova konteksta procesora
	pop si
	pop di
	pop bx
	pop cx
	pop dx
	pop ax
	pop bp
	
	ret
	
sumParnih endp
procedura ends
end
