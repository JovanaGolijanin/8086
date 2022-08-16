extrn n:word
extrn niz:word
extrn brpon:word
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
	push bx
	;2 preuzimanje ulaznih parametara
	mov si, [bp+6]
	mov cx, [bp+8]
	mov bl, 05bh
	;3 telo procedure
	mov ax, 0
	petlja:
		cmp [si], bl
		je povecaj
		jmp dole
		povecaj:
		inc ax
		dole:
		add si,2
	loop petlja
	;4 slanje izlazinih parametara
	
	;5 obnova konteksta procesora
	pop bx
	pop si
	pop cx
	popf
	pop bp
	;6 povratak na mesto poziva
	ret 

fja endp
procedura ends
end
