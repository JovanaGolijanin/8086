name 30zad
data segment
	NIZ1 db 1,2,3,8,8,8,4,5,6,7,8,8,8,9,10
	DUZ1 db 15
	NIZ2 db 8,8,8
	DUZ2 db 3
	BROJ db 0
	pom dw 0
data ends

code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax

	
	;xor bh, bh; indikator da li je nadjen = 0
	mov bp, -1; pozicija
	
	mov cl, DUZ1
	sub cl, DUZ2;u cl je broj prolazaka
	
	mov ch, 1;dobro
	xor si,si; 1 niz
	xor di,di; 2 niz
	mov dl, DUZ1
	xor dh,dh
spoljnja:
	mov ch,1
	
	mov al, DUZ2
	xor di,di
	unutrasnja:
	mov ah, byte ptr NIZ2[di]
	add si,di
	cmp byte ptr NIZ1[si],ah
	jne presk
	jmp isti
	presk:
	mov ch,0
	isti:
	sub si,di
	inc di
	dec al
	cmp al,0
	ja unutrasnja
	
	cmp ch,1
	jne ispod
	mov bp, si
	;mov bh,1
	inc BROJ
	
	mov NIZ1[si], '*'
	sub dl, DUZ2
	pet:
	mov bh, NIZ1[si+3]; treba DUZ2
	mov NIZ1[si+1], bh
	inc si
	cmp si, dx
	jnae pet
	
	mov si,bp
	ispod:
	inc si
	dec cl
	cmp cl,0
	ja spoljnja

	mov ah, 4ch
	int 21h
	
code ends
end ut
