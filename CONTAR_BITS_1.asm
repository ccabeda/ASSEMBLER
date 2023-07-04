        ;CONTAR 1 DE LOS BITS DEL NUMERO $65. SI ES IMPAR, GUARDAR UN DOS EN LA POS $94, SI ES PAR DIVIDIR POR 2

        ORG $80         ; INICIO MEMORIA
        DB $65          ; NUMERO A CONTAR
        DB $09          ; CANTIDAD DE BITS +1
        DB $00          ; CANTIDAD DE UNOS
        ORG $94         ; INICIO EN POS 94
        DB $00          ; DONDE GUARDAR EL 2


        ORG $EE00       ; INICIO PROGRAMA
        CLRA            ; LIMPIO ACUMULADOR
 DATO:  DEC $81         ; DECREMENTO CANTIDAD DE BITS
        LDA $81         ; ACU= $81
        CBEQA #$00 PARI ; COMPARO SI LA CANTIDAD DE BITS ES IGUAL A CERO
        LDA $80         ; ACU = $80
        ASLA            ; ACU= BIT MAS IMPORTANTE
        BCS UNO         ; SI ES UNO QUE SALTE A UNO
        BRA DATO        ;SALTO A DATO

 UNO:   INC $82         ; AUMENTO CANTIDAD DE UNOS
        BRA DATO        ; SALTO A DATO

 PARI:  LDA $82         ; ACU= CANTIDAD DE UNOS
        AND #$01        ;MASCARA PARA QUDARNOS BIT MENOS SIGNIFICATIVO. SI ES 0 ES PAR, SI ES 1 IMPAR
        BEQ PAR         ; SALTA SI ES PAR
        LDA #$02        ; ACU = #$02
        STA $94         ; GUARDO EN LA POS DE MEMORIA 94 LO DE ACU
        BRA FIN         ; SALTO A FIN

 PAR:   LDHX #$0602     ;  H= #$06 X= #$02
        LDA #$05        ; ACU= #$05
        DIV             ; DIVIDO $65/$02
        BRA FIN         ; SALTO A FIN

 FIN:   SWI             ; FIN DE PROGRAMA. INT POR SOFT
        ORG $FFFA
        DW $EE00
