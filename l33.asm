name l31
data segment
	niz dw  1, 2, 3, 4, 0FFFFh
	broj db 5
	max dw 0
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
	;imax
	mov di,0
	;ax - max
	mov ax, niz[di]
	
	petlja:
	
	;tekuci > max
	cmp niz[si], ax
	ja zameni
	
	add si,2
	loop petlja
	
	jmp kraj
	
	zameni:
	mov ax, niz[si]
	mov di, si
	
	add si,2
	loop petlja
	
	kraj:
	mov max, ax
	
	
	mov ah,4ch
	int 21h
code ends
end start