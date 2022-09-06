name 49zad
data segment
	NIZ dd 033333333h,022222222h,011111111h,022222222h
	ADRS  dw 0,4,8,0Ch
	duz db 4
data ends
code segment
	assume cs:code, ds:data
ut:
	mov ax, data
	mov ds, ax
	
	mov cl, duz
	xor ch,ch; cx je duzina niza
	dec cx
	
	
spoljnja:
	mov dx,cx
	xor di,di
	mov bx, word ptr ADRS[di]
unutrasnja:
	mov si, bx
	add si,6
	mov ax, word ptr [si]
	mov si, bx
	add si,2
	cmp word ptr [si], ax
	ja zamena
	
	nije:
	mov si, bx
	add si,4
	mov ax, word ptr [si]
	cmp word ptr [bx], ax
	jle dalje
	
	zamena:
	mov si, bx
	add si,2
	mov ax, word ptr [si];visi1
	mov si, bx
	add si,6
	xchg ax, word ptr [si];visi1 je u ax
	sub si,4
	mov word ptr [si],ax
	
	mov ax, [bx];u ax je nizi1
	mov si, bx
	add si,4;nizi2
	xchg ax, word ptr [si];nizi2 je u ax
	sub si,4
	mov word ptr [si],ax
	
	dalje:
	add bx,4
	
	loop unutrasnja
	
	gotovo:
	mov cx,dx
	loop spoljnja
	
	
	mov ah, 4ch
	int 21h
	
code ends
end ut
