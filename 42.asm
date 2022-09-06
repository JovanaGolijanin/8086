name 42zad
data segment
	ULNIZ db 'malaSLOVA:)$';ukupno 12
	IZNIZ db 12 dup(?)
	MAX dw 11;bez kraja
data ends
code segment
	assume cs:code, ds: data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax

;velika slova
	xor si,si
	mov dh, 'a'
	sub dh, 'A'

	lea si, ULNIZ
	lea di, IZNIZ
	
	mov cx,MAX
	add si, cx
	inc cx
petlja:
	std
	lodsb
	cmp al, '$'
	je sledeci
	cmp al, 'a'
	jb preskoci
	cmp al, 'z'
	ja preskoci
	sub al, dh
	preskoci:
	cld
	stosb
	sledeci:
	loop petlja
	kraj:
	mov al, '$'
	stosb

	mov ah, 4ch
	int 21h
	
code ends
end ut
