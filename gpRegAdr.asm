public n,niz, suma
extrn fja:far
podaci segment
	niz dw 2,5,7,38,224
	n dw 5
	suma dw ?
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
	mov cx,n
	lea si, niz
	lea bx, offset suma
	;8
	call fja
	;9 preuzimanje izlaznih parametara

mov ah,4ch
int 21h

program ends
end ut