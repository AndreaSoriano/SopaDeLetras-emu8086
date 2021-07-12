name "Sopa de Letras"
include "emu8086.inc" 
org 100h

.model small
.data
 
linea           db  ?
a1              db  'Sopa de Letras - Animales Silvestres$'
a2              db  'Sopa de Letras - Animales Domesticos$'
v1              db  'Sopa de Letras - Vehiculos de transporte terrestres$'
v2              db  'Sopa de Letras - Vehiculos de transporte acuaticos$'
l1              db  'Sopa de Letras - Lenguajes de Programacion 1$'
l2              db  'Sopa de Letras - Lenguajes de Programacion 2$'
palabra         db  "Ingrese una palabra encontrada o 0 para salir: $"   
msg             db  "Sopa de letras$","Ingrese una opcion: $","  1. Animales$","  2. Vehiculos de transporte$","  3. Lenguajes de programacion$"         
an              db  "Animales$","  1. Silvestres$","  2. Domesticos$"
tr              db  "Vehiculos de transporte$","  1. Terrestres$","  2. Acuaticos$"
le              db  "Lenguajes de programacion$","  1. Lenguajes 1$","  2. Lenguajes 2$"
rendir          db  "No te rindas, vuelve pronto!$"
ganar           db  "Felicidades! Ganaste!!$"
animales1       db  "\src\animales1.txt",0
animales2       db  "\src\animales2.txt",0
vehiculos1      db  "\src\vehiculos1.txt",0
vehiculos2      db  "\src\vehiculos2.txt",0
lenguajes1      db  "\src\lenguajes1.txt",0
lenguajes2      db  "\src\lenguajes2.txt",0
handler         dw  ?
contador        db  ?
palabra1        db  ?
palabra2        db  ?
palabra3        db  ? 
palabra4        db  ?
palabra5        db  ?
verde           db  010100000b
cian            db  010110000b
rojo            db  011000000b
rosa            db  011010000b
amarillo        db  011100000b 
fragmento       db  32 dup("$")
limpio          db  32 dup("$")
palabraI        db  20 dup("$")
palabraM        db  20 dup("$")
vacio           db  100 dup(" "),"$" 
posAnimales1    db  0,4,10,14,22,32
listaAnimales1  db  "LEON","JIRAFA","MONO","ELEFANTE","HIPOPOTAMO",0
posAnimales2    db  0,4,9,15,20,27
listaAnimales2  db  "GATO","PERRO","CONEJO","OVEJA","CABALLO",0 
posVehiculos1   db  0,5,9,18,22,25
listaVehiculos1 db  "CARRO","MOTO","BICICLETA","TREN","BUS",0
posVehiculos2   db  0,7,11,17,21,30
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
    LOCAL pedir_palabra1,pedir_palabra2,es_mayuscula,es_minuscula,comprobar_palabra,iguales1,iguales2,iguales3,iguales4,iguales5,no_iguales,limpiar,limpiarn
    
pedir_palabra1: 
    mostrar palabra, linea
    mov ah, 1
    xor si, si
    jmp pedir_palabra2

pedir_palabra2:
    int 21h 
    cmp al, 48
    jz rindo
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
    je iguales1
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
    je iguales2 
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
    je iguales3
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
    je iguales4
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
    je iguales5
    jne limpiarn
    
iguales1:
    PRINT 'Iguales 1'
    cmp palabra1, 1
    jz limpiar
    inc palabra1
    inc contador
    jnz limpiar
    
iguales2:
    PRINT 'Iguales 2'
    cmp palabra2, 1
    jz limpiar
    inc palabra2
    inc contador
    jnz limpiar
    
iguales3:          
    PRINT 'Iguales 3'
    cmp palabra3, 1
    jz limpiar
    inc palabra3
    inc contador
    jmp limpiar
    
iguales4:
    PRINT 'Iguales 4'
    cmp palabra4, 1
    jz limpiar
    inc palabra4
    inc contador
    jmp limpiar
    
iguales5:
    PRINT 'Iguales 5'
    cmp palabra5, 1
    jz limpiar
    inc palabra5
    inc contador
    jmp limpiar
    
limpiarn:  
    mov di, offset palabraM
    mov cx, 19
    repe movsb
    mov di, offset palabraI
    mov cx, 19
    repe movsb 
    dec linea
    mostrar vacio, linea
    dec linea
    jmp pedir_palabra1    
    
limpiar: 
    mov di, offset palabraM
    mov cx, 19
    repe movsb
    mov di, offset palabraI
    mov cx, 19
    repe movsb 
    dec linea
    mostrar vacio, linea    
endm 

pintar macro fi,ff,ci,cf,color
    mov ah, 06h
    mov bh, color
    mov ch, fi         ;inicia fila
    mov dh, ff         ;termina fila
    mov cl, ci         ;inicia columna
    mov dl, cf         ;termina columna
    int 10h
endm
    
.start 

mov linea, 0
mov contador, 0
mov palabra1, 0
mov palabra2, 0
mov palabra3, 0
mov palabra4, 0
mov palabra5, 0
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
    mov linea, 0
    mostrar a1, linea
    abrir animales1, fragmento
    pedir_palabra posAnimales1,listaAnimales1
    jmp palabra_a1
        
palabra_a1: 
    cmp palabra1, 1
    jz pintar_leon
    cmp palabra2, 1
    jz pintar_jirafa
    cmp palabra3, 1
    jz pintar_mono
    cmp palabra4, 1
    jz pintar_elefante
    cmp palabra5, 1
    jz pintar_hipopotamo
    jnz pedir_a1
    
pintar_leon:
    pintar 4,4,4,10,verde      ;leon
    inc palabra1
    jmp pedir_a1
    
pintar_jirafa:
    pintar 11,11,8,8,rojo      ;jirafa
    pintar 10,10,10,10,rojo    ;jirafa
    pintar 9,9,12,12,rojo      ;jirafa
    pintar 8,8,14,14,rojo      ;jirafa
    pintar 7,7,16,16,rojo      ;jirafa
    pintar 6,6,18,18,rojo      ;jirafa
    inc palabra2
    jmp pedir_a1
    
pintar_mono: 
    pintar 6,9,26,26,cian      ;mono 
    inc palabra3
    jmp pedir_a1
    
pintar_elefante:
    pintar 15,15,6,20,rosa     ;elefante
    inc palabra4
    jmp pedir_a1
    
pintar_hipopotamo:
    pintar 5,14,2,2,amarillo   ;hipopotamo
    inc palabra5
    jmp pedir_a1    
   
pedir_a1:
    mov linea, 0
    mostrar a1, linea
    abrir animales1, fragmento 
    cmp contador, 5 
    jz gano
    pedir_palabra posAnimales1,listaAnimales1
    jmp palabra_a1
       
matriz_animales2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 0
    mostrar a2, linea
    abrir animales2, fragmento
    pedir_palabra posAnimales2,listaAnimales2
    jmp palabra_a2
    
palabra_a2: 
    cmp palabra1, 1
    jz pintar_gato
    cmp palabra2, 1
    jz pintar_perro
    cmp palabra3, 1
    jz pintar_conejo
    cmp palabra4, 1
    jz pintar_oveja
    cmp palabra5, 1
    jz pintar_caballo
    jnz pedir_a2
      
pintar_gato:
    pintar 3,3,4,10,amarillo   ;gato
    inc palabra1
    jmp pedir_a2
    
pintar_perro: 
    pintar 11,15,8,8,rosa      ;perro
    inc palabra2
    jmp pedir_a2
    
pintar_conejo:
    pintar 7,7,10,10,cian      ;conejo
    pintar 8,8,12,12,cian      ;conejo
    pintar 9,9,14,14,cian      ;conejo
    pintar 10,10,16,16,cian    ;conejo
    pintar 11,11,18,18,cian    ;conejo
    pintar 12,12,20,20,cian    ;conejo
    inc palabra3
    jmp pedir_a2
    
pintar_oveja:
    pintar 6,10,26,26,rojo     ;oveja
    inc palabra4
    jmp pedir_a2
    
pintar_caballo:
    pintar 8,14,2,2,verde      ;caballo
    inc palabra5
    jmp pedir_a2    
   
pedir_a2:
    mov linea, 0
    mostrar a2, linea
    abrir animales2, fragmento 
    cmp contador, 5 
    jz gano
    pedir_palabra posAnimales2,listaAnimales2
    jmp palabra_a2
                                      
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
    mov linea, 0
    mostrar v1, linea 
    abrir vehiculos1, fragmento
    pedir_palabra posVehiculos1,listaVehiculos1
    jmp palabra_v1
    
palabra_v1: 
    cmp palabra1, 1
    jz pintar_carro
    cmp palabra2, 1
    jz pintar_moto
    cmp palabra3, 1
    jz pintar_bici
    cmp palabra4, 1
    jz pintar_tren
    cmp palabra5, 1
    jz pintar_bus
    jnz pedir_v1
      
pintar_carro:
    pintar 16,16,4,12,cian      ;carro
    inc palabra1
    jmp pedir_v1

pintar_moto:
    pintar 10,13,24,24,verde    ;moto
    inc palabra2
    jmp pedir_v1
    
pintar_bici:
    pintar 4,4,4,4,amarillo     ;bicicleta
    pintar 5,5,6,6,amarillo     ;bicicleta     
    pintar 6,6,8,8,amarillo     ;bicicleta
    pintar 7,7,10,10,amarillo   ;bicicleta
    pintar 8,8,12,12,amarillo   ;bicicleta
    pintar 9,9,14,14,amarillo   ;bicicleta
    pintar 10,10,16,16,amarillo ;bicicleta
    pintar 11,11,18,18,amarillo ;bicicleta
    pintar 12,12,20,20,amarillo ;bicicleta
    inc palabra3
    jmp pedir_v1
    
pintar_tren:
    pintar 3,3,10,16,rosa       ;tren
    inc palabra4
    jmp pedir_v1
    
pintar_bus:
    pintar 7,9,2,2,rojo         ;bus
    inc palabra5
    jmp pedir_v1
    
pedir_v1:
    mov linea, 0
    mostrar v1, linea    
    abrir vehiculos1, fragmento 
    cmp contador, 5 
    jz gano                              
    pedir_palabra posVehiculos1,listaVehiculos1
    jmp palabra_v1      
  
matriz_transportes2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 0
    mostrar v2, linea
    abrir vehiculos2, fragmento
    pedir_palabra posVehiculos2,listaVehiculos2
    jmp palabra_v2
    
palabra_v2: 
    cmp palabra1, 1
    jz pintar_crucero
    cmp palabra2, 1
    jz pintar_bote
    cmp palabra3, 1
    jz pintar_velero
    cmp palabra4, 1
    jz pintar_yate
    cmp palabra5, 1
    jz pintar_subm
    jnz pedir_v2
    
pintar_crucero:                     
    pintar 4,4,4,4,rosa         ;crucero
    pintar 5,5,6,6,rosa         ;crucero     
    pintar 6,6,8,8,rosa         ;crucero
    pintar 7,7,10,10,rosa       ;crucero
    pintar 8,8,12,12,rosa       ;crucero
    pintar 9,9,14,14,rosa       ;crucero
    pintar 10,10,16,16,rosa     ;crucero
    inc palabra1
    jmp pedir_v2

pintar_bote:                        
    pintar 3,3,10,16,amarillo   ;bote
    inc palabra2
    jmp pedir_v2
    
pintar_velero:            
    pintar 5,10,20,20,verde     ;velero
    inc palabra3
    jmp pedir_v2
    
pintar_yate:                       
    pintar 15,15,16,22,cian     ;yate
    inc palabra4
    jmp pedir_v2
    
pintar_subm:                       
    pintar 4,12,26,26,rojo      ;submarino
    inc palabra5
    jmp pedir_v2
    
pedir_v2:
    mov linea, 0
    mostrar v2, linea    
    abrir vehiculos2, fragmento 
    cmp contador, 5 
    jz gano                              
    pedir_palabra posVehiculos2,listaVehiculos2
    jmp palabra_v2   
        
lenguajes:
    cmp cx, 3
    mov bx, cx
    jnz opcion1
    inc linea
    mostrar le[0], linea 
    mostrar le[26], linea
    mostrar le[43], linea
    jmp opcion2
    
matriz_lenguajes:
    cmp cx, 1        
    jnz matriz_lenguajes2
    call clear_screen
    mov linea, 0 
    mostrar l1, linea
    abrir lenguajes1, fragmento
    pedir_palabra posLenguajes1,listaLenguajes1
    jmp palabra_l1
    
palabra_l1: 
    cmp palabra1, 1
    jz pintar_ruby
    cmp palabra2, 1
    jz pintar_js
    cmp palabra3, 1
    jz pintar_py
    cmp palabra4, 1
    jz pintar_php
    cmp palabra5, 1
    jz pintar_cob
    jnz pedir_l1
    
pintar_ruby:                     
    pintar 15,15,6,12,verde     ;ruby
    inc palabra1
    jmp pedir_l1

pintar_js:          
    pintar 14,14,20,20,amarillo ;javascript
    pintar 13,13,18,18,amarillo ;javascript
    pintar 12,12,16,16,amarillo ;javascript
    pintar 11,11,14,14,amarillo ;javascript
    pintar 10,10,12,12,amarillo ;javascript
    pintar 9,9,10,10,amarillo   ;javascript
    pintar 8,8,8,8,amarillo     ;javascript    
    pintar 7,7,6,6,amarillo     ;javascript
    pintar 6,6,4,4,amarillo     ;javascript                
    pintar 5,5,2,2,amarillo     ;javascript
    inc palabra2
    jmp pedir_l1
    
pintar_py:                             
    pintar 3,8,26,26,rojo       ;python
    inc palabra3
    jmp pedir_l1
    
pintar_php:                           
    pintar 16,16,18,22,rosa     ;php
    inc palabra4
    jmp pedir_l1
    
pintar_cob:                                
    pintar 7,11,0,0,cian        ;cobol
    inc palabra5
    jmp pedir_l1
    
pedir_l1:
    mov linea, 0         
    mostrar l1, linea
    abrir lenguajes1, fragmento 
    cmp contador, 5 
    jz gano                                   
    pedir_palabra posLenguajes1,listaLenguajes1
    jmp palabra_l1   
         
matriz_lenguajes2:
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 0 
    mostrar l2, linea
    abrir lenguajes2, fragmento
    pedir_palabra posLenguajes2,listaLenguajes2
    jmp palabra_l2
    
palabra_l2: 
    cmp palabra1, 1
    jz pintar_java
    cmp palabra2, 1
    jz pintar_sql
    cmp palabra3, 1
    jz pintar_pascal
    cmp palabra4, 1
    jz pintar_perl
    cmp palabra5, 1
    jz pintar_scheme
    jnz pedir_l2
    
pintar_java:                         
    pintar 15,15,4,10,rojo      ;java
    inc palabra1
    jmp pedir_l2

pintar_sql:                           
    pintar 14,14,16,20,verde    ;sql
    inc palabra2
    jmp pedir_l2
    
pintar_pascal:                        
    pintar 5,5,6,6,cian         ;pascal
    pintar 6,6,8,8,cian         ;pascal
    pintar 7,7,10,10,cian       ;pascal
    pintar 8,8,12,12,cian       ;pascal
    pintar 9,9,14,14,cian       ;pascal
    pintar 10,10,16,16,cian     ;pascal
    inc palabra3
    jmp pedir_l2
    
pintar_perl:                         
    pintar 4,7,28,28,rosa       ;perl 
    inc palabra4
    jmp pedir_l2
    
pintar_scheme:                        
    pintar 3,8,0,0,amarillo     ;scheme
    inc palabra5
    jmp pedir_l2
    
pedir_l2:
    mov linea, 0         
    mostrar l2, linea
    abrir lenguajes2, fragmento 
    cmp contador, 5 
    jz gano                                   
    pedir_palabra posLenguajes2,listaLenguajes2
    jmp palabra_l2   
                   
gano:
    inc linea
    mostrar ganar,linea
    .exit

rindo:
    inc linea
    mostrar rendir,linea
    .exit 
      
DEFINE_CLEAR_SCREEN
DEFINE_SCAN_NUM    
END   