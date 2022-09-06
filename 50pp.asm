public nerastuci
procedura segment
nerastuci proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push bp
	mov bp,sp
	
	pushf
	push cx
	push si
	push dx
	push ax
	
	;preuzimanje ulaznih parametara
	mov cx, [bp+6]
	mov si, [bp+8]
	;dec cx
	mov dx, cx; da imam za posle da uporedim
	add dx, si
	dec dx
	
	;telo
	xor bx,bx;broj elemenata u podnizu
	mov ah, 0; indikator da je u podnizu
petlja:

	cmp ah, 0
	jne podniz
	mov al, ds:byte ptr[si+1]
	cmp ds:byte ptr[si], al
	jl dalje
	
	mov ah, 1; usli mo u podniz
	inc bx
	mov di,si
	
	dalje:
	inc si
	loop petlja
	
	podniz:
	cmp si,dx
	jae kraj
	mov al, ds:byte ptr[si+1]
	cmp ds:byte ptr[si], al
	jl kraj
	inc bx
	inc si
	jmp podniz
	
	kraj:
	inc bx; poslednji je takodje u podnizu
	

	;slanje izlaznih parametara
	;u di i u bx
	
	;obnova konteksta procesora
	pop ax
	pop dx
	pop si
	pop cx
	popf
	pop bp
	
	;povratak
	ret
nerastuci endp
procedura ends
end
