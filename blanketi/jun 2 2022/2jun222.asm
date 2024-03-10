name 2jun222
data segment
	NIZ dw -1,2,4,5,-3
data ends
stack segment
	bos dw 200 dup(?)
	tos label word
stack ends
code segment 
	assume cs:code, ds:data, es:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov es,ax
	mov ax,stack
	mov ss, ax
	lea sp, tos

	cld;autoinkrementiranje
	lea si, NIZ
	xor ax,ax
	mov cx,0FFFFh
	repne scasw
	mov bx, 0FFFFh
	sub bx,cx
	mov cx,bx; broj elemenata niza
	dec cx
	dec cx
	
	lea di, NIZ
	lea si, NIZ+2
petlja:
	cmpsw
	jl dalje
	sub si,2
	sub di,2
	movsw
	dalje:
	loop petlja
	

	mov ah,4ch
	int 21h
code ends
end ut
