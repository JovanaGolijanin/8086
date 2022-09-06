name 47zad
extrn kopiraj:far
data segment
	NIZ1 db 'abcAaaaAabc'
	NIZ2 db 11 dup (?)
	N db 11
	M db ?
data ends
code segment
	assume cs:code, ds:data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax
	
	xor cl,cl;kraj petlje
	xor ch,ch;za M
	xor si,si
	dec si
	dec cl
petlja:
	inc cl
	cmp cl,N
	jae kraj
	inc si
	
	cmp NIZ1[si], 'A'
	jl petlja
	cmp NIZ1[si], 'Z'
	ja petlja
	
	mov bp,si; cuvam indeks za proceduru
	podniz:
	inc ch
	inc si
	cmp NIZ1[si], 'a'
	jl drugo
	jmp podniz
	
	drugo:
	inc ch
	mov M,ch
	
	kraj:
	
	;slanje ulzanih parametara
	mov al,M
	xor ah,ah
	push ax;M
	lea di, NIZ2
	push di; odredisni indeks
	mov si,bp
	push si; izvorisni indeks
	
	;poziv
	call kopiraj
	
	;preuzimanje izlaznih parametara

	
	mov ah, 4ch
	int 21h
	
code ends
end ut
