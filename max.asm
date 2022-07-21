name max
	data segment
		br1 db 0
		br2 db 0ffh
		br3 dw 0ffffh
		br4 dw 0ffffh
		br5 db 0ffh
	data ends
	code segment 
		assume cs:code, ds: data
ut:
		mov ax, data
		mov ds, ax
		
		mov ax,0
		mov al, br1
		mov bl, br2
		sub al, bl
		sbb ah,0
		;al= FF01
		idiv br3
		;ax = 0
		mov si, ax
		;si = 0
		mov bx, br4
		mov ax, 0
		mov al, br5
		mul bx
		;dx:ax = FE FF01
		add ax, si
		adc dx,0
		;dx:ax = 00FE FF01
		
		
		mov ah, 4ch
		int 21h
		
code ends
end ut