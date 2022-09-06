name 45zad
extrn XCHGSW:far
data segment
	NIZ dw 3,2,-1,3,3,-1
	N db 6
data ends
stack segment 
	bos dw 200 dup(?)
	tos label word
stack ends
code segment
	assume cs:code, ds: data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss, ax
	lea sp,tos
	
	mov cl, N
	xor ch,ch
petljica:
	mov bx,cx; sacuvam cx

	mov cl, N
	xor ch,ch
	xor si,si
petlja:

	mov ax, word ptr NIZ[si+2]
	cmp word ptr NIZ[si],ax
	jle sledeci
	;slanje ulaznih parametara
	mov ax,si
	push ax; si
	inc ax
	inc ax
	push ax; si+1
	;poziv 
	call XCHGSW
	;preuzimanje izlaznih parametara
	
	sledeci:
	add si,2
	loop petlja

	sledeci2:
	;dec bx
	mov cx,bx
	loop petljica
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
