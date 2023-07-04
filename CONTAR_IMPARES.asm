        ;DE UNA LISTA DE 5 NUMEROS, CONTA LOS QUE SON IMPARES


        ORG $80                 ; INICIO MEMORIA
        DB $AA,$FF,$01,$C1,$F3  ; LISTA DE NUMEROS
        DB $00                  ; CANTIDAD DE IMPARES
        DB $06                  ; CANTIDAD DE NUMEROS +1

        ORG $EE00               ; INICIO PROGRAMA
        CLRA                    ; LIMPIO ACUMULADOR
        LDX #$80                ; X= #$80
  DATO: DEC $86                 ; DECREMENTAS CANTIDAD DE NUMEROS
        LDA $86                 ; ACU= $86
        CBEQA #$00 FIN          ; SI NO HAY MAS NUMEROS SALTA A FIN
        LDA ,X                  ; CARGAMOS EN ACU LO QUE INDICA X
        AND #01                 ; MASCARA AND PARA QUEDARNOS CON LE BIT MENOS SIGNIFICATIVO
        BEQ PAR                 ; SALTA SI ES PAR
        INC X                   ; INCREMENTO X PARA PASAR DE NUMERO
        INC $85                 ; INCREMENTO CANTIDAD DE IMPARES
        BRA DATO                ; SALTO A DATO

   PAR: INC X                   ; INCREMENTO X PARA PASAR DE NUMERO
        BRA DATO                ; SALTO A DATO

   FIN: SWI                     ; FIN DE PROGRAMA. INT POR SOFT
        ORG $FFFA
        DW $EE00
