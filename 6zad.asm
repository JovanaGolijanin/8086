name 6zad
podaci segment
	N dw 5
	REZ dw ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	xor si, si ; nizi deo sume
	xor di, di ; visi deo sume
	
	mov cx, N
	sub cx,2 ; cx=N-2
	mov bx, N ; brojac
	xor dx,dx; da ne utice na deljenje
petlja:
	mov ax, bx ;N
	dec ax ;N-1
	div bx ; ax = (N-1)/N, ostata dx
	mov bp, ax ;bp = (N-1)/N
	mov ax, bx
	sub ax, 2 ;ax=N-2
	mul bp ; dx:ax = (N-2)*(N-1)/N
	
	add si, ax
	adc di, 0
	
	dec bx
	loop petlja
	
	mov ax, N
	mul N
	mov bx, ax ;N*N
	mov ax, si
	mov dx, di
	div bx ;ax rez a ostatak je u dx
	

	mov REZ, ax
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
