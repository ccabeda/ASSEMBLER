                ;Realice un programa en Assembler que lea un arreglo de 5 numeros enteros almacenados a
                ;partir de la direccion $86, Sume los primeros 6 digitos y guarde en la direccion $94.
                ;Finalmente compare el resultado de esa suma con el valor �ltimo del arreglo, si es mayor
                ;escriba #$02 en la direccion $84 caso contrario haga $84 divido 2.


                ORG $86                 ; INICIO MEMORIA
                DB $05,$07,$AA,$AB      ; ARREGLO DE 4 NUMEROS
                DB $AA                  ; NUMERO A COMPARAR
                DB $05                  ; CANTIDAD DE NUMEROS +1
                ORG $94                 ; INICIO MEMORIA EN POS 94
                DB $00                  ; DONDE GUARDAR LA SUMA



                ORG $EE00               ; INICIO PROGRAMA
                CLRA                    ; LIMPIO ACUMULADOR
                LDX #$86                ; X= #$86
     DATO:      DEC $8B                 ; DECREMENTO CANTIDAD DE NUMEROS
                LDA $8B                 ; ACU= $8B
                CBEQA #$00 SALTO        ; SI NO HAY MAS ELEM SALTE A FIN
                LDA $94                 ; ACU= $94
                ADD X                   ; AL ACU LE SUMO LO QUE INDIQUE X
                STA $94                 ; GUARDO LO DE ACU EN LA POS DE MEMORIA $94
                INC X                   ; INCREMENTO X PARA PASAR DE ELEM EN EL ARREGLO
                BRA DATO                ; SALTO A DATO

     SALTO:     LDA $94                 ; ACU = SUMA TOTAL
                CMP $8A                 ; NUMERO A COMPARAR
                BHI MENOR               ; SI ES MENOR QUE SALTE
                LDA #$02                ; ACU= #$02
                STA $94                 ; GUARDO EN POS $94 EL VALOR #$02
                BRA FIN                 ; SALTO A FIN

     MENOR:     LDHX #$0802             ; H= #$08 X= #$02
                LDA #$04                ; ACU= #$04
                DIV                     ; DIVIDO #$84/#$02
                BRA FIN                 ; SALTO A FIN

     FIN:       SWI                     ; FIN DE PROGRAMA. INR POR SOFT
                ORG $FFFA
                DW $EE00

