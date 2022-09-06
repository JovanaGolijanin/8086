name 35zad
data segment
	NIZ1 db '1','2','3','4',00h
	NIZ2 db '4','5','6','7',00h
	NIZ3 db ?
data ends
code segment
	assume cs:code, ds: data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax

	xor si,si
	xor dl,dl;dl cuva br elemenata prvog niza
	
petlja:
	cmp byte ptr NIZ1[si],00h
	je kraj
	inc dl
	mov dh, byte ptr NIZ1[si]
	mov byte ptr NIZ3[si], dh
	inc si
	
	jmp petlja
	kraj:
	
	xor si,si
	xor dh,dh;;dh cuva br elemenata drugog niza
	
	petlja2:
	cmp byte ptr NIZ2[si],00h
	je kraj2
	inc dh
	inc si
	
	jmp petlja2
	kraj2:
	
	
	xor si,si
	xor dh,dh; u dx je br elemenata 1. i 3. niza (trenutno)
	mov cx, dx; projac petlje za prolazak kroz 1. niz
	mov bx, dx; kroz 3. niz
petljica:
	cmp byte ptr NIZ2[si], 00h
	je gotovo
	mov bp,0;indikator da ga nema u nizu 1

	mov ah, byte ptr NIZ2[si]
	mov cx,dx
	;xor si,si
	xor di,di;prolazak kroz drugi niz
pom:
	cmp byte ptr NIZ1[di], ah
	je indikator
	jne sledeci
	indikator:
	mov bp,1
	sledeci:
	inc di
	loop pom
	
	cmp bp, 1
	je sledeci2
	
	mov ah, byte ptr NIZ2[si]
	mov byte ptr NIZ3[bx], ah
	inc bx
	
	sledeci2:
	inc si
	
	jmp petljica
	gotovo:
	
	mov NIZ3[bx], 00h
	
	lea di, NIZ1
	lea si, NIZ3
	mov cx, bx
premesti:
	lodsb
	stosb
	loop premesti

	mov ah, 4ch
	int 21h
	
code ends
end ut
