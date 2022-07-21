name mnoz
	data segment
		rez dd 0
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov ax, 0ffffh
		mov cx, 0ffffh
		mul cx
		
		mov ax, 4ch
		int 21h
code ends
end ut