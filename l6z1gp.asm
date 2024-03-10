extrn konvertuj:far
name lab6zad1
data segment
	BR1 db '2','7','8','4'
	BR2 db '3','5','4','1'
	rez1 dw ?
	rez2 dw ?
	rez dw ?
data ends
stack segment
	bos dw 200 dup(?)
	tos label word
stack ends
code segment
	assume cs:code, ds:data, ss:stack
ut:
	mov ax,data
	mov ds,ax
	mov ax, stack
	mov ss,ax
	lea sp,tos
	
	lea ax, rez1
	push ax
	lea ax, BR1
	push ax;
	mov ax, 4
	push ax
	
	
	call konvertuj
	
	cmp ax, 0
	jne kraj
	
	lea ax, rez2
	push ax
	lea ax, BR2
	push ax;
	mov ax, 4
	push ax

	
	call konvertuj
	
	cmp ax, 0
	jne kraj
	
	mov ax, word ptr rez1
	add ax, word ptr rez2
	
	mov word ptr rez, ax
	
	kraj:
	;nije broj

	 mov ah,4ch
	 int 21h
	
code ends
end ut