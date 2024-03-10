.586
.model flat,c
extrn izraz:far
name 3jun222gp
data segment
	A dd 1,2,3,4,5
	N dd 5
	B dd 10 dup(?)
data ends
stack segment
	bos dw 200 dup(?)
	tos label word
stack ends
code segment 
	assume cs:code, ds:data, es:data, ss:stack
ut:
	mov ax, data
	mov ds, ax
	mov es,ax
	mov ax,stack
	mov ss, ax
	lea sp, tos
	
	mov ecx,N
	lea esi,B;kroz B
	lea edi,A;kroz A
petlja:
	;slanje ulaznih parametara
	
	;donja:
	lea ebx,A
	cmp edi,ebx
	jl nijeD
	jae okejD
	nijeD:
	xor eax,eax
	push eax
	jmp sledeci
	okejD:
	
	;gornja:
	lea ebx,A
	add ebx, N
	cmp edi,ebx
	ja nijeG
	jle okejG
	nijeG: 
	xor eax,eax
	push eax
	jmp sledeci
	
	okejG:; A[i]
	mov eax, A[edi]
	push eax
	
	sledeci:
	
	;donja:
	lea ebx,A
	inc edi;i+1
	cmp edi,ebx
	jl nijeD1
	jae okejD1
	nijeD1:
	xor eax,eax
	push eax
	jmp prethodni
	okejD1:
	
	;gornja:
	lea ebx,A
	add ebx, N
	cmp edi,ebx
	ja nijeG1
	jle okejG1
	nijeG1: 
	xor eax,eax
	push eax
	jmp prethodni
	
	okejG1:
	dec edi;trenutni edi
	mov eax, A[edi+1]
	push eax
	
	
	prethodni:
	
	;donja:
	lea ebx,A
	dec edi;i-1
	cmp edi,ebx
	jl nijeD2
	jae okejD2
	nijeD2:
	xor eax,eax
	push eax
	jmp dalje
	okejD2:
	
	;gornja:
	lea ebx,A
	add ebx, N
	cmp edi,ebx
	ja nijeG2
	jle okejG2
	nijeG2: 
	xor eax,eax
	push eax
	jmp dalje
	
	okejG2:
	inc edi;trenutni edi	
	mov eax, A[edi-1]
	push eax
	
	dalje:
	;poziv
	call izraz
	;preuzimanje izlaznih parametara
	pop eax
	mov B[esi],eax
	
	add esi,4
	add edi,4
	
	dec ecx
	cmp ecx,0
	ja petlja
	;loop petlja
	


	mov ah,4ch
	int 21h
code ends
end ut
