name 44zad
extrn karakter:far
data segment
	IZV db 'razredni'
	N dw 8
data ends
data2 segment
	ODR db 8 dup(?)
data2 ends
stack segment 
	bos dw 200 dup(?)
	tos label word
stack ends
code segment
	assume cs:code, ds: data, es:data2, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, data2
	mov es, ax
	mov ax, stack
	mov ss, ax
	lea sp,tos

	lea si,IZV
	mov di, N
	dec di
	xor bx,bx
	mov cx,N
petlja:
	;slanje ulaznih parametara
	mov ah, byte ptr [si]
	;call 
	call karakter
	;preuzimanje izlaznih parametara
	cmp dl, 1
	jne sug
	mov ah, byte ptr[si]
	mov byte ptr ODR[bx], ah
	inc si
	inc bx
	jmp dole
	
	sug:
	mov ah, byte ptr[si]
	mov byte ptr ODR[di], ah
	dec di
	inc si
	dole:
	loop petlja

	mov ah, 4ch
	int 21h
	
code ends
end ut
