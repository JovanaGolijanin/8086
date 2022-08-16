name 3labpr
data segment
	n db C
	niz dw 3,1,5,4,2,8,9,77,4,6,3,'#'
	zbir dd 0 ;7A (122)
	broj dd 0 ;4
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	
	
	
	mov ah,4ch
	int 21h
code ends
end start