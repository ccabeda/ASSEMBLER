        ;Determinar la cantidad de n�meros positivos, negativos y cero de una tabla
        ;en memoria. La posici�n del comienzo de la tabla est� determinada por el
        ;contenido de las posiciones de memoria $0080, $0081 y el final en las
        ;posiciones $0082, $0083.


        ORG $80                 ; INICIO MEMORIA
        DB $AA,$01,$06,$00      ; LISTA DE NUMEROS 80 A 83
        DB $05                  ; CANTIDAD DE ELEMENTOS +1 84
        DB $00                  ; CANTIDAD DE CEROS 85
        DB $00                  ; CANTIDAD DE POSITIVOS 86
        DB $00                  ; CANTIDAD DE NEGATIVOS 87

        ORG $EE00               ; INICIO PROGRAMA
        CLRA                    ; LIMPIO ACUMULADOR
        LDX #$80                ; X= #$80
  DATO: DEC $84                 ; DECREMENTO LA CANTIDAD DE ELEMENTOS
        LDA $84                 ; ACU= $84
        CBEQA #$00 FIN          ; SI NO HAY MAS ELEMENTOS SALTO A FIN
        LDA ,X                  ; CARGO EN ACU LO QUE INDICA X
        BEQ CERO                ; SALTE SI EL NUMERO ES 0
        BMI NEG                 ; SALTE SI EL NUMERO ES NEGATIVO
        INC $85                 ; INCREMENTO POSITIVOS
        INC X                   ; INCREMENTO X PARA PASAR DE NUMERO
        BRA DATO                ; SALTO A DATO

  CERO: INC $85                 ; INCREMENTO CANTIDAD DE CERO
        INC X                   ; INCREMENTO X PARA PASAR DE NUMERO
        BRA DATO                ; SALTO A DATO

   NEG: INC $87                 ; INCREMENTO CANTIDAD DE NEGATIVOS
        INC X                   ; INCREMENTO X PARA PASAR DE NUMERO
        BRA DATO                ; SALTO A DATO

   FIN: SWI                     ; FIN DE PROGRAMA. INT POR SOFT
        ORG $FFFA
        DW $EE00
