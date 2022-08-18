name 16zad
data segment
	BROJ dw 0CF0Ch
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	mov ax, BROJ 
	not al
	
	mov cx, 8; ima 8 binarnih cifara
	mov dl,0
	mov bl,al
	
	;upisujem al u dl u obrnutom redosledu
petlja:
	clc
	rcr bl, 1
	adc dl,0
	cmp cx,1
	je preskoci
	shl dl,1
	loop petlja
	
	preskoci:
	;dl obrnut
	cmp dl,ah
	jne kraj; ako nisu isti gotovo je
	
	jeste:
	mov cx, 16; ima 8 binarnih cifara
	mov dx,0
	;mov al,dl
	;mov bx,ax
	mov bx,BROJ
	
	;upisujem BROJ u dx u obrnutom redosledu
petlja2:
	clc
	rcr bx, 1
	adc dx,0
	cmp cx,1
	je kraj
	shl dx,1
	loop petlja2

	kraj:
	mov BROJ,dx

	mov ah, 4ch
	int 21h
	
code ends
end ut
