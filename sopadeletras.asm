name "Sopa de Letras - Andrea Soriano"
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
animales1       db  "X X W R S J V H M L K O U D N",13,10
                db  "U V O I U N B M F T W M Q A A",13,10
                db  "X V L E O N X Q S E T S D E K",13,10
                db  "S H W V B T H I I B V M B I R",13,10
                db  "Q I W J T Y C G L A B C S M H",13,10
                db  "W P C S H G O E F R S A J O D",13,10
                db  "G O U O W O J A T Q R Q W N M",13,10
                db  "R P A F C H R A M F P R G O B",13,10
                db  "C O R F K I D S S D T C M Q D",13,10
                db  "R T H W J Q L V S Y M Y A L E",13,10
                db  "H A W E I A S L S G F I C L J",13,10
                db  "X M W E D G Y O U Q D N Q I U",13,10
                db  "X O W V O W T X K N B U G L R",13,10
                db  "I T G E L E F A N T E U R Y W",13,10
                db  "J R X M E D B N P F U A M T U$",13,10
animales2       db  "R C I B B J F B V J S A V Z A",13,10
                db  "V X G A T O Z H S J Y Z V D U",13,10
                db  "F K P U W X S Q F F M P E H Z",13,10
                db  "N H Z Y J U U D H Y A O V D W",13,10
                db  "O N B X X Y W P H R P X N O U",13,10
                db  "C G V Z M C F U N D K E V V U",13,10
                db  "C O G D A S O G Q O T C P E H",13,10
                db  "R L V W B Y T N B Z T L U J B",13,10
                db  "N L Y Q I T W V E V S B P A K",13,10
                db  "K A O M P P H X Q J T S P W S",13,10
                db  "V B T G E J Y Y J X O O F Q W",13,10
                db  "Y A A C R J Q Q S H D C A O B",13,10
                db  "A C M N R V S V Z Z E F C B C",13,10
                db  "J Z W H O S F H E Z B M J A E",13,10
                db  "I L A N Y N J E N A B Q I D Z$",13,10
vehiculos1      db  "M W M K N G F Y M P S U K V K",13,10
                db  "Z P A P B T R E N R B Z O F B",13,10
                db  "T Y B S B V R G O B V Y R J X",13,10
                db  "X J U I K V T Y V Y W A Q U D",13,10
                db  "H N M B C H O Q J F C T J E C",13,10
                db  "S B S Y Q I J G S W C I Q L P",13,10
                db  "Z U C F X O C K K B S K B C W",13,10
                db  "S S X N A U T L J J C Z U Q Y",13,10
                db  "C Z I Z L E I Q E W H U O M B",13,10
                db  "D T W U Z X G O V T V A T D J",13,10
                db  "Y X W L Z D X F N S A R O N T",13,10
                db  "F Y P F I B H Q F F Y I M H C",13,10
                db  "X T X T T M M G H Y T O W H W",13,10
                db  "J J H R J F A Y H R R E T A V",13,10
                db  "A F C A R R O I T X W H H X E$",13,10
vehiculos2      db  "L J J I V W S H T C E A J U J",13,10
                db  "I M K D W B O T E H R T P I H",13,10
                db  "N S C Q Z G D D B Z K W P S J",13,10
                db  "H V L R G Y K X B G V A J U Q",13,10
                db  "H V J X U D U O N N E F R B H",13,10
                db  "P T V W Z C A W C U L X G M W",13,10
                db  "J O D P L E E A M T E U W A S",13,10
                db  "D E H N W A V R T E R U B R Q",13,10
                db  "M Y E Y R R V L O X O F Z I V",13,10
                db  "O U G Z S E G P W D G Z J N R",13,10
                db  "T A W S O G C S D D N T F O W",13,10
                db  "P A N W V X R M L J I X V Q V",13,10
                db  "I P P B R V G D R L O Z D Y C",13,10
                db  "M H N E X N W C Y A T E Q R D",13,10
                db  "E V K M Z U V D M B P Q K H F$",13,10
lenguajes1      db  "Q B U Q A A U K Z B S P I J O",13,10
                db  "B B G L D O D J J C A E T P R",13,10
                db  "M L F C W M J L D N Z O V Y C",13,10
                db  "I T A J P X W U T J O W Z T O",13,10
                db  "V Y P V U J I C Y F D W Y H N",13,10
                db  "C X P I Q C O P Z Q P E M O B",13,10
                db  "O K E F R I U L W K J H E N E",13,10
                db  "B H Y J N C A D O J J N H Q M",13,10
                db  "O J B E N K S Y Z P A M U H N",13,10
                db  "L G J E F T J A B E O M D E T",13,10
                db  "N K D B J B D U V U R U F K Q",13,10
                db  "I M C I N V R A Z A P C H K B",13,10
                db  "I U H A Q H M U I Q J A I G O",13,10
                db  "U N W R U B Y O A A B B D Q E",13,10
                db  "U O U Y X Q Q H T P H P C A L$",13,10
lenguajes2      db  "Z X D V S D C S J D O Y E X T",13,10
                db  "S M C E B W A Z G O J X F C L",13,10
                db  "C C A W J M M G Q O J M B Q P",13,10
                db  "H T Z P N S O S W R H D J O E",13,10
                db  "E W K K A Q B Z M C Z Z I Y R",13,10
                db  "M V S O I S O L V X D U N L L",13,10
                db  "E L K J R E C B X O J J J R T",13,10
                db  "S G F N Y P B A X K V V Z F Y",13,10
                db  "Y W L P F W N C L O N A G V H",13,10
                db  "B C O B H Y I W I F P X K Z G",13,10
                db  "T J E E K K I J Y D L E T Z N",13,10
                db  "M E S N P T M B O D N U D R K",13,10
                db  "T U E H V D G W S Q L Y F T V",13,10
                db  "G I J A V A N Q D C U G K L U",13,10
                db  "B F T X N Y V W P N I S L B S$",13,10 
opcion          db  "Ingrese una opcion: $"                
palabra         db  "Ingrese una palabra encontrada o 0 para salir: $"   
menu            db  "Sopa de letras",13,10,13,10
                db  "  1. Animales",13,10
                db  "  2. Vehiculos de transporte",13,10
                db  "  3. Lenguajes de programacion$",13,10         
menu_animales   db  "Animales",13,10
                db  "  1. Silvestres",13,10
                db  "  2. Domesticos$",13,10
menu_vehiculos  db  "Vehiculos de transporte",13,10
                db  "  1. Terrestres",13,10
                db  "  2. Acuaticos$",13,10
menu_lenguajes  db  "Lenguajes de programacion",13,10
                db  "  1. Lenguajes 1",13,10
                db  "  2. Lenguajes 2$",13,10
rendir          db  "No te rindas, vuelve pronto!$"
ganar           db  "Felicidades! Ganaste!!$"
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

mostrar macro var         ;sirve posicionar el cursos, mostrar por pantalla y hacer el salto de linea
    mov ax, 0h
    GOTOXY 0, linea 
    inc linea   
    mov ah, 09h
    lea dx, var
    int 21h   
endm 

pedir_palabra macro lista_pos,lista_palabras     ;pide la palabra por teclado 
    LOCAL pedir_palabra1,pedir_palabra2,es_mayuscula,es_minuscula,comprobar_palabra,iguales1,iguales2,iguales3,iguales4,iguales5,no_iguales,limpiar,limpiarn
    
pedir_palabra1: 
    mostrar palabra
    mov ah, 1
    xor si, si
    jmp pedir_palabra2

pedir_palabra2:
    int 21h                                       ;verifica caracter por caracter si es mayuscula, minuscula, enter o 0
    cmp al, 48
    jz rindo
    cmp al, 13
    jz comprobar_palabra
    mov palabraI[si], al
    cmp al, 91
    jnb es_minuscula
    jb es_mayuscula
    
es_mayuscula: 
    mov palabraM[si], al                          ;guarda los caracteres en mayuscula en palabraM
    inc si
    jmp pedir_palabra2
    
es_minuscula:
    sub al, 32
    mov palabraM[si], al                          ;guarda los caracteres convertidos de minuscula a mayuscula en palabraM
    inc si
    jmp pedir_palabra2 

comprobar_palabra:                                ;comprueba si la palabra es igual a una de las cinco palabras de la sopa de letras
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
    cmp palabra1, 1
    jz limpiar
    inc palabra1
    inc contador
    jnz limpiar
    
iguales2:
    cmp palabra2, 1
    jz limpiar
    inc palabra2
    inc contador
    jnz limpiar
    
iguales3:          
    cmp palabra3, 1
    jz limpiar
    inc palabra3
    inc contador
    jmp limpiar
    
iguales4:
    cmp palabra4, 1
    jz limpiar
    inc palabra4
    inc contador
    jmp limpiar
    
iguales5:
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
    mostrar vacio
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
    mostrar vacio   
endm 

pintar macro fi,ff,ci,cf,color                ;pintar en la pantalla con un respectivo color
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

opcion1:                                    ;pide por teclado la primera opcion
    mov linea, 6
    mostrar opcion
    dec linea
    call scan_num
    jmp animales
    
opcion2:                                    ;pide por teclado la segunda opcion
    mov linea, 12
    mostrar opcion
    dec linea
    call scan_num
    jmp matriz_animales 
    
imprimir_menu:                              ;muestra por pantalla el menu principal
    mostrar menu 
    jmp opcion1

animales:                                   ;muestra por pantalla el menu de animales
    cmp cx, 1 
    jnz transportes
    mov bx, cx
    add linea, 2
    mostrar menu_animales
    jmp opcion2
    
matriz_animales:                            ;muestra por pantalla la primera matriz de animales y pide las palabras encontradas
    cmp bx, 1
    jnz matriz_transportes
    cmp cx, 1
    jnz matriz_animales2
    call clear_screen
    mov linea, 0
    mostrar a1
    inc linea
    mostrar animales1
    mov linea, 18
    pedir_palabra posAnimales1,listaAnimales1
    jmp palabra_a1
                                            
palabra_a1:                                 ;pintara en la matriz la palabra ingresada
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
    
pintar_leon:                                ;pintara la palabra leon en la matriz
    pintar 4,4,4,10,verde      ;leon
    inc palabra1
    jmp pedir_a1
    
pintar_jirafa:                              ;pintara la palabra jirafa en la matriz
    pintar 11,11,8,8,rojo      ;jirafa
    pintar 10,10,10,10,rojo    ;jirafa
    pintar 9,9,12,12,rojo      ;jirafa
    pintar 8,8,14,14,rojo      ;jirafa
    pintar 7,7,16,16,rojo      ;jirafa
    pintar 6,6,18,18,rojo      ;jirafa
    inc palabra2
    jmp pedir_a1
    
pintar_mono:                                ;pintara la palabra mono en la matriz
    pintar 6,9,26,26,cian      ;mono 
    inc palabra3
    jmp pedir_a1
    
pintar_elefante:                            ;pintara la palabra elefante en la matriz
    pintar 15,15,6,20,rosa     ;elefante
    inc palabra4
    jmp pedir_a1
    
pintar_hipopotamo:                          ;pintara la palabra hipopotamo en la matriz
    pintar 5,14,2,2,amarillo   ;hipopotamo
    inc palabra5
    jmp pedir_a1    
   
pedir_a1:                                   ;pedira la siguiente palabra
    mov linea, 0
    mostrar a1
    inc linea
    mostrar animales1 
    cmp contador, 5 
    jz gano
    mov linea, 18
    pedir_palabra posAnimales1,listaAnimales1
    jmp palabra_a1
       
matriz_animales2:                           ;muestra por pantalla la segunda matriz de animales y pide las palabras encontradas
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 0
    mostrar a2
    inc linea
    mostrar animales2
    mov linea, 18
    pedir_palabra posAnimales2,listaAnimales2
    jmp palabra_a2
    
palabra_a2:                                 ;pintara en la matriz la palabra ingresada
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
      
pintar_gato:                                ;pintara la palabra gato en la matriz
    pintar 3,3,4,10,amarillo   ;gato
    inc palabra1
    jmp pedir_a2
    
pintar_perro:                               ;pintara la palabra perro en la matriz
    pintar 11,15,8,8,rosa      ;perro
    inc palabra2
    jmp pedir_a2
    
pintar_conejo:                              ;pintara la palabra conejo en la matriz
    pintar 7,7,10,10,cian      ;conejo
    pintar 8,8,12,12,cian      ;conejo
    pintar 9,9,14,14,cian      ;conejo
    pintar 10,10,16,16,cian    ;conejo
    pintar 11,11,18,18,cian    ;conejo
    pintar 12,12,20,20,cian    ;conejo
    inc palabra3
    jmp pedir_a2
                                            ;pintara la palabra oveja en la matriz
pintar_oveja:
    pintar 6,10,26,26,rojo     ;oveja
    inc palabra4
    jmp pedir_a2
    
pintar_caballo:                             ;pintara la palabra caballo en la matriz
    pintar 8,14,2,2,verde      ;caballo
    inc palabra5
    jmp pedir_a2    
   
pedir_a2:                                   ;pedira la siguiente palabra
    mov linea, 0
    mostrar a2 
    inc linea
    mostrar animales2 
    cmp contador, 5 
    jz gano 
    mov linea, 18
    pedir_palabra posAnimales2,listaAnimales2
    jmp palabra_a2
                                      
transportes:                                ;muestra por pantalla el menu de transportes
    cmp cx, 2
    jnz lenguajes
    mov bx, cx
    add linea, 2
    mostrar menu_vehiculos
    jmp opcion2  

matriz_transportes:                         ;muestra por pantalla la primera matriz de transportes y pide las palabras encontradas
    cmp bx, 2
    jnz matriz_lenguajes
    cmp cx, 1
    jnz matriz_transportes2
    call clear_screen
    mov linea, 0
    mostrar v1
    inc linea 
    mostrar vehiculos1
    mov linea, 18
    pedir_palabra posVehiculos1,listaVehiculos1
    jmp palabra_v1
    
palabra_v1:                                 ;pintara en la matriz la palabra ingresada
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
      
pintar_carro:                               ;pintara la palabra carro en la matriz
    pintar 16,16,4,12,cian      ;carro
    inc palabra1
    jmp pedir_v1

pintar_moto:                                ;pintara la palabra moto en la matriz
    pintar 10,13,24,24,verde    ;moto
    inc palabra2
    jmp pedir_v1
    
pintar_bici:                                ;pintara la palabra bicicleta en la matriz
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
    
pintar_tren:                                ;pintara la palabra tren en la matriz
    pintar 3,3,10,16,rosa       ;tren
    inc palabra4
    jmp pedir_v1
    
pintar_bus:                                 ;pintara la palabra bus en la matriz
    pintar 7,9,2,2,rojo         ;bus
    inc palabra5
    jmp pedir_v1
    
pedir_v1:                                   ;pedira la siguiente palabra
    mov linea, 0
    mostrar v1 
    inc linea   
    mostrar vehiculos1 
    cmp contador, 5 
    jz gano 
    mov linea, 18                             
    pedir_palabra posVehiculos1,listaVehiculos1
    jmp palabra_v1      
  
matriz_transportes2:                          ;muestra por pantalla la segunda matriz de transportes y pide las palabras encontradas
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 0
    mostrar v2
    inc linea
    mostrar vehiculos2
    mov linea, 18
    pedir_palabra posVehiculos2,listaVehiculos2
    jmp palabra_v2
    
palabra_v2:                                   ;pintara en la matriz la palabra ingresada
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
    
pintar_crucero:                                ;pintara la palabra crucero en la matriz
    pintar 4,4,4,4,rosa         ;crucero
    pintar 5,5,6,6,rosa         ;crucero     
    pintar 6,6,8,8,rosa         ;crucero
    pintar 7,7,10,10,rosa       ;crucero
    pintar 8,8,12,12,rosa       ;crucero
    pintar 9,9,14,14,rosa       ;crucero
    pintar 10,10,16,16,rosa     ;crucero
    inc palabra1
    jmp pedir_v2

pintar_bote:                                    ;pintara la palabra bote en la matriz
    pintar 3,3,10,16,amarillo   ;bote
    inc palabra2
    jmp pedir_v2
    
pintar_velero:                                   ;pintara la palabra velero en la matriz
    pintar 5,10,20,20,verde     ;velero
    inc palabra3
    jmp pedir_v2
    
pintar_yate:                                      ;pintara la palabra yate en la matriz
    pintar 15,15,16,22,cian     ;yate
    inc palabra4
    jmp pedir_v2
    
pintar_subm:                                      ;pintara la palabra submarino en la matriz
    pintar 4,12,26,26,rojo      ;submarino
    inc palabra5
    jmp pedir_v2
                                                 ;pedira la siguiente palabra
pedir_v2:
    mov linea, 0
    mostrar v2
    inc linea    
    mostrar vehiculos2
    cmp contador, 5 
    jz gano 
    mov linea, 18                             
    pedir_palabra posVehiculos2,listaVehiculos2
    jmp palabra_v2   
        
lenguajes:                                       ;mostrara el menu de lenguajes
    cmp cx, 3
    mov bx, cx
    jnz opcion1
    add linea, 2
    mostrar menu_lenguajes 
    jmp opcion2
    
matriz_lenguajes:
    cmp cx, 1                                   ;muestra por pantalla la primera matriz de lenguajes y pide las palabras encontradas
    jnz matriz_lenguajes2
    call clear_screen
    mov linea, 0 
    mostrar l1 
    inc linea
    mostrar lenguajes1
    mov linea, 18
    pedir_palabra posLenguajes1,listaLenguajes1
    jmp palabra_l1
    
palabra_l1: 
    cmp palabra1, 1                            ;pintara en la matriz la palabra ingresada
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
    
pintar_ruby:                                   ;pintara la palabra ruby en la matriz
    pintar 15,15,6,12,verde     ;ruby
    inc palabra1
    jmp pedir_l1

pintar_js:                                     ;pintara la palabra javascript en la matriz
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
    
pintar_py:                                     ;pintara la palabra python en la matriz
    pintar 3,8,26,26,rojo       ;python
    inc palabra3
    jmp pedir_l1
    
pintar_php:                                    ;pintara la palabra php en la matriz
    pintar 16,16,18,22,rosa     ;php
    inc palabra4
    jmp pedir_l1
    
pintar_cob:                                    ;pintara la palabra cobol en la matriz
    pintar 7,11,0,0,cian        ;cobol
    inc palabra5
    jmp pedir_l1
    
pedir_l1:                                          ;pedira la siguiente palabra
    mov linea, 0         
    mostrar l1
    inc linea
    mostrar lenguajes1 
    cmp contador, 5 
    jz gano 
    mov linea, 18                                  
    pedir_palabra posLenguajes1,listaLenguajes1
    jmp palabra_l1   
         
matriz_lenguajes2:                               ;muestra por pantalla la segunda matriz de lenguajes y pide las palabras encontradas
    cmp cx, 2
    jnz opcion2
    call clear_screen
    mov linea, 0 
    mostrar l2
    inc linea
    mostrar lenguajes2
    mov linea, 18
    pedir_palabra posLenguajes2,listaLenguajes2
    jmp palabra_l2
    
palabra_l2: 
    cmp palabra1, 1                              ;pintara en la matriz la palabra ingresada
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
    pintar 15,15,4,10,rojo      ;java            ;pintara la palabra java en la matriz
    inc palabra1
    jmp pedir_l2

pintar_sql:                                      ;pintara la palabra sql en la matriz
    pintar 14,14,16,20,verde    ;sql
    inc palabra2
    jmp pedir_l2
    
pintar_pascal:                                   ;pintara la palabra pascal en la matriz
    pintar 5,5,6,6,cian         ;pascal
    pintar 6,6,8,8,cian         ;pascal
    pintar 7,7,10,10,cian       ;pascal
    pintar 8,8,12,12,cian       ;pascal
    pintar 9,9,14,14,cian       ;pascal
    pintar 10,10,16,16,cian     ;pascal
    inc palabra3
    jmp pedir_l2
                                                 ;pintara la palabra perl en la matriz
pintar_perl:                         
    pintar 4,7,28,28,rosa       ;perl 
    inc palabra4
    jmp pedir_l2
    
pintar_scheme:                                   ;pintara la palabra scheme en la matriz
    pintar 3,8,0,0,amarillo     ;scheme
    inc palabra5
    jmp pedir_l2
    
pedir_l2:                                           ;pedira la siguiente palabra
    mov linea, 0         
    mostrar l2
    inc linea
    mostrar lenguajes2
    cmp contador, 5 
    jz gano 
    mov linea, 18                                  
    pedir_palabra posLenguajes2,listaLenguajes2
    jmp palabra_l2   
                   
gano:
    mov linea, 18                                 ;mostrara un mensaje por pantalla si gano la partida
    mostrar ganar
    .exit

rindo:
    mostrar rendir                                ;mostara un mensaje por pantalla si perdio la partida
    .exit 
      
DEFINE_CLEAR_SCREEN
DEFINE_SCAN_NUM    
END   