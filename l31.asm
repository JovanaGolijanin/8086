name l31
data segment
	;n db C (12)
	niz dw 3,1,5,4,2,8,9,77,4,6,3,'#'
	zbir dd 0 ;7A (122)
	broj dw 0 ;4
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	
	mov si,0
	mov ax,0
	mov dx,0
	mov bx, 0
	
	petlja: ;nije kraj
	
	cmp niz[si], '#'
	jne suma
	je kraj
	
	kraj77:
	cmp niz[si], 77
	je povecaj
	jne suma1
	
	povecaj:
	add si,2
	dec bx
	jmp petlja
	
	
	suma: ;dx,ax
	add ax, word ptr niz[si]
	adc dx, 0
	
	cmp niz[si],5
	je suma1
	
	add si, 2
	jmp petlja
	
	suma1:; 5-77 dx,ax
	add si,2
	add ax, word ptr niz[si]
	adc dx, 0
	inc bx
	jmp kraj77
	
	kraj: 
	mov word ptr zbir, ax
	mov word ptr zbir+2, dx
	mov broj, bx
	
	
	mov ah,4ch
	int 21h
code ends
end start