name 1lab1
	data segment
		podatak1 db 0FFh
		podatak2 db 0FFh
		rezultat dw ?
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov al, podatak1
		mov bl, podatak2
		add al, bl
		mov ah, 0
		adc ah, 0
		mov rezultat, ax
		
		mov ax, 4ch
		int 21h
code ends
end ut