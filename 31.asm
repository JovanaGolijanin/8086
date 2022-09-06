name 31zad
data segment
	NIZ db '1','2','3','4','5','6','7','#';
	M db 3
	P dw 8
	BROJ db 0 ;4
data ends

code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	xor si,si;kretanje kroz niz
	xor dx,dx
br:
	cmp NIZ[si], '#'
	je gotovo
	inc dl
	inc si
	jmp br

gotovo:
	sub dl,M
	inc dl
	xor si,si;kretanje kroz niz
petlja:
	cmp dl,0
	je kraj
	xor ax,ax;suma
	mov cl,M
	xor ch,ch
	xor di,di
	mov bp,si
petljica:
	add si,di
	mov bl,NIZ[si]
	sub bl,'0';dekadno
	add al,bl
	adc ah,0
	inc di
	mov si,bp
	loop petljica
	cmp ax, P
	jna dalje
	inc BROJ
	dalje:
	mov si,bp
	inc si
	dec dl
	jmp petlja
	kraj:

	mov ah, 4ch
	int 21h
	
code ends
end ut
