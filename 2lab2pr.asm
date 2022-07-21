name 2lab2pr
	data segment
		BR1 dw 0FFFFh
		BROJ db 0
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov cx, 10h
		
		petlja:
		rol BR1, 1
		
		jc saberi
		loop petlja
		saberi:
		inc BROJ
		loop petlja
		
		
		mov ax, 4ch
		int 21h
code ends
end ut