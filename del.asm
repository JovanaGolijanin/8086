name 2lab2zad
	data segment
		br1 db 5
		br2 db 3
		br3 dw 4
		br4 dw 7
		br5 db 8
		b1 dd 0
		b2 dd 0
		rez dw 4 dup(0)
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov ax, 0
		mov bx, 0
		mov al, br1
		mov bl, br2
		add ax, bx
		mov si, ax
		;si = 8
		mov ax, br3
		mov bx, br4
		add ax, bx
		mov dx, 0
		adc dx, 0
		;dx:ax = 11 (B)
		mov word ptr b1, si
		mov word ptr b2, ax
		mov word ptr b2+2, dx
		;b1L*b2L ----1
		mov ax, word ptr b2
		mul word ptr b1
		mov rez, ax
		mov rez+2, dx
		;2
		mov ax, word ptr b2+2
		mov bx, word ptr b1
		mul bx
		add word ptr rez+2, ax
		adc word ptr rez+4, dx
		;3
		mov ax, word ptr b2
		mov bx, word ptr b1+2
		mul bx
		add word ptr rez+2, ax
		adc word ptr rez+4, dx
		adc word ptr rez+6,0
		;4
		mov ax, word ptr b2+2
		mov bx, word ptr b1+2
		mul bx
		add word ptr rez+4, ax
		adc word ptr rez+6, dx
		
		;rez = 88 (56h)
		
		mov ax, word ptr rez
		mov bx, word ptr rez+2
		mov cx, word ptr rez+4
		mov dx, word ptr rez+6
		
		;deljenje
		mov ax, word ptr rez
		mov dx, word ptr rez+2
		
		mov cx, 0
		mov cl, br5
		
		div cx
		;rezultat u ax = 11 (B)
		
		
		mov ax, 4ch
		int 21h
code ends
end ut