name 27mnoz
data segment
	BR dd 3756
data ends
code segment
	assume cs:code, ds: data
ut:
	mov ax, data
	mov ds, ax

	mov di, 10

	mov ax, word ptr BR 
	mov cx, word ptr BR+2
	
	mov si,5
	
petlja:
	mul di;dx:ax je ax*10
	mov bp, ax; cuvam 
	mov ax,cx; sad cx mnozim
	mov cx, dx; visi deo pomnozenog
	
	;cx:bp je ax*10
	mul di; dx:ax je cx*10
	add cx, ax 
	mov ax, bp
	;cx,ax je novi
	
	;inc ax
	;adc cx,0
	
	dec si
	cmp si,0
	ja petlja
	
	
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
