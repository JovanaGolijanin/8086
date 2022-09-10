name 76zad
 
data segment
    A db 1,3,2, 2,4,3, 3,1,4, 00h
    B db 13 dup(?)
	N db 3
	M db 4
data ends
stack segment
	bos dw 100 dup(?)
	tos label word
stack ends
 
code segment
assume  cs:code,ds:data,es:data, ss:stack
start:  mov ax,data
    mov ds,ax
    mov es,ax
	mov ax,stack
	mov ss,ax
	lea sp,tos
   
	xor bx,bx;kroz vrste
	mov cl,N
	xor ch,ch;spoljna
	mov dl, 1;i
	mov dh, 1;j
	lea si,A
	lea di,B
	
	lodsw; al=i, ah=j
	
spoljna:
	push cx;save cx
	xor bp,bp; kroz kolone
	
	mov cl,M
	xor ch,ch;unutrasnja
	unutrasnja:
	
	cmp al, dl;da li je trenutni element
				;na ovom mestu u matrici
	jne dalje
	cmp ah,dh
	jne dalje
	lodsb; al=A[i,j]
	stosb; smesti u mat B <- A[i,j]
	jmp ucitaj
	nazad:
	
	jmp nastavi
	
	dalje:
	push ax
	xor al,al
	stosb ;mat B <- 0
	pop ax
	
	nastavi:
	inc bp; sl element u vrsti
	inc dh;j++
	loop unutrasnja
	
	inc dl
	mov dh,1
	add bl,M
	adc bh,0
	pop cx
	loop spoljna
	
	jmp kraj
	
	ucitaj:
	lodsw; al=i, ah=j
	;push ax
	cmp al,00h
	je nastavi
	jmp nazad
	
	kraj:
    mov ah,4Ch
    int 21h
code ends
end start