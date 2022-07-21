name l24
	data segment
		br1 dd 0ffffffffh
		broj db 0
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
	
		mov ax,0
		mov cx, 16
		petlja:
		
		rcl word ptr br1,1
		adc broj,0
		
		rcl word ptr br1+2,1
		adc broj,0
		
		loop petlja
		
		
		;ax=32 (20h)
		mov ax,0
		mov al, broj
		
		mov ax, 4ch
		int 21h
code ends
end ut