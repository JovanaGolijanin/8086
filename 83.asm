name zad83
data segment
	brojevi dw 41, 47, 63,62;A, G, c, b
	aski db 4 dup(?)
	N db 4
data ends
code segment 
	assume cs:code, ds:data
ut:
	
	
	mov ah,4ch
	int 21h
code ends
end ut
