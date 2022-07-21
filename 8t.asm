name 8t
data segment
	max dw ?
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	mov ax, 1
	mov bx, 2
	mov cx, 3
	
	mov dx, ax
	cmp bx, dx
	jbe g1
	;da:
	mov dx, bx
	
	g1:
	cmp cx, dx
	jbe g2
	;da:
	mov dx, cx
	
	g2:
	mov max, dx
	
	mov ah, 4ch
	int 21h
	
code ends
end ut	