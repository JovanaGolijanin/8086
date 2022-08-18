name 9zad
podaci segment
	N dw 24
	REZ dw ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax

	mov ax, N
	mov cx, 7
	mul cx;dx:ax = 7*N
	mov cl,3
	shr ax,cl ;ax=(7*N)/8
	mov bx, N
	sub bx,ax
	mov bp, bx;R1
	
	mov ax,N
	mov cx,3
	mul cx
	mov cl,2
	shr ax,cl ;ax=(7*N)/8
	mov bx, N
	sub bx,ax; R2
	mov ax,N
	div bp
	xor dx,dx
	div bx
	
	mov REZ, ax

	mov ah, 4ch
	int 21h
	
program ends
end ut
