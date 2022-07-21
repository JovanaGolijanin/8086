name 2lab2zad
	data segment
		br1 db 0ffh
		br2 db 0ffh
		br3 dw 0ffffh
		br4 dw 0ffffh
		br5 db 0ffh
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
		;si = 1FE
		mov ax, br3
		mov bx, br4
		add ax, bx
		mov dx, 0
		adc dx, 0
		;dx:ax = 1FFFE
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
		
		;rez = 0000000003FBFC04
		
		mov ax, word ptr rez
		mov bx, word ptr rez+2
		mov cx, word ptr rez+4
		mov dx, word ptr rez+6
		
		
		mov ax, 4ch
		int 21h
code ends
end ut