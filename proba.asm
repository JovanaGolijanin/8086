name sabiranje
podaci segment
	suma dw ?
podaci ends
kod segment
	assume cs:kod, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	mov ax, bx
	add ax, cx
	add ax, dx
	mov suma, ax

	mov ah, 4ch
	int 21h
kod ends
end ut