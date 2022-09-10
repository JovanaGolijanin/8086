name 58zad
data segment
	NIZ dw 1,2,3,4,5
	K db 5
	MAT dw 15 dup(?)
	M db 5
	N db 3
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax

	mov cl, N
	xor ch,ch
	xor bx,bx
	xor di,di
	mov al, K
	xor ah,ah
	mov bp,ax
	shl bp,1; 2k
	sub bp,2;kretanje kroz niz
spoljasnja:
	xor bx,bx
	xor dl, dl
unutrasnja:
	mov ax, NIZ[di]
	mov MAT[bx][si], ax
	cmp di,bp
	jae	resetuj
	add di,2
	jmp preskoci
	resetuj:
	xor di,di
	preskoci:
	add bl,M
	adc bh,0
	inc bx
	
	inc dl
	cmp dl, M
	jl unutrasnja
	
	add si,2
	loop spoljasnja

	mov ah, 4ch
	int 21h
	
code ends
end ut