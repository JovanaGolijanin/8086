name 76zad
 
data segment
    MAT3 dd 4 dup(0)
	MAT1 dw 1,2,2,3,1,1
    MAT2 dw 4,2,3,1,1,5
	N db 2
	M db 3
	K db 2
	pom1 dw 0 ;indeks MAT3
	pom2 dw 0 ;cuvam di za MAT1
data ends
stack segment
	bos dw 100 dup(?)
	tos label word
stack ends
 
code segment
assume  cs:code,ds:data, ss:stack
start:  mov ax,data
    mov ds,ax
	mov ax,stack
	mov ss,ax
	lea sp,tos

	xor di,di;kroz kolone MAT1
	xor bx,bx;kroz vrste MAT2
	xor si,si;kroz kolone MAT2
	xor bp,bp;kroz vrste MAT1
	
	mov cl,N
	xor ch,ch

petljaN:
	push cx
	
	xor bx,bx;brojac kolona za MAT2
	
	mov cl,K
	xor ch,ch
	petljaK:
	push cx
	
	mov cl,M
	xor ch,ch
	
	xor bp,bp; za novu kolonu
	xor di,di; za novu vrstu
	
	xor ax,ax
	xor dx,dx;zbir 
	petljaM:
	push cx
	
	mov ax, MAT1[bp][di]
	mov cx, MAT2[bx][si]
	mul cx;dx:ax je proizvod
	
	push di; za MAT1 cuvam
	mov di, pom1;indeks MAT3

	add word ptr MAT3[di], ax
	adc word ptr MAT3[di]+2, dx
	
	pop di; obnavljam za MAT1
	push ax

	add di,2
	
	xor ah,ah
	mov al,K
	shl al,1; 2K
	;add si,ax
	add bx,ax
	

	;xor si,si
	
	pop ax
	
	pop cx
	loop petljaM
	
	mov di, pom1;indeks MAT3
	add di,4; kroz MAT3
	mov pom1, di;cuvam indeks MAT3
	
	
	;add bx,2
	add si,2
	
	pop cx
	loop petljaK
	
	xor ah,ah
	mov al,M
	shl al,1; 2M
	add bp,ax
	
	pop cx
	loop petljaN
	
   

    mov ah,4Ch
    int 21h
code ends
end start