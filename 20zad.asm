name 20zad
extrn suma:far
data segment
	NIZ dw 1,2,3,4,0ffffh
	SUM dw 0;10
	N db 0
	;kraj dw 0ffffh
data ends
stek segment 
	dw 200 dup(?)
	iza label word
stek ends
code segment
	assume cs:code, ds: data, ss:stek, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax
	mov ax, stek
	mov ss, ax
	lea sp, iza
	
	xor si,si
	xor al,al
petlja:
	cmp NIZ[si], 0FFFFh
	je kraj
	inc al
	add si,2
	jmp petlja
	kraj:
	mov N,al
	
	; cld
	
	; mov cx,0ffffh; broj elemenata
	; lea si, kraj; kraj niza
	; lea di, NIZ
	; repe cmpsw
	; sub ax,cx; u ax je NIZ
	; dec ax
	; mov N, al
	
	;prenos ulaznih parametara
	lea ax,NIZ
	push ax
	lea ax,SUM
	push ax
	mov al,N
	xor ah,ah
	push ax
	;poziv
	call suma
	;preuzimanje parametara
	pop SUM

	mov ah, 4ch
	int 21h
	
code ends
end ut
