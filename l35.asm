name l34
data segment
	niz dw  2, 3, 25, 4, 7, 25, 3, 8, 9, 25 ;3
	broj db 10
	pon db 0
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	
	mov cx, 0
	mov cl, broj
	
	mov si, 0
	mov ax,0
	
	petlja:
	
	cmp niz[si], 25
	je jednaki
	add si,2
	loop petlja
	
	jednaki:
	inc ax
	mov niz[si], 50
	add si,2
	
	loop petlja
	
	mov pon, al
	
	mov ah,4ch
	int 21h
code ends
end start