extrn sekvenca:far
name 51zad
data segment
	BROJ dd 0A22AA22Ah
	REZ db ?
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
	
	;slanje ulaznih parametara
	mov ax, word ptr BROJ
	push ax
	mov ax, word ptr BROJ+2
	push ax
	lea ax, REZ
	push ax
	
	;poziv
	call sekvenca
	;preuzimanje ulaznih parametara
		
	mov ah, 4ch
	int 21h
	
code ends
end ut
