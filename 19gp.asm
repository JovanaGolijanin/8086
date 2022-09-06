name 19zad
extrn min_max:far
data segment
	NIZ db 1,2,3,4,5,6,7,0;7 elemenata
	min db ? 
	max db ?
	BR1 db '1','0','7','4',0
	BR2 db '1601',0
	REZ db ?
	
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
	
	mov cx,2
petlja:
	;slanje ulaznih parametara
	cmp cx,1
	je prvi
	cmp cx,2
	je drugi
	prvi:
	lea ax, BR1
	jmp nastavi
	drugi:
	lea ax, BR2
	nastavi:
	push ax
	mov al, 0FFh;min
	xor ah,ah
	push ax
	mov al, 0;max
	xor ah,ah
	push ax
	lea ax, min
	push ax
	lea ax, max
	push ax
	;poziv
	call min_max
	;preuzimanje izlaznih parametara
	
	mov al, min
	mov ah, max
	cmp al, '0'
	jl nije_oktalni
	cmp ah, '7'
	ja nije_oktalni
	jmp kraj
	nije_oktalni:
	mov REZ, 0FFh
	kraj:
	loop petlja
	
	cmp REZ, 0FFh
	je gotovo
	
	mov si,0
	mov di,0
	mov bl,BR1[si];max
	mov REZ, 1
petljica:
	
	cmp BR1[si],0
	jz petljicaK
	cmp BR2[di],0
	jz petljicaK

	mov al, BR1[si]
	mov ah, BR2[di]
	cmp ah,al
	jl manji
	mov bl,ah
	mov REZ, 2
	manji:
	inc si
	inc di
	jmp petljica

	petljicaK:
	
	cmp REZ, 1
	je gotovo
	cmp REZ, 2
	je gotovo
	mov REZ, 0
	
	gotovo:

	mov ah, 4ch
	int 21h
	
code ends
end ut
