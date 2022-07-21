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
		
		mov cx, 16
		petlja:
		
		rol word ptr br1,1
		jc saberi
		jnc ispod
		saberi:
		inc broj
		ispod:
		loop petlja
		
		mov cx, 16
		petlja2:
		
		rol word ptr br1+2,1
		jc saberi2
		jnc ispod2
		saberi2:
		inc broj
		ispod2:
		loop petlja2
		
		;ax=32
		mov ax,0
		mov al, broj
		
		mov ax, 4ch
		int 21h
code ends
end ut