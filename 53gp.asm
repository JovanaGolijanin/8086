extrn rotacija:far
name 53zad
data segment
	NIZ1 dw 08080h, 08080h
	N db 2
	NIZ2 dw 4 dup(?); 1010h 1010h
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
	

petlja:
	;slanje ulaznih parametara


	;poziv
	call rotacija
	
	;preuzimanje ulaznih parametara

	
	mov ah, 4ch
	int 21h
	
code ends
end ut
