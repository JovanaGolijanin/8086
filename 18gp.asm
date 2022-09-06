name 18zad
extrn sumPozit:far
extrn sumParnih:far
data segment
	NIZ dw -2,7,4,9,-6,2,8,0 ;7
	REZ dd 0
	sumPar dd 0
	sumPoz dd 0
	N dw 0
data ends
stek segment 
	dw 200 dup(?)
	iza label word
stek ends
code segment
	assume cs:code, ds: data, ss:stek
ut:
	mov ax, data
	mov ds, ax
	mov ax, stek
	mov ss, ax
	lea sp, iza
	
	;broj elemenata
	mov ax,0; racunam N
	lea bx, NIZ
	mov bp,0
petlja:
	cmp [bx], bp
	je kraj
	inc ax
	add bx,2
	jmp petlja
	
	kraj:
	mov N, ax
	
	;slanje ulaznih
	lea ax,NIZ
	push ax
	lea ax, sumPoz
	push ax
	lea ax, sumPoz+2
	push ax
	push N
	;poziv
	call sumPozit
	;preuzimanje izlaznih
	
	;slanje ulaznih
	lea ax,NIZ
	push ax
	lea ax, sumPar
	push ax
	lea ax, sumPar+2
	push ax
	push N
	;poziv
	call sumParnih
	;preuzimanje izlaznih
	
		
	;REZ=sumPozit-sumPar
	mov ax, word ptr sumPoz
	mov dx, word ptr sumPoz+2
	mov si, word ptr sumPar
	mov di, word ptr sumPar+2
	sub ax,si
	sbb dx,di
	;sub dx,di -> ovo ne treba
	mov word ptr REZ, ax
	mov word ptr REZ+2, dx
	
	

	mov ah, 4ch
	int 21h
	
code ends
end ut
