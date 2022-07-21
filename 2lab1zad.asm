name 2lab1zad
	data segment
		br1 db 12
		br2 db 2
		br3 dw 2
		br4 dw 3
		br5 db 2
	data ends
	code segment 
		assume cs:code, ds: data
ut:
		mov ax, data
		mov ds, ax
		
		mov al, br1
		mov bl, br2
		sub al, bl
		;al= 5
		mov ah,0
		div br3
		;dx:ax = 5
		mov si, ax
		;si = 5
		mov bx, br4
		mov ax, 0
		mov al, br5
		mul bx
		;dx:ax = 6
		add ax, si
		adc dx,0
		;dx:si = 11 (B)
		
		
		mov ah, 4ch
		int 21h
		
code ends
end ut