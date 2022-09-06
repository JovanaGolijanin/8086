name 43zad
data segment
	NIZ1 db 1,2,3,4,0FFh,8,7,6,5,2,'A', 00h
	NIZ2 db 11 dup(?)
data ends
code segment
	assume cs:code, ds: data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax

	xor bx,bx
	lea si, NIZ1
broj:
	cmp byte ptr [si], 00h
	je finish
	inc bx
	inc si
	jmp broj
	finish:

	xor ch,ch; indikator za CF
	lea si, NIZ1
	lea di, NIZ2
petlja:
	cmp byte ptr [si], 00h
	je kraj
	cmp byte ptr [si], 2
	jne preskoci
	cmp byte ptr [si+1], 'A'
	jne preskoci
	mov ch,1
	preskoci:

	cmp byte ptr [si], 0FFh
	je unazad
	cld;unapred
	lodsb
	stosb
	jmp petlja
	
	unazad:
	sub bx, si
	add si,bx; na kraj 1. niza
	dec si
	vec:
	
petljica:
	cmp byte ptr [si], 0FFh
	je kraj
	cmp byte ptr [si], 'A'
	jne dalje
	cmp byte ptr [si-1], 2
	jne dalje
	mov ch,1
	dalje:
	std
	lodsb
	cld 
	stosb
	jmp petljica
	
	kraj:
	mov byte ptr [di], 00h
	cmp ch,1
	je setuj
	jmp gotovo
	setuj:
	stc
	
	gotovo:

	mov ah, 4ch
	int 21h
	
code ends
end ut
