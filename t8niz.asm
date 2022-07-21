name t8niz
	data segment
		k db 4
		reci dw 3,5,8,02ABCh
		zbir dd ?
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		;suma
		xor ax, ax
		xor dx, dx
		lea bx, reci
		mov cl, k
		xor ch,ch
		
		petlja:
		add ax, [bx]
		adc dx,0
		add bx,2
		loop petlja
		
		mov word ptr zbir, ax
		mov word ptr zbir+2,dx
		
		
		mov ax, 4ch
		int 21h
code ends
end ut