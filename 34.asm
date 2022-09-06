name 34zad
data segment
	NIZ1 db '1','2','3','4','5','6','#'
	NIZ2 db '4','5','6','7','8','9','#'
	NIZ3 db ?
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax

	xor si,si
	xor dx,dx;dl cuva br elemenata prvog niza
	
petlja:
	cmp byte ptr NIZ1[si],'#'
	je kraj
	inc dl
	mov dh, byte ptr NIZ1[si]
	mov byte ptr NIZ3[si], dh
	inc si
	
	jmp petlja
	kraj:
	
	xor si,si
	mov bl,dl
	xor bh,bh; u bx je br elemenata 1. i 3. niza (trenutno)
	mov cx, bx; projac petlje za prolazak kroz 1. niz
petljica:
	cmp byte ptr NIZ2[si], '#'
	je gotovo
	mov bp,0;indikator da ga nema u nizu 1
	mov ax, si;cuva si
	mov dh, byte ptr NIZ2[si]
	mov cx,bx
	xor si,si
pom:
	cmp byte ptr NIZ1[si], dh
	je indikator
	jne sledeci
	indikator:
	mov bp,1
	sledeci:
	inc si
	loop pom
	
	mov si,ax
	
	cmp bp, 1
	je sledeci2
	
	mov dh, byte ptr NIZ2[si]
	mov byte ptr NIZ3[bx], dh
	inc bx
	
	sledeci2:
	mov si,ax
	inc si
	;xor di,di
	
	jmp petljica
	gotovo:
	
	mov NIZ3[bx], '#'

	mov ah, 4ch
	int 21h
	
code ends
end ut
