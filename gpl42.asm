name gpl42
public n,niz, brpon
extrn fja:far
podaci segment
	niz dw 3, 4, 05bh, 8, 7, 05bh, 2, 05bh, 1, 4
	n dw 10
	brpon dw ?
podaci ends
stek segment
	dw 200 dup(?)
	dno label word
stek ends
program segment
	assume cs:program, ds:podaci, ss:stek	
ut:
	mov ax, podaci
	mov ds, ax
	mov ax, stek
	mov ss, ax
	lea sp, dno
	 
	;7 slanje ulaznih parametara
	push n
	lea ax, niz
	push ax
	;8
	call fja
	;9 preuzimanje izlaznih parametara
	mov brpon, ax
	
mov ah,4ch
int 21h

program ends
end ut