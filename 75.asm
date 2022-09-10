name 75zad
 
data    segment
    A db 1,2,2, 2,4,3, 3,3,4, 00h
    B db 1,1,4, 1,4,5, 2,4,7, 00h
;   N db 3
;   M db 4
    CC db 37 dup (?)
data    ends
 
code    segment
assume  cs:code,ds:data,es:data
start:  mov ax,data
    mov ds,ax
    mov es,ax
 
    lea si, A   ; si i bp ce ukazivati na A i B, menjace se medjusobno
    lea bp, B
    lea di, CC
   
   
    cld  ; DF=0, autoinkrementiranje
   
citaAiB:    ; ucita se element iz A
    lodsw   ; procita i i j
    cmp al, 0 ; da nismo stigli do kraja A?
    je kopiraB
    mov cx, ax  ; cl=i(A), ch=j(A)
    lodsb
    mov bl, al  ; bl=A(i,j)
 
   
citaB:  ; ucita se element iz B
    xchg si, bp ; SI sad ukazuje na B
    lodsw
    cmp al,0    ; da nismo stigli do kraja B?
    je kopiraA
    mov dx, ax  ; dl=i(B), dh=j(B)
    lodsb
    mov bh, al  ; bh=B(i,j)
    xchg si, bp ; SI ponovo ukazuje na A
   
poredi: cmp cl, dl  ;i(A)?i(B)
    jb prvoA    ; treba upisati element iz A
    ja prvoB    ; upisati element iz B
    ;inace je i(A)=i(B)
    cmp ch, dh  ; j(A)? j(B)
    jb prvoA
    ja prvoB
    ; inace je i j(A)=j(B)     
    ; dakle, elementi su na istoj poziciji, saberi ih
    ; i upisi u C ako je zbir razlicit od nule
    add bl, bh
    jz dalje ; ako je zbir nula, ne upisuje se taj elemenat
    mov ax, cx
    stosw
    mov al, bl
    stosb
   
dalje:  jmp citaAiB
   
prvoA:  ; upisujemo tekuci element iz matrice A i citamo sledeci iz A
    mov ax, cx
    stosw
    mov al, bl
    stosb
    ; sad ucitamo sledeci element iz A
    lodsw
    cmp al, 0
    je kopiraB
    mov cx, ax
    lodsb
    mov bl, al
    jmp poredi
   
prvoB:  ; upisujemo tekuci element iz matrice B
    mov ax, dx
    stosw
    mov al, bh
    stosb
    jmp citaB
   
kopiraA: ; B je kraj, tekuci A je u registrima, SI na A
    mov ax, cx
    stosw
    mov al, bl
    stosb
    jmp kopira
 
kopiraB: ; A je kraj, tekuci B je u registrima, SI na B
    mov ax, dx
    stosw
    mov al, bh
    stosb
 
kopira: ; prekopiraju se preostali elementi preostale matrice.
    xchg si, bp
petlja: lodsb   ; ucita i
    cmp al, 0
    je kraj
    stosb   ; i
    movsw   ; kopira j i vrednost
    jmp petlja
kraj:   xor al, al
    stosb   ; nula na kraj matrice C
   
 
    mov ah,4Ch
    int 21h
code    ends
end start