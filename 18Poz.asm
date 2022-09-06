public sumPozit
procedura segment 
sumPozit proc far
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
	mov dx,0 ;suma pozitivnih
	mov cx, [bp+6];N
	mov bx, [bp+12];adresa niza
	mov di,0; za proveru da li je nula
petlja:
	cmp [bx],di
	jl preskoci
	add ax,[bx]
	adc dx,0
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
	
sumPozit endp
procedura ends
end
