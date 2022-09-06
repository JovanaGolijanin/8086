name 48zad
data segment
	NIZ dd 011111111h, 022222222h,033333333h,022222222h, 0ffffffffh
	nizi1 dw 0
	visi1 dw 0
	nizi2 dw 0
	visi2 dw 0
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax
	
	xor si,si
	xor cx,cx
petlja:
	cmp word ptr NIZ[si],0ffffh
	jne dalje
	cmp word ptr NIZ[si+2],0ffffh
	jne dalje
	jmp kraj
	dalje:
	add si,4
	inc cx;broj elemenata niza
	jmp petlja
	
	kraj:
	
	
spoljnja:
	mov bx,cx
	xor si,si
	mov di,2
unutrasnja:
	cmp word ptr NIZ[si+4],0ffffh
	jne nije
	cmp word ptr NIZ[si+6],0ffffh
	jne nije
	
	jmp gotovo
	
	nije:

	mov dx, word ptr NIZ[si+4]
	cmp word ptr NIZ[si], dx
	jl zamena

	niza:
	mov dx, word ptr NIZ[di+4]
	cmp word ptr NIZ[di], dx
	jae nastavi
	
	zamena:
	mov dx, word ptr NIZ[di]
	mov nizi1, dx
	
	mov dx, word ptr NIZ[si]
	mov visi1, dx
	
	;drugi u prvi
	
	mov dx, word ptr NIZ[si+4]
	mov visi2, dx
	
	mov dx, visi2
	mov word ptr NIZ[si], dx
	
	mov dx, word ptr NIZ[di+4]
	mov nizi2, dx
	
	mov dx, nizi2
	mov word ptr NIZ[di], dx
	
	;iz prvog u drugi
	mov dx,visi1
	mov word ptr NIZ[si+4], dx
	
	mov dx, nizi1
	mov word ptr NIZ[di+4], dx
	
	
	nastavi:
	add si,4
	add di,4
	
	loop unutrasnja
	
	gotovo:
	mov cx,bx
	loop spoljnja
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
