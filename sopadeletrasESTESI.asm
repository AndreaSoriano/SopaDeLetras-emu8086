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
fragmento       db  32 dup("$")
limpio          db  32 dup("$")
palabraI        db  20 dup(" "),"$"
palabraM        db  20 dup(" "),"$"
posAnimales1    db  0,4,10,14,22
leon            db  "LEON",0
jirafa          db  "JIRAFA",0
mono            db  "MONO",0
elefante        db  "ELEFANTE",0
hipopotamo      db  "HIPOPOTAMO",0
listaAnimales1  db  "LEON","JIRAFA","MONO","ELEFANTE","HIPOPOTAMO"
posAnimales2    db  0,5,10,17,22
listaAnimales2  db  "GATO","PERRO","CONEJO","OVEJA","CABALLO",0 
posVehiculos1   db  0,5,9,18,22
listaVehiculos1 db  "CARRO","MOTO","BICICLETA","TREN","BUS",0
posVehiculos2   db  0,7,11,18,22
listaVehiculos2 db  "CRUCERO","BOTE","VELERO","YATE","SUBMARINO",0
posLenguajes1   db  0,4,14,20,23
listaLenguajes1 db  "RUBY","JAVASCRIPT","PYTHON","PHP","COBOL",0
posLenguajes2   db  0,4,7,13,17
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
    
pedir_palabra1:
    dec linea
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
    
comprobar_palabra MACRO lista_pos,lista_palabras
    xor si, si
    
comprobar_palabra:
    xor si, si
    mov bh, 0
    mov bl, posAnimales1[0]
    lea si, listaAnimales1[bx]
    lea di, palabraM 
    mov ah, 0
    mov al, posAnimales1[1]
    sub al, bl
    mov cx, ax
    repe cmpsb 
    je iguales
    xor si, si 
    mov bh, 0
    mov bl, posAnimales1[1]
    lea si, listaAnimales1[bx]
    lea di, palabraM 
    mov cx, 6
    repe cmpsb
    je iguales
    xor si, si
    mov bh, 0
    mov bl, posAnimales1[2]
    lea si, listaAnimales1[bx]
    lea di, palabraM 
    mov cx, 4
    repe cmpsb
    je iguales
    xor si, si 
    mov bh, 0
    mov bl, posAnimales1[3]
    lea si, listaAnimales1[bx]
    lea di, palabraM 
    mov cx, 8
    repe cmpsb
    je iguales
    xor si, si
    mov bh, 0
    mov bl, posAnimales1[4]
    lea si, listaAnimales1[bx]
    lea di, palabraM 
    mov cx, 10
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
    dec linea
    jmp pedir_palabra1
    
no_iguales:
    PRINT 'no iguales',10,13
    jmp limpiar

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
    jmp pedir_palabra1
    
matriz_animales2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Animales Domesticos'
    abrir animales2, fragmento
    jmp salir  
                              
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
    abrir vehiculos1, fragmento
    jmp salir

matriz_transportes2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Vehiculos de transporte acuaticos'
    abrir vehiculos2, fragmento
    jmp salir
    
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
    abrir lenguajes1, fragmento
    jmp salir

matriz_lenguajes2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 1
    PRINT 'Sopa de Letras - Lenguajes de Programacion 2'
    abrir lenguajes2, fragmento
    jmp salir
    
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