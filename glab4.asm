name glab4
public n,m, niz, mat, sum
extrn fja:far
podaci segment
	mat db 1, 2, 3
		db 4, 5, 6
		db 7, 8, 9
	niz db 3, 3, 3
	n dw 3
	m dw 3
	sum dw 0, 0, 0
		dw 0, 0, 0
		dw 0, 0, 0
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
	push m
	lea ax, mat
	push ax
	lea ax, niz
	push ax
	lea ax, sum
	push ax
	;8
	call fja
	;9 preuzimanje izlaznih parametara
	
	
mov ah,4ch
int 21h

program ends
end ut