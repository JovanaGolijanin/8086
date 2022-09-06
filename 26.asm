name 26zad
data segment
	BR1 db 0,2,7,4,3,1;nepakovan
	;BR2 db 0,0,0
	N db 6
	M db 3
data ends
data2 segment
	BR2 db 0,0,0
data2 ends
code segment
	assume cs:code, ds: data, es:data2
ut:
	mov ax, data
	mov ds, ax
	mov ax, data2
	mov es, ax
	
	;jasno je da je M=N/2
	mov al,N
	shr al,1;N/2
	mov M,al
	
	mov al, N
	xor ah,ah
	dec ax
	mov si, ax
	
	xor di,di
	
	mov cl,N
	xor ch,ch; proj prolazaka
	dec cx

petlja:
	std
	lodsb; u al je prvi od pozadi
	
	;prvi je ok
	mov dl,al; u dl je prvi
	dec cx
	;drugi shift
	lodsb
	
	mov bl,al
	mov bp,4
	pom:
	shl bl, 1
	dec bp
	cmp bp,0
	ja pom
	
	dec cx
	;sabiram dva susedna
	add dl, bl
	mov al,dl
	
	cld
	;smestam u novi niz
	stosb
	
	cmp cx,0
	jge petlja
	
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
