name l31
data segment
	niz32 dd 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh
	broj db 3
	zbir db 5 dup(0) 
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	
	mov cx,0
	mov cl, broj
	
	mov si,0
	
	;suma bx,dx,ax
	mov ax, 0
	mov dx,0
	mov bx,0
	 
	petlja:
	add ax, word ptr niz32[si]
	adc dx, 0
	add dx, word ptr niz32[si]+2
	adc bl,0
	loop petlja
	
	mov zbir,al
	mov zbir+1,ah
	mov zbir+2,dl
	mov zbir+2,dh
	mov zbir+3,bl
	
	mov ah,4ch
	int 21h
code ends
end start