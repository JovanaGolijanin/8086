extrn razlika:far
name 71zad
data segment
	MAT db 1,4,4,4,4,2,1,3,3,3,3,3,1,2,2,4,4,4,1,3,5,5,5,5,1
	N db 5
	BR db ?
data ends
stack segment
	bos dw 100 dup(?)
	tos label word
stack ends
code segment
	assume cs:code, ds:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss,ax
	lea sp, tos
	
	mov cl, N
	xor ch,ch
	xor bx,bx; kroz vrste
	xor si,si; samo za adresu pocetka vrste
	xor di, di; to je ustvari K
petlja:
	;slanje ulaznih parametara
	lea ax,MAT[bx][si]
	push ax
	mov al,N
	xor ah,ah
	push ax
	push di;K
	;poziv
	call razlika
	;preuzimanje izlaznih parametara
	pop ax; u ax je razlika
	
	cmp ax, 0
	jle dalje
	inc BR
	dalje:
	inc di
	add bl, N
	adc bh,0
	
	loop petlja

	
	mov ah, 4ch
	int 21h
	
code ends
end ut