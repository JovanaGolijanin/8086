name zad1
data segment
	podatak1 dw 1
	podatak2 dw 2
	rezultat dw 0
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	mov ax, podatak1
	add ax, podatak2

	mov rezultat, ax

	mov ah,4ch
	int 21h
code ends
end start