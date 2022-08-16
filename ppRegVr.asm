extrn n:word
extrn niz:word
extrn suma:word
public fja 
procedura segment
fja proc FAR
	assume cs:procedura
	;1 cuvanje konteksta procesora
	pushf
	push cx
	push si
	;2 preuzimanje ulaznih parametara
	;3 telo procedure
	mov ax, 0
	petlja:
		add ax, [si]
		add si,2
	loop petlja
	;4 slanje izlazinih parametara
	;5 obnova konteksta procesora
	pop si
	pop cx
	popf
	;6 povratak na mesto poziva
	ret

fja endp
procedura ends
end
