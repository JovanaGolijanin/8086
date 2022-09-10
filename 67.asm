name 67zad
data segment
	MAT dw 1,2,3,4,5,6,7,8,9
	N db 3
	i db 1
	j db 1
	NIZS dw 3 dup(?)
	NIZG dw 3 dup(?)
	MING dw 0FFFFh
	MAXG dw 0
	MINS dw 0FFFFh
	MAXS dw 0
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
	
	xor bx,bx; za pocetak vrste
	mov cl,N
	xor ch,ch;za obe petlje
	xor di,di; za NIZG
	xor bp,bp; za NIZS
spoljnja:
	push cx; save cx
	
	xor si,si
	mov cl,N
	xor ch,ch
	xor ax,ax
	unutrasnja:
	
	mov al, i
	mov ah, j
	add al,ah;al=i+j
	mov dl, N
	inc dl
	cmp al,dl
	jne glavna
	mov ax, MAT[bx][si]
	mov NIZS[bp], ax
	add bp,2
	
	glavna:
	mov ah, i
	mov al, j
	cmp ah,al
	jne dalje
	mov ax, MAT[bx][si]
	mov NIZG[di], ax
	add di,2

	dalje:
	inc j
	add si,2
	loop unutrasnja
	
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	inc i
	mov j, 1
	
	pop cx;restore cx
	loop spoljnja
	
	
	
	xor bx,bx; za pocetak vrste
	mov i,1
	mov j,1
	mov cl,N
	xor ch,ch;za obe petlje
	xor di,di; za NIZG
	xor bp,bp; za NIZS
spoljnja2:
	push cx; save cx
	
	xor si,si
	mov cl,N
	xor ch,ch
	xor ax,ax
	unutrasnja2:
	
	mov al, i
	mov ah, j
	add al,ah;al=i+j
	mov dl, N
	inc dl
	cmp al,dl
	jne glavna2
	mov ax, NIZG[di]
	mov MAT[bx][si],ax
	
	cmp ax, MAXG
	ja veciG
	manji:
	cmp ax, MING
	jb manjiG
	jmp preskoci
	veciG:
	mov MAXG, ax
	jmp manji
	
	jmp preskoci
	manjiG:
	mov MING, ax
	
	preskoci:
	add di,2
	
	glavna2:
	mov ah, i
	mov al, j
	cmp ah,al
	jne dalje2
	mov ax, NIZS[bp]
	mov MAT[bx][si],ax
	
	cmp ax, MAXS
	ja veciS
	manjii:
	cmp ax, MINS
	jb manjiS
	jmp preskoci2
	veciS:
	mov MAXS, ax
	jmp manjii
	
	jmp preskoci2
	manjiS:
	mov MINS, ax
	
	preskoci2:
	add bp,2
	
	
	dalje2:
	inc j
	add si,2
	loop unutrasnja2
	
	add bl, N
	adc bh,0
	add bl, N
	adc bh,0
	inc i
	mov j, 1
	
	pop cx;restore cx
	dec cx
	cmp cx,0
	ja spoljnja2
	;loop spoljnja2

	
	mov ah, 4ch
	int 21h
	
code ends
end ut