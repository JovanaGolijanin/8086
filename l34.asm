name l34
data segment
	niz dw  2, 3, 4, 0FFFFh, 1
	broj db 5
	min dw 0
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	
	mov cx,0
	mov cl,broj
	
	;i
	mov si,0
	;imin
	mov di,0
	;ax - min
	mov ax, niz[di]
	
	petlja:
	
	;tekuci < min
	cmp niz[si], ax
	jb zameni
	
	add si,2
	loop petlja
	
	jmp kraj
	
	zameni:
	mov ax, niz[si]
	mov di, si
	
	add si,2
	loop petlja
	
	kraj:
	mov min, ax
	
	
	mov ah,4ch
	int 21h
code ends
end start