name 27zad
data segment
	NIZ1 db 37h,5fh
	NIZ2 db 10h,5fh
	RAZLIKA dd ?
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	
	lea si, NIZ1
	mov sp, 00h
	xor ax,ax; nizi
	xor cx,cx; visi
 	
petlja:
	
	;visi polubaj
	mov bl, byte ptr [si]
	and bl, 0f0h; postavljamo bitove 
	cmp bl, 0f0h; proveravamo da li su jedinice na kraju ostale
	je dalje
	
	
	
	
	
	
	;nizi polubajt
	mov bl, byte ptr [si]
	and bl, 0fh; postavljamo bitove 
	cmp bl, 0fh; proveravamo da li su jedinice na kraju ostale
	je dalje
	
	
	
	dalje:
	;na drugi predji

	
	
	jmp petlja
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
