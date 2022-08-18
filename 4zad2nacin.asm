name 4zad2nacin
podaci segment
	N db 10
	pom dw 0
	pom2 dw 0
	REZ db ?
	OST db ?
podaci ends
program segment
	assume cs:program, ds:podaci
ut:
	mov ax, podaci
	mov ds, ax
	
	xor si, si ;si=0
	xor cx, cx
	mov cl, N
	shr cx,1 ; cx=N/2
	dec cx ; cx = (N/2)-1
	
	xor dx,dx
	xor bx,bx
	mov bl,N ;bx=N 
petlja:
	mov dl,bl ;dl=N 
	sub dl,2 ;dl=N-2 
	mov al, bl 
	mul dl ;ax=(N-2)*N 
	mov di, ax ;di=(N-2)*N
	
	mov dl, bl ;dl=N 
	sub dl,3; dl=N-3
	mov al, bl
	dec al; al=N-1 
	mul bl ;ax=(N-3)*(N-1)
	mov bp, ax ;bp=(N-3)*(N-1)
	
	mov ax,di
	div bp ;dx:ax = ((N-2)*N) / ((N-3)*(N-1))
	
	add si, ax
	sub bx,2
	loop petlja
	
	
	mov ax, si
	div N
	mov REZ, al
	mov OST, ah
	
	mov ah, 4ch
	int 21h
	
program ends
end ut
	