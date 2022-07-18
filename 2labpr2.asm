name 2labpr2
data segment
	br1 dd 0ffff0000h
	br2 dw 0ffffh
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	mov ax, word ptr br1
	mov cx, word ptr br1+2
	mov bx, br2

	sub ax, bx
	sbb cx, 0
	
	mov ah, 4ch
	int 21
	
code ends
end ut	