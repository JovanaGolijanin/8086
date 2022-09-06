extrn parnost:far
name 52zad
data segment
	NIZ db 'Jovanakr'
	BAJT db ?;41h
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
	
	xor bx,bx; bh za testiranje parnosti
			; bl za BROJ
	mov bh,1
	lea si,NIZ
	mov cx,7
petlja:
	;slanje ulaznih parametara
	push si

	;poziv
	call parnost
	
	;preuzimanje ulaznih parametara
	;u ah
	and bh,ah
	jnz saberi
	
	rol bl, 1
	jmp dalje
	
	saberi:
	add bl,1
	rol bl,1; pomeri ulevo taj bit
	
	dalje:
	inc si
	
	mov bh,1
	loop petlja
	
	inc si
	;slanje ulaznih parametara
	push si

	;poziv
	call parnost
	
	;preuzimanje ulaznih parametara
	;u ah
	
	and bh,ah
	jnz saberi2
	jmp kraj
	
	saberi2:
	add bl,1

	
	kraj:
	mov BAJT, bl
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
