extrn transponovana:far
name 80zad
data segment
	MAT1 dd 1,1,2,2
	MAT1T dd 4 dup(?)
    MAT2 dd 4 dup(?)
	N db 3
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

	xor bp,bp; MAT1 vrste
	xor di,di; MAT1 kolone
	
	;slanje ulaznih prametara
	lea ax, MAT1[bp][di]
	push ax; adresa matrice
	lea ax, MAT1T[bp][di]
	push ax; adresa matrice transponovane
	mov al,N
	xor ah,ah
	push ax;N
	
	;poziv
	call transponovana
	
	;preuzimanje izlaznih parametara
	
	
   

    mov ah,4Ch
    int 21h
code ends
end start