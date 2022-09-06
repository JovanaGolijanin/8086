name 29zad
extrn prevedi:far
data segment
	EXPR db  '8','1', '+', '1','9', '-' , '1', '=';99(63h)
	VAL dw ?
	pom db 20 dup(?)
data ends
stack segment
stack ends
code segment
	assume cs:code, ds: data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss, ax
	
	;mora prvo da odredimo broj elemenata
	xor cx,cx
	xor di,di; kroz EXPR
	xor bx, bx
petlja:
	cmp byte ptr EXPR[di], '='
	je kraj
	cmp byte ptr EXPR[di], '+'
	je saberi
	cmp byte ptr EXPR[di], '-'
	je oduzmi
	
	;ako je broj, smesti ga u pomocni niz
	mov dl, byte ptr EXPR[di]
	mov byte ptr pom[bx],dl
	inc bx; pomocni niz
	mov cx, bx
	
	inc di
	jmp petlja
	
	saberi:
	inc di
	;slanje ulaznih parametara
	lea si, pom
	
	;poziv
	call prevedi
	
	;preuzimanje izlaznih parametara
	add VAL, ax
	xor bx,bx
	jmp petlja
	
	oduzmi:
	inc di
	;slanje ulaznih parametara
	lea si, pom
	
	;poziv
	call prevedi
	
	;preuzimanje izlaznih parametara
	sub VAL, ax
	xor bx,bx
	jmp petlja
	
	kraj:


	mov ah, 4ch
	int 21h
	
code ends
end ut
