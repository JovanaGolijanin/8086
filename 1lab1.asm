name 1lab1
	data segment
		podatak1 dw 0FFFFh
		podatak2 dw 0FFFFh
		rezultat dw ?
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov ax, podatak1
		mov bx, podatak2
		add ax, bx
		mov rezultat, ax
		
		mov ax, 4ch
		int 21h
code ends
end ut