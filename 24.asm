name 24zad
data segment
	ASCII db '0','5','4','1','#'
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax
	
	xor si,si;kretanje kroz broj
	dec si
	xor ax,ax;suma cifara
petlja:
	inc si
	cmp byte ptr ASCII[si],'#'
	je kraj
	mov bl, byte ptr ASCII[si]
	sub bl,'0';dekadna cifra
	add al,bl
	adc ah,0
	cmp byte ptr ASCII[si],'#'
	jne petlja
	;u ax je suma cifara
	
	kraj:
	xor si,si
	mov cl,3
	div cl
	cmp ah,0
	je gotovo; deljiv je sa 3
	mov dl, byte ptr ASCII[si]
	sub dl,'0'; tu je poslednja cifra
	cmp dl,ah
	jl obe; ako je poslednja cifra manja od ostataka
	sub dl, ah
	add dl, '0'
	mov byte ptr ASCII[si], dl;vracam nazad br deljiv sa 3
	jmp gotovo
	
	obe:
	mov bl, byte ptr ASCII[si]
	sub bl,'0'
	inc si
	mov bh, byte ptr ASCII[si]
	sub bh,'0'
	mov cl,ah;cuvam ostatak
	mov al, 10
	mul bh; ax je broj od kojega oduzimamo ostatak
	xor ch,ch
	sub ax,cx; u ax su poslednje dve cifre broja koji je deljiv sa 3
	;nevalja ovo 
	mov bl,0
	rcr al,1
	adc bl
	adc 
	add al,'0'
	add ah,'0'
	xor si,si
	mov byte ptr ASCII[si], al;vracam nazad br deljiv sa 3
	inc si
	mov byte ptr ASCII[si], ah;vracam nazad br deljiv sa 3
	
		
	gotovo:
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
