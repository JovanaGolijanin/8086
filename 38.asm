name 39zad; prethodni je bio 38
data segment
	TXT db '1 1.2 2 2.3 3.','#'
	pom db 10 dup(?)
	REC db 17 dup(?)
	lok dw 0
data ends
code segment
	assume cs:code, ds: data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax

	xor bl,bl;max reci
	xor bh,bh;broj reci (u trnutnoj recenici)
	xor si,si; kroz TXT
	xor di,di; pomocni niz koji cuva tekucu recenicu
petlja:
	;prebaci recenicu u pomocni nizu
	mov al, byte ptr TXT[si]
	mov pom[di], al
	inc di
	
	cmp TXT[si], ' '
	je povecaj
	cmp TXT[si], '.'
	je finish
	cmp TXT[si], '#'
	je kraj
	
	inc si
	jmp petlja
	
	povecaj:
	inc bh
	inc si
	jmp petlja
	
	finish:
	inc si
	inc bh; broj reci
	mov ah, bh; cuvam ga za uslov
	xor bh,bh;;moram da resetujem bh za novu recenicu
	cmp ah, bl
	jbe petlja
	
	mov bl, ah;max broj reci broj reci
	xor bh,bh
	mov lok, bx
	
	xor bx,bx
	xor di, di
	kopiraj:
	cmp pom[di], '.'
	je prekopiran
	mov dl, pom[di]
	mov byte ptr REC[bx], dl
	inc di 
	inc bx
	jmp kopiraj
	prekopiran:
	mov byte ptr REC[bx], '#'
	
	mov bx, lok
	xor di, di; za novu recenicu;
	
	jmp petlja
	
	kraj:
	
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
