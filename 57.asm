name 57zad
data segment
	A db 1,2,3,4,5,6,7,8,9
	B dw 9 dup(?)
	N db 3
	M db 3
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax

	xor di,di;za B
	xor si,si; kroz elemente jedne vrste
	mov cl, N
	xor ch,ch;brojac
	xor ah,ah;pretvaramo u 16b
	
spoljnja:
	xor bx,bx; na pocetak kolone
	mov dx, cx; save cx
	mov cl, N
	xor ch,ch;brojac
	unutrasnja:
	mov al, byte ptr A[bx][si]
	mov word ptr B[di], ax
	add di,2
	add bx, 3
	loop unutrasnja
	
	mov cx, dx; restore cx
	inc si
	loop spoljnja
	
	mov ah, 4ch
	int 21h
	
code ends
end ut