name 1lab3zad
	data segment
		podatak1 db 0FFh
		rezultat dd ?
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov ah, 0
		mov al, podatak1
		mov cx, 0FFFFh
		add ax, cx
		mov word ptr rezultat, ax
		mov word ptr rezultat+2, 0
		adc word ptr rezultat+2, 0
		
		mov ax, 4ch
		int 21h
code ends
end ut