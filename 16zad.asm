name 16zad
data segment
	BROJ db 0CEh
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	mov bl, BROJ ; 10100101
	mov cx, 8; ima 8 binarnih cifara
	mov dl,0
	
	;upisujem BROJ u dl u obrnutom redosledu
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
	cmp dl,BROJ
	jnz kraj; ako nisu isti gotovo je
	
	jeste:
	
	mov al, BROJ
	and al, 055h
	mov bl,0
	add bl,al; u bl su samo znacajne cifre
	shl bl, 1;rotirani parni
	mov dl,bl; u dl parni
	
	mov al, BROJ
	and al, 0AAh
	mov bl,0
	add bl,al; u bl su samo znacajne cifre
	shr bl, 1;rotirani neparni
	
	add dl,bl; u dl je rotiran broj
	mov BROJ, dl

	kraj:

	mov ah, 4ch
	int 21h
	
code ends
end ut
