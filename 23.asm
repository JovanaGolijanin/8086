name 23zad
data segment
	BROJ db '8','2','4'
	CHAR db '2'
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	xor si,si;cifre u BROJ-u
	;xor di,di
petlja:
	cmp BROJ[si],'#'
	je kraj
	mov bl, BROJ[si]
	sub bl,30;u bl je cifra
	
	mov cx,8
	mov dl,1
	xor al,al
petljica:
	and bl,dl; jedinice izdvajamo
	add al,bl; dodajemo na mesto jedinica
	rol al, 1;zarotiraj za jedno mesto 
	shl dl,1; pomerno masku ulevo
	loop petljica;u al je cifra smestena
	
	inc si
	
	cmp BROJ[si],'#'
	jne petlja
	
	
	kraj:
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
