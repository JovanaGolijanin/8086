name 22zad
data segment
	NIZ dd -2,3,-4,6,6,-7,-7
	NIZ2 dd 0,0
	PROIZVOD dd 4 dup(0)
	N db 7
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	
	;MINIMALNI
	mov cl,N
	xor ch,ch
	
	lea si, NIZ
	mov di,si
	add di,2;kretanje po nizu
	
	mov ax, word ptr NIZ[si]
	mov dx, word ptr NIZ[di];prvi je minimalan
petlja:
	cmp word ptr NIZ[si],ax
	jl manji
	cmp word ptr NIZ[di],dx
	jl manji
	jnl dalje
	manji:
	mov ax, word ptr NIZ[si]
	mov dx, word ptr NIZ[di]
	dalje:
	add si,4
	add di,4
	
	loop petlja
	mov word ptr NIZ2, ax
	mov word ptr NIZ2+2, dx; 
	
	;MAXIMALNI
	mov cl,N
	xor ch,ch
	
	lea si, NIZ
	mov di,si
	add di,2;kretanje po nizu
	
	mov ax, word ptr NIZ[si]
	mov dx, word ptr NIZ[di];prvi je max
petlja2:
	cmp word ptr NIZ[si],ax
	jg veci
	cmp word ptr NIZ[di],dx
	jg veci
	jng dalje2
	veci:
	mov ax, word ptr NIZ[si]
	mov dx, word ptr NIZ[di]
	dalje2:
	add si,4
	add di,4
	
	loop petlja2
	
	mov word ptr NIZ2+4, ax
	mov word ptr NIZ2+6, dx
	
	;PROIZVOD
	;ne valja jer mora da se dekomplementira a moze i lakse
	
	;L*L
	mov al, byte ptr NIZ2+3
	mov ah, byte ptr NIZ2+2
	mov bl, byte ptr NIZ2+7
	mov bh, byte ptr NIZ2+6
	imul bx;dx:ax
	
	add word ptr PROIZVOD, ax
	add word ptr PROIZVOD+1, dx
	
	;H*L
	mov al, byte ptr NIZ2+1
	mov ah, byte ptr NIZ2
	mov bl, byte ptr NIZ2+7
	mov bh, byte ptr NIZ2+6
	imul bx;dx:ax
	
	add word ptr PROIZVOD+2, ax
	adc word ptr PROIZVOD+3, 0
	add word ptr PROIZVOD+3, dx
	adc word ptr PROIZVOD+4, 0

	
	;L*H
	mov al, byte ptr NIZ2+3
	mov ah, byte ptr NIZ2+2
	mov bl, byte ptr NIZ2+5
	mov bh, byte ptr NIZ2+4
	imul bx;dx:ax
	
	add word ptr PROIZVOD+2, ax
	adc word ptr PROIZVOD+3, 0
	add word ptr PROIZVOD+3, dx
	adc word ptr PROIZVOD+4, 0


	
	;H*H
	mov al, byte ptr NIZ2+1
	mov ah, byte ptr NIZ2
	mov bl, byte ptr NIZ2+5
	mov bh, byte ptr NIZ2+4
	imul bx;dx:ax
	
	add word ptr PROIZVOD+4, ax
	adc word ptr PROIZVOD+5, 0
	add word ptr PROIZVOD+5, dx
	adc word ptr PROIZVOD+6, 0
	adc word ptr PROIZVOD+7, 0
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
