procedura segment
karakter proc far
	assume cs:procedura
	
	;cuvanje konteksta procesora
	pushf
	
	;preuzimane ulaznih parametara
	
	;telo
	cmp byte ptr [si], 'a'
	jne e
	mov dl,1
	jmp kraj
	e:
	cmp byte ptr [si], 'e'
	jne i
	mov dl,1
	jmp kraj
	i:
	cmp byte ptr [si], 'i'
	jne o
	mov dl,1
	jmp kraj
	o:
	cmp byte ptr [si], 'o'
	jne u
	mov dl,1
	jmp kraj
	u:
	cmp byte ptr [si], 'u'
	jne suglasnik
	mov dl,1
	jmp kraj
	
	suglasnik:
	mov dl,0
	
	kraj:
	
	;slanje izlaznih parametara
	
	;obnova konteksta parametara
	popf
	
	;povratak
	ret
karakter endp	
procedura ends
end
