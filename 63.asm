name 63zad
data segment
	MAT dw 1,1,1,1,1, 1,4,4,4,1, 1,4,3,4,1, 1,4,4,4,1, 1,1,1,1,1
	N db 5
	pbx dw 0
	psi dw 0
	pN dw 5
	NIZ dw 5 dup(?)
	s dw 0
	ZBIR dw 0; d ds:50
data ends
stack segment
	bos dw 200 dup(?)
	tos label word
stack ends
code segment
	assume cs:code, ds:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss, ax
	lea sp, tos
	
	xor di,di; za kretanje kroz niz

	xor bx,bx
	xor si,si;kretanje kroz matricu
	
	mov cl,N
	xor ch,ch; cx=N
	sub cx,3;broj prstenova
petlja:
	push cx; save cx
	xor ax,ax; suma
	
;*
	mov cx,pN
	
	xor si,si
	mov bx,pbx
	
	prvavrsta:
	add ax,word ptr MAT[bx][si]
	add si,2
	loop prvavrsta
	mov s, ax
	
;*
	mov cx,pN
	
	mov bx,pN
	dec bx
	mov ax, 10
	mul bx
	mov bx,ax; indeks poslednje vrste
	
	xor si,si
	xor ax,ax
	
	poslednjavrsta:
	add ax, word ptr MAT[bx][si]
	add si,2
	loop poslednjavrsta
	add s, ax
	
;*
	mov cx,pN
	sub cx,2
	
	mov bx,pbx
	add bx,pN
	add bx,pN; indeks prve kolone
	
	mov si,psi
	xor ax,ax
	
	prvakolona:
	add ax, word ptr MAT[bx][si]
	add bx,pN
	add bx, pN
	loop prvakolona
	add s, ax
	
;*
	mov cx,pN
	sub cx,2
	
	mov bx, pbx
	add bx,pN
	add bx,pN
	
	mov si,pN
	add si,pN
	sub si,2; indeks poslednje kolone
	
	xor ax,ax
	
	poslednjakolona:
	add ax, word ptr MAT[bx][si]
	add bx,pN
	add bx, pN
	loop poslednjakolona
	add s, ax
	
;*
	mov ax, s
	mov NIZ[di], ax
	add di,2
	
	inc pbx
	inc psi
	;dec pN
	sub pN,2
	
	pop cx; restore cx
	;loop petlja
	dec cx
	cmp cx,0
	ja petlja
	
	mov cl,N
	xor ch,ch
	sub cx,3
	
	xor di,di;za kretanje kroz niz
	
	xor bx,bx;max
	najveci:
	cmp word ptr NIZ[di], bx
	ja veci
	jmp dalje
	veci:
	mov bx, word ptr NIZ[di]
	dalje:
	add di,2
	loop najveci
	
	mov ZBIR, bx
	
	mov ah, 4ch
	int 21h
	
code ends
end ut