name 8t2
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
	
	cmp ax, bx
	jbe nije
	
	;da:
	cmp ax, cx
	;da:
	mov dx, ax
	
	jmp ispod
	
	nije:
	cmp bx, cx
	jbe nije2
	
	;da
	mov dx, bx
	jmp ispod
	
	nije2:
	mov dx, cx
	
	ispod:
	mov max, dx
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut	