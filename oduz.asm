name oduz
	data segment
		rez dd 0
	data ends
	code segment
		assume cs:code, ds:data
ut:
		mov ax, data
		mov ds, ax
		
		mov ax, 0
		mov cx, 0ffh
		sub al, cl
		sbb ah, 0
		
		mov ax, 4ch
		int 21h
code ends
end ut