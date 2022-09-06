name 41zad
data segment
	TEXT db 'a1  11  .b  222  2.','$
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
prva:
	cmp TEXT[si], 'a'
	jb dole
	cmp TEXT[si], 'z'
	ja dole
	sub TEXT [si], dh

	dole:
	inc si
	
petlja:
	cmp TEXT[si], '$'
	je kraj
	cmp TEXT[si], '.'
	je proveri
	inc si
	jmp petlja
	
	proveri:
	inc si
	cmp TEXT[si], '$'
	je kraj
	cmp TEXT[si], 'a'
	jb dole
	cmp TEXT[si], 'z'
	ja dole
	sub TEXT [si], dh
	inc si
	jmp petlja
	
	kraj:
	
	
;sada blanko
	xor si,si
blanko:
	cmp TEXT[si], '$'
	je gotovo
	
	cmp TEXT[si], ' '
	jne uvecaj
	
	inc si
	drugi:
	cmp TEXT[si], ' '
	jne uvecaj
	
	mov di,si
	pomeri:
	cmp TEXT[si], '$'
	je pomereno
	mov ah, TEXT[si+1]
	mov TEXT[si], ah
	inc si
	jmp pomeri
	
	pomereno:
	mov TEXT[si], 0
	mov si,di
	
	uvecaj:
	inc si
	jmp blanko
	
	gotovo:
	


	mov ah, 4ch
	int 21h
	
code ends
end ut
