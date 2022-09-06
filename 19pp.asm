public min_max
procedura segment 
min_max proc far
	assume cs:procedura
	
	;cuvanje konteksta porcesora
	push bp
	mov bp,sp
	
	push si
	push bx
	push cx
	push dx
	
	;preuzimanje ulaznih parametara
	mov si, [bp+14];adresa niza
	mov bx, [bp+10];max
	mov cx, [bp+12];min
	mov dl,0
	
	;telo procedure
	;min
petlja:
	cmp [si], dl
	jz kraj1
	cmp [si], cl
	ja nije_manji
	mov cl,[si]
	nije_manji:
	add si,1
	jmp petlja
	kraj1:
	
	;max
	mov si, [bp+14];adresa niza
petlja2:
	cmp [si], dl
	jz kraj2
	cmp [si], bl
	jl nije_veci
	mov bl,[si]
	nije_veci:
	add si,1
	jmp petlja2
	kraj2:
	
	;slanje izlaznih parametara
	mov si,[bp+8];min
	mov [si],cl
	mov si,[bp+6];max
	mov [si],bl
	
	;obnova konteksta porcesora
	pop dx
	pop cx
	pop bx
	pop si
	pop bp
	;povratak
	ret
	
min_max endp
procedura ends
end
