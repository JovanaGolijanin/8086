name l25
	data segment
		br1 dw 011f4h
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
		
		dec cx
		rcl br1,1
		;adc al,0
		jncq potencijalno
		
		cmp cx,0
		ja petlja
		jmp ispod
		
		potencijalno:
		mov ax,0 ;za sl prolazak
		dec cx
		rcl br1,1
		;adc al,0
		jc pogodak
		
		cmp cx,0
		ja petlja
		jmp ispod
		
		pogodak:
		inc broj
		
		cmp cx,0
		ja petlja
		jmp ispod
		
		ispod:
		;ax=3
		mov ax,0
		mov al, broj
		
		mov ax, 4ch
		int 21h
code ends
end ut