extrn nerastuci:far
name 50zad
data segment
	NIZ db 1,2,3,2,2,1,2,3,5,4,4,3,2
	N db 13
	ADRP dw 0
	D dw 0
	ind dw 0
	max dw 0
	brelemenata dw 0
data ends
stack segment 
	bos dw 200 dup(?)
	tos label word
stack ends 
code segment
	assume cs:code, ds:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss, ax
	
	xor si,si;trenutni indeks podniza
	mov cl, N
	xor ch,ch
	
petlja:
	
	;slanje ulaznih parametara
	lea ax, NIZ[si]
	push ax
	mov ax, cx
	push ax
	;poziv
	call nerastuci
	;preuzimanje ulaznih parametara
	; u di i bx su; 2, 6 ocekujem
	
	cmp di,ind
	jbe nije
	mov ind, di
	nije:
	cmp bx, max
	jbe nije2
	mov max, bx
	nije2:
	mov si,di
	add si,bx
	mov al, N
	xor ah,ah
	cmp si,ax
	je kraj
	mov cl, N
	xor ch,ch
	sub cx, si
	
	jmp petlja
	
	kraj:
	
	lea ax, NIZ[di]
	mov ADRP, ax
	mov ax, bx
	mov D,ax
		
	mov ah, 4ch
	int 21h
	
code ends
end ut
