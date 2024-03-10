.586
.model flat,c
public izraz
procedura segment
izraz proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	push ebx
	mov ebp,esp
	pushf
	push eax 
	push ebx
	push ecx
	push edx
	
	
	;preuzimanje ulaznih parametara
	mov eax, [ebp+16]
	mov ebx, [ebp+12]
	mov ecx, [ebp+8]
	
	;telo
	xor edx,edx;prenos za sumu
	add eax,ebx;X+Y
	adc edx,0;edx:eax = X+Y
	sub eax,ecx
	sbb edx,0
	
	;slanje izlaznih parametara
	;u eax
	;obnova konteksta procesora
	pop edx
	pop ecx
	pop ebx
	pop eax
	popf
	pop ebp

	;povratak
	ret 
izraz endp
procedura ends
end

