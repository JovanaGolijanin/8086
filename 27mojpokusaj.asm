name 27zad
data segment
	NIZ1 db 37h,5fh
	NIZ2 db 10h,5fh
	BR1 db 0
	BR2 db 0
	RAZLIKA dd ?
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	xor si,si
	
	;maska 11110000 za prvu poziciju u bajtu
	mov bl, 0f0h
	;maska 00001111 za drugu poziciju u bajtu
	mov dl, 0fh
	
	xor cl,cl
petlja:
	;prva pozicija
	mov al, byte ptr NIZ1[si]
	and al, bl; postavljamo bitove 
	cmp al, bl; proveravamo da li su jedinice na kraju ostale
	je kraj
	inc cl
	
	;druga pozicija
	mov al, byte ptr NIZ1[si]
	and al, dl; postavljamo bitove 
	cmp al, dl; proveravamo da li su jedinice na kraju ostale
	je kraj
	inc cl
	
	inc si
	jmp petlja
	
	kraj:
	mov BR1, cl ;cuvam br elemenata prvog niza
	
	xor si,si
	xor cl,cl
	
petlja2:
	;prva pozicija
	mov al, byte ptr NIZ2[si]
	and al, bl; postavljamo bitove 
	cmp al, bl; proveravamo da li su jedinice na kraju ostale
	je kraj
	inc cl
	
	;druga pozicija
	mov al, byte ptr NIZ2[si]
	and al, dl; postavljamo bitove 
	cmp al, dl; proveravamo da li su jedinice na kraju ostale
	je kraj2
	inc cl
	
	inc si
	jmp petlja2
	
	kraj2:
	mov BR2, cl ;cuvam br elemenata prvog niza

	xor di,di; nizi deo sume
	xor bp,bp; visi deo sume
	xor si,si; kretanje kroz niz
	xor bx,bx; cifra
	
prvi:
	mov ax,10
	mul di; dx:ax je suma
	mov di,ax
	mov bp,dx

	;s+=cifra
	add di, bx
	adc bp,0
	
	;sledeca cifra 
	
	;prva pozicija
	parni:
	mov bl, byte ptr NIZ1[si]
	and bl, 0f0h; postavljamo bitove 
	cmp bl, 0f0h; proveravamo da li su jedinice na kraju ostale
	je gotovo1
	shr bl,1
	shr bl,1
	shr bl,1
	shr bl,1
	xor bh,bh
	
	;s+=cifra
	add di, bx
	adc bp,0
	

	;druga pozicija
	neparni:
	mov bl, byte ptr NIZ1[si]
	and bl, 0fh; postavljamo bitove 
	cmp bl, 0fh; proveravamo da li su jedinice na kraju ostale
	je gotovo1
	
	
	inc si
	jmp prvi
	
	gotovo1:
	mov word ptr RAZLIKA, di
	mov word ptr RAZLIKA+2, bp
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
