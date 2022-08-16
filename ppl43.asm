extrn n:word
extrn m:word
extrn niz:byte
extrn mat:byte
extrn sum:word
public fja 
procedura segment
fja proc FAR
	assume cs:procedura
	;1 cuvanje konteksta procesora
	push bp
	mov bp, sp
	
	pushf
	push ax
	push bx
	push cx
	push dx
	push si
	push di
	
	
	;2 preuzimanje ulaznih parametara
	
	;n
	mov cx, [bp+14]
	;m
	mov dx, [bp+12]

	;3 telo procedure
	mov di,0
	mov bx, 0
	mov ax,0
	spolj:
	mov si, 0
	
	unut:
	mov al, niz[si]
	mul mat[bx][si]
	add sum[di], ax
	
	add si, 1
	cmp si, dx
	jb unut
	add bx, dx
	inc di
	loop spolj
	
	
	;4 slanje izlazinih parametara
	
	;5 obnova konteksta procesora
	
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	popf
	pop bp
	;6 povratak na mesto poziva
	ret 6

fja endp
procedura ends
end
