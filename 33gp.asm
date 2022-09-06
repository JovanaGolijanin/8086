name 33zad
extrn nadji:far
data segment
	NIZ db '1','2','2','3','2'
	N dw 5
	KAR db ?
data ends
stack segment
	bos dw 200 dup(?)
	tos label word 
stack ends

code segment
	assume cs:code, ds: data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss,ax
	lea sp, tos
		
	mov bx,0; max broj pojavljivanja
	mov cx, N
	xor si,si
petlja:
	
	;slanje ulaznih parametara
	lea ax, NIZ
	push ax
	mov ax,N
	push ax
	mov al, byte ptr NIZ[si]
	xor ah,ah
	push ax
	
	;poziv
	call nadji
	;preuzimanje izlaznih parametara
	;u dx je rezultat tj u dl
	cmp dl,bl
	jna sledeci
	mov bl,dl
	mov bh, byte ptr NIZ[si]
	sledeci:
	inc si
	loop petlja
	
	mov KAR, bh

	mov ah, 4ch
	int 21h
	
code ends
end ut