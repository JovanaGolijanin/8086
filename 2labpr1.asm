name 2labpr1
data segment
	br1 db 0ffh
	br2 db 0ffh
	br3 dw 0ffffh
	br4 dw 0Ah 
	br5 db 02h
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	mov ax, 0
	mov al, br1
	mov bx, 0
	mov bl, br2
	add al, bl
	adc ah,0
	mov cx, ax
	;cx = br1 + br2
	mov ax, br3
	mov dx, 0
	mul cx
	mov di, dx
	mov si, ax
	; di, si = (br1+br2)*br3
	mov ax, br4
	mov bx, 0
	mov bl, br5
	div bl
	mov ah, 0
	;ax = br4/br5
	sub si, ax
	sbb di,0
	;rezultat je u di, si
	
	mov ah, 4ch
	int 21h

code ends
end ut
	