extrn rotacija:far
name 54zad
data segment
	NIZ1 db 4, 2, 080h, 080h, 080h, 080h;2
	NIZ2 db 4, 3, 001h, 001h, 001h, 001h;4
	ADRS dw 0,6,0FFFFh
data ends
stack segment 
	bos dw 200 dup(?)
	tos label word
stack ends 
code segment
	assume cs:code, ds:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov ax, stack
	mov ss, ax
	
	xor si,si
petlja:
	cmp ADRS[si], 0FFFFh
	je kraj
	
	;slanje ulaznih parametara
	mov di, ADRS[si]
	mov al, byte ptr [di]
	xor ah,ah
	mov cl, byte ptr [di+1]; za koliko mesta se rotira
	xor ch,ch
	add di,2
rotiraj:
	push di; pocetna adresa niza
	push ax; broj elemenata niza
	;poziv
	call rotacija
	loop rotiraj
	;preuzimanje ulaznih parametara
	add si,2
	jmp petlja
	
	kraj:
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut