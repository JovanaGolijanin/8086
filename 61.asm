name 61zad
data segment
	MAT dd 1, 2, 3, 4, 5, 6
	VRS dd 2 dup(?)
	KOL dd 3 dup(?)
	N db 2
	M db 3
	pom dw 0
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax
	
	xor bx,bx
	
	mov al,N
	mov cl,al
	xor ch,ch; cx=N
	
	shl al, 1;ax=2*N
	
	mov bl, M
	xor bh,bh
	xor ah,ah
	mul bl; ax = 2*N*M
	mov bp, ax;bp= 2*N*M
	
	xor dx,dx; visa rec zbira
	xor di,di; za VRS
	xor bx,bx; kroz vrste
	xor ax,ax; niza rec zbira
	
spoljnja:
	xor si,si
	mov pom, cx; save cx
	xor ax,ax
	xor dx,dx
	
	mov cl,M
	xor ch,ch
	unutrasnja:
	add ax, word ptr MAT[bx][si]
	adc dx, word ptr MAT[bx][si]+2
	
	add si,4

	loop unutrasnja
	
	mov word ptr VRS[di], ax
	mov word ptr VRS[di]+2, dx
	
	add di,4
	add bx, bp
	mov cx,pom; restore
	loop spoljnja
	
	;------------po kolonama
	
	mov cl,M
	xor ch,ch; cx=M
	
	;bp ostaje odozgo
	
	xor ax,ax; niza rec zbira
	xor dx,dx; visa rec zbira
	xor di,di; za KOL
	xor bx,bx; indeks kolone
	xor si,si; kroz kolone
	
spoljnja2:
	xor bx,bx
	
	mov pom, cx; save cx
	
	xor ax,ax
	xor dx,dx
	
	mov cl,N
	xor ch,ch
	unutrasnja2:
	add ax, word ptr MAT[bx][si]
	adc dx, word ptr MAT[bx][si]+2
	
	;add si,bp
	add bx, bp

	loop unutrasnja2
	
	mov word ptr KOL[di], ax
	mov word ptr KOL[di]+2, dx
	
	add di,4
	;add bx, 4
	add si,4
	mov cx,pom; restore
	loop spoljnja2


	mov ah, 4ch
	int 21h
	
code ends
end ut