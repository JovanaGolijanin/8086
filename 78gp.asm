extrn proizvod:far
name 78zad
data segment
	MAT1 db 1,2,3,2,1,2,3,1,2
    MAT2 db 1,4,2,3,3,2,2,1,1
	MAT3 dw 10 dup(?)
	N db 3
data ends
stack segment
	bos dw 100 dup(?)
	tos label word
stack ends
 
code segment
assume  cs:code,ds:data, ss:stack
start:  mov ax,data
    mov ds,ax
	mov ax,stack
	mov ss,ax
	lea sp,tos

	xor bp,bp;MAT1
	xor di,di;MAT2
	xor bx,bx;MAT3
	
	mov cl,N
	xor ch,ch
petlja:
	;push cx
	mov dx,cx
	xor si,si
	
	mov cl,N
	xor ch,ch
	unutrasnja:
	;slanje ulaznih parametara
	lea ax,MAT3[bx][si]
	push ax
	lea ax, MAT2[di]
	push ax
	mov al,N
	xor ah,ah
	push ax;N
	lea ax, MAT1[bp]
	push ax
	
	;poziv
	call proizvod
	;preuzimanje izlaznih parametara
	add si,2
	mov al,N
	xor ah,ah
	add di,ax
	loop unutrasnja
	xor di,di
	mov al,N
	xor ah,ah
	add bp,ax
	shl ax, 1;2*N
	add bx,ax
	
	;pop cx
	mov cx,dx
	loop petlja
	
   

    mov ah,4Ch
    int 21h
code ends
end start