name 46zad
data segment
	NIZ dw 2,1,4,3,6,5,7
	N db 7
data ends
code segment
	assume cs:code, ds:data, es:data
ut:
	mov ax, data
	mov ds, ax
	mov es, ax
	
	mov al,N
	xor ah,ah
	mov cx,ax
	test ax, 1
	jz paran
	dec cx
	paran:
	shr cx,1

	xor si,si
	xor di,di
petlja:
	cld
	lodsw;ax<-NIZ[si];si++
	mov bx,ax; cuvamo privremeno prvi
	lodsw;ax<-NIZ[si];si++
	mov dx,ax;cuvamo privremeno drugi
	mov bp,si;cuvamo za naredni prolazak
	mov di, si
	sub di,2;vrati indeks na mesto drugog
	mov ax, bx;prvi
	std
	stosw ;NIZ[di]<-ax ;di--
	mov ax,dx;drugi
	stosw;NIZ[di]<-ax ;di--
	
	loop petlja

	
	mov ah, 4ch
	int 21h
	
code ends
end ut
