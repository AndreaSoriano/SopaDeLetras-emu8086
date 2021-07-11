include "emu8086.inc" 
org 100h

.model small
.data
 
linea           db  ?
palabra         db  "Ingrese una palabra encontrada o 0 para salir: $"   
msg             db  "Sopa de letras$","Ingrese una opcion: $","  1. Animales$","  2. Vehiculos de transporte$","  3. Lenguajes de programacion$"         
an              db  "Animales$","  1. Silvestres$","  2. Domesticos$"
tr              db  "Vehiculos de transporte$","  1. Terrestres$","  2. Acuaticos$"
le              db  "Lenguajes de programacion$","  1. Lenguajes 1$","  2. Lenguajes 2$"
animales1       db  "\src\animales1.txt",0
animales2       db  "\src\animales2.txt",0
vehiculos1      db  "\src\vehiculos1.txt",0
vehiculos2      db  "\src\vehiculos2.txt",0
lenguajes1      db  "\src\lenguajes1.txt",0
lenguajes2      db  "\src\lenguajes2.txt",0
handler         dw  ?
palabra1        db  0
palabra2        db  0
palabra3        db  0 
palabra4        db  0
palabra5        db  0 
fragmento       db  32 dup("$")
limpio          db  32 dup("$")
palabraI        db  100 dup("$")
palabraM        db  100 dup("$")
posAnimales1    db  0,4,10,14,22,32
listaAnimales1  db  "LEON","JIRAFA","MONO","ELEFANTE","HIPOPOTAMO",0
posAnimales2    db  0,4,9,15,22,29
listaAnimales2  db  "GATO","PERRO","CONEJO","OVEJA","CABALLO",0 
posVehiculos1   db  0,5,9,18,22,25
listaVehiculos1 db  "CARRO","MOTO","BICICLETA","TREN","BUS",0
posVehiculos2   db  0,7,11,18,22,31
listaVehiculos2 db  "CRUCERO","BOTE","VELERO","YATE","SUBMARINO",0
posLenguajes1   db  0,4,14,20,23,28
listaLenguajes1 db  "RUBY","JAVASCRIPT","PYTHON","PHP","COBOL",0
posLenguajes2   db  0,4,7,13,17,23
listaLenguajes2 db  "JAVA","SQL","PASCAL","PERL","SCHEME",0
 
.code  

abrir macro archivo, fragmento
    LOCAL leer, limpiar, fin
    inc linea
    mov ah, 3dh
    mov al, 0
    mov dx, offset archivo
    int 21h
    mov handler, ax

leer:
    mov ah, 3fh
    mov bx, handler
    mov dx, offset fragmento
    mov cx, 31
    int 21h
    cmp ax, 0
    jz fin 
    mostrar fragmento, linea

limpiar: 
    mov si, offset limpio
    mov di, offset fragmento
    mov cx, 31
    rep movsb
    jmp leer
    
fin:
    mov ah, 3eh
    mov bx, handler
    int 21h 
endm
    
mostrar macro var, x 
    mov ax, 0h
    GOTOXY 0, x 
    inc x   
    mov ah, 09h
    lea dx, var
    int 21h   
endm 

pedir_palabra macro lista_pos,lista_palabras
    LOCAL pedir_palabra1,pedir_palabra2,es_mayuscula,es_minuscula,comprobar_palabra,iguales,no_iguales,limpiar
    
pedir_palabra1:
    mostrar palabra, linea
    mov ah, 1
    xor si, si
    jmp pedir_palabra2

pedir_palabra2:
    int 21h 
    cmp al, 48
    jz salir
    cmp al, 13
    jz comprobar_palabra
    mov palabraI[si], al
    cmp al, 91
    jnb es_minuscula
    jb es_mayuscula
    
es_mayuscula: 
    mov palabraM[si], al
    inc si
    jmp pedir_palabra2
    
es_minuscula:
    sub al, 32
    mov palabraM[si], al
    inc si
    jmp pedir_palabra2 

comprobar_palabra: 
    xor si, si
    mov bh, 0
    mov bl, lista_pos[0]
    lea si, lista_palabras[bx]
    lea di, palabraM 
    mov ah, 0
    mov al, lista_pos[1]
    sub al, bl
    mov cx, ax
    repe cmpsb 
    je iguales
    xor si, si
    mov bh, 0
    mov bl, lista_pos[1]
    lea si, lista_palabras[bx]
    lea di, palabraM 
    mov ah, 0
    mov al, lista_pos[2]
    sub al, bl
    mov cx, ax
    repe cmpsb 
    je iguales 
    xor si, si
    mov bh, 0
    mov bl, lista_pos[2]
    lea si, lista_palabras[bx]
    lea di, palabraM 
    mov ah, 0
    mov al, lista_pos[3]
    sub al, bl
    mov cx, ax
    repe cmpsb 
    je iguales
    xor si, si
    mov bh, 0
    mov bl, lista_pos[3]
    lea si, lista_palabras[bx]
    lea di, palabraM 
    mov ah, 0
    mov al, lista_pos[4]
    sub al, bl
    mov cx, ax
    repe cmpsb 
    je iguales
    xor si, si
    mov bh, 0
    mov bl, lista_pos[4]
    lea si, lista_palabras[bx]
    lea di, palabraM 
    mov ah, 0
    mov al, lista_pos[5]
    sub al, bl
    mov cx, ax
    repe cmpsb 
    je iguales
    jne no_iguales
    
iguales:
    PRINT 'Iguales'
    jmp limpiar
    
limpiar: 
    mov di, offset palabraM
    mov cx, 19
    repe movsb
    mov di, offset palabraI
    mov cx, 19
    repe movsb
    jmp pedir_palabra1
    
no_iguales:
    PRINT 'no iguales'
    jmp limpiar    
endm
 
    
.start

mov linea, 0 
jmp imprimir_menu 

opcion1:
    mostrar msg[15], linea
    dec linea
    call scan_num
    jmp animales
    
opcion2:
    mostrar msg[15], linea
    dec linea
    call scan_num
    jmp matriz_animales 
    
;pedir_palabra1:
;    dec linea
;    mostrar palabra, linea
;    mov ah, 1
;    xor si, si
;    jmp pedir_palabra2
;
;pedir_palabra2:
;    int 21h 
;    cmp al, 48
;    jz salir
;    cmp al, 13
;    jz comprobacion
;    mov palabraI[si], al
;    cmp al, 91
;    jnb es_minuscula
;    jb es_mayuscula
;    
;es_mayuscula: 
;    mov palabraM[si], al
;    inc si
;    jmp pedir_palabra2
;    
;es_minuscula:
;    sub al, 32
;    mov palabraM[si], al
;    inc si
;    jmp pedir_palabra2
;    
;comprobacion:
;    comprobar_palabra posAnimales1,listaAnimales1
;comprobar_palabra:
;    xor si, si
;    mov bh, 0
;    mov bl, posAnimales1[0]
;    lea si, listaAnimales1[bx]
;    lea di, palabraM 
;    mov ah, 0
;    mov al, posAnimales1[1]
;    sub al, bl
;    mov cx, ax
;    repe cmpsb 
;    je iguales
;    xor si, si 
;    mov bh, 0
;    mov bl, posAnimales1[1]
;    lea si, listaAnimales1[bx]
;    lea di, palabraM 
;    mov cx, 6
;    repe cmpsb
;    je iguales
;    xor si, si
;    mov bh, 0
;    mov bl, posAnimales1[2]
;    lea si, listaAnimales1[bx]
;    lea di, palabraM 
;    mov cx, 4
;    repe cmpsb
;    je iguales
;    xor si, si 
;    mov bh, 0
;    mov bl, posAnimales1[3]
;    lea si, listaAnimales1[bx]
;    lea di, palabraM 
;    mov cx, 8
;    repe cmpsb
;    je iguales
;    xor si, si
;    mov bh, 0
;    mov bl, posAnimales1[4]
;    lea si, listaAnimales1[bx]
;    lea di, palabraM 
;    mov cx, 10
;    repe cmpsb
;    je iguales
;    jne no_iguales
      
;iguales:
;    PRINT 'Iguales'
;    jmp limpiar
;    
;limpiar: 
;    mov di, offset palabraM
;    mov cx, 19
;    repe movsb
;    mov di, offset palabraI
;    mov cx, 19
;    repe movsb 
;    dec linea
;    jmp pedir_palabra1
;    
;no_iguales:
;    PRINT 'no iguales'
;    jmp limpiar

imprimir_menu: 
    mostrar msg[0], linea
    mostrar msg[36], linea
    mostrar msg[50], linea
    mostrar msg[79], linea  
    jmp opcion1

animales: 
    cmp cx, 1 
    jnz transportes
    mov bx, cx
    inc linea
    mostrar an[0], linea 
    mostrar an[9], linea
    mostrar an[25], linea
    jmp opcion2
    
matriz_animales:
    cmp bx, 1
    jnz matriz_transportes
    cmp cx, 1
    jnz matriz_animales2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Animales Silvestres'
    ;abrir animales1, fragmento 
    pedir_palabra posAnimales1,listaAnimales1
    
matriz_animales2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Animales Domesticos'
    ;abrir animales2, fragmento
    pedir_palabra posAnimales2,listaAnimales2  
                              
transportes: 
    cmp cx, 2
    jnz lenguajes
    mov bx, cx
    inc linea
    mostrar tr[0], linea 
    mostrar tr[24], linea 
    mostrar tr[40], linea
    jmp opcion2  

matriz_transportes: 
    cmp bx, 2
    jnz matriz_lenguajes
    cmp cx, 1
    jnz matriz_transportes2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Vehiculos de transporte terrestres'
    ;abrir vehiculos1, fragmento
    pedir_palabra posVehiculos1,listaVehiculos1

matriz_transportes2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Vehiculos de transporte acuaticos'
    ;abrir vehiculos2, fragmento
    pedir_palabra posVehiculos2,listaVehiculos2
    
lenguajes:
    cmp cx, 3
    jnz opcion1
    mov bx, cx
    inc linea
    mostrar le[0], linea 
    mostrar le[26], linea
    mostrar le[43], linea
    jmp opcion2
    
matriz_lenguajes:
    cmp bx, 3
    cmp cx, 1
    jnz matriz_lenguajes2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Lenguajes de Programacion 1'
    ;abrir lenguajes1, fragmento
    pedir_palabra posLenguajes1,listaLenguajes1

matriz_lenguajes2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Lenguajes de Programacion 2'
    ;abrir lenguajes2, fragmento
    pedir_palabra posLenguajes2,listaLenguajes2
    
salir:
    .exit 
    
pintar:
    mov ax,0600h
    mov bh,011110000b
    mov ch, 4
    mov cl, 4
    mov dh, 4
    mov dl, 5
    int 10h
    
DEFINE_CLEAR_SCREEN
DEFINE_SCAN_NUM
DEFINE_GET_STRING    
END   