extrn n:word
extrn niz:word
extrn suma:word
public fja 
procedura segment
fja proc FAR
	assume cs:procedura
	;1 cuvanje konteksta procesora
	push bp
	mov bp, sp
	pushf
	push cx
	push si
	push ax
	;2 preuzimanje ulaznih parametara
	mov si, [bp+6]
	mov cx, [bp+8]
	;3 telo procedure
	mov ax, 0
	petlja:
		add ax, [si]
		add si,2
	loop petlja
	;4 slanje izlazinih parametara
	mov si, [bp+10]
	mov [si], ax
	;5 obnova konteksta procesora
	pop ax
	pop si
	pop cx
	popf
	pop bp
	;6 povratak na mesto poziva
	ret 6

fja endp
procedura ends
end
