name l23
	data segment
		br1 db 0ffh
		br2 db 0ffh
		br3 dw 0ffffh
		br4 dw 0ffffh
		br5 db 0ffh
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov ax, br3
		mov bx, br4
		mov dx,0
		add ax, bx
		adc dx,0
		;dx:ax rez = 0001 FFFE
		mov cx,0
		mov cl, br1
		add ax, cx
		adc dx,0
		;dx:ax rez = 0002 00FD
		mov di, dx
		mov si, ax
		
		mov ax,0
		mov al,br2
		div br5
		;ax rez
		sub si, ax
		sbb di,0
		;di:si= 0002 00FC
		
		mov ax, 4ch
		int 21h
code ends
end ut