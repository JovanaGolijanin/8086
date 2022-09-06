name 39zad; 38 zad ustvari ali sam pogresila
extrn slovo:far
data segment
	RECENICA db 'Samo !','#'
	K db 3
	rez dw 0
data ends
stack segment
	bos dw 200 dup(?)
	tos label word
stack ends
code segment
	assume cs:code, ds: data, es:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov es, ax
	mov ax, stack
	mov ss, ax
	lea sp, tos

	xor si,si; za kretanje kroz recenicu
	xor dx,dx; za broj karaktera koji nisu slova
	
petlja:
	cmp RECENICA[si], '#'
	je kraj

	;slanje ulaznih parametara
	mov cl, byte ptr RECENICA[si]
	xor ch,ch
	push cx
	
	;poziv
	call slovo
	
	;preuzimanje izlaznih parametara
	;u bx
	
	cmp bx, 0
	jne veliko
	sub byte ptr RECENICA[si], 'a'-'A'
	jmp dole
	
	veliko:
	cmp bx, 0ffffh
	jne nije
	add byte ptr RECENICA[si], 'a'-'A'
	jmp dole
	
	nije:
	cmp bx, 2
	jne dole
	inc dx
	
	dole:
	inc si
	jmp petlja
	
	kraj:
	
	mov bl, K
	xor bh,bh
	cmp dx, bx
	jbe gotovo
	std
	
	gotovo:

	mov ah, 4ch
	int 21h
	
code ends
end ut
