name 21zad
extrn neopada:far
data segment
	NIZ1 db 2,3,4,6,6,7,7,0
	NIZ2 db 1,2,3,3,4,5,6,0
	NIZ3 db 20 dup(0)
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	xor bx,bx
	
	
	;slanje ulaznih parametara
	lea si,NIZ1
	lea di,NIZ2
	xor ax,ax;ax=0

petlja:
	cmp byte ptr NIZ1[si],0
	je kraj1
	
	cmp byte ptr NIZ2[di],0
	je kraj2
	
	;poziv
	call neopada
	
	;preuzimanje izlaznih parametara
	mov byte ptr NIZ3[bx], al
	inc bx
	
	jmp petlja
	
	kraj1:
	cmp NIZ2[di],0
	je kraj
	mov cl,  NIZ2[di]
	mov byte ptr NIZ3[bx], cl
	inc bx
	inc di
	jmp kraj1
	
	kraj2:
	cmp NIZ1[si],0
	je kraj
	mov cl,  NIZ1[si]
	mov byte ptr NIZ3[bx], cl
	inc bx
	inc si
	jmp kraj2
	
	kraj:
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
