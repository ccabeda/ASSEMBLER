        ; DEL NUMERO $AA, CONTAR LA CANTIDAD DE 0 Y 1 DE SUS BITS
        ; SI LA CANTIDAD DE 1 ES MAYOR, VER SI ES PAR O IMPAR.
        ;SI ES PAR GUARDAR EN POS $94 EL VALOR $05, SI ES IMPAR DIVIDO $AA POR 5 Y GUAARDO EN POS $94.
        ;SINO HACER 5X4 Y GUYARDAR EL RESULTADO EN LA POS $94.

        ORG $80                 ; INICIO MEMORIA
        DB $AA                  ; NUMERO A CONTAR
        DB $09                  ; CANTIDAD DE BITS +1
        DB $00                  ; CANTIDAD DE CEROS
        DB $00                  ; CANTIDAD DE UNOS
        ORG $94                 ; INICIO MEMORIA EN POS $94
        DB $00                  ; PARA GUARDAR

        ORG $EE00               ; INICIO PROGRAMA
        CLRA                    ; LIMPIO ACUMULADOR
 DATO:  DEC $81                 ; DECREMENTO CANTIDAD DE BITS
        LDA $81                 ; ACU= $81
        CBEQA #$00 SAL          ; SI NO HAY MAS BITS QUE SALTE A SAL
        LDA $80                 ; ACU= $80
        ASLA                    ; CARGO EN ACU EL BIT MAS SIGNIFICATIVO
        BCC CERO                ; SI ES CERO QUE SALTE
        INC $83                 ; AUMENTAMOS CANTIDAD DE UNOS
        BRA DATO                ; SALTO A DATO

  CERO: INC $82                 ; AUMENTAMOS CANTIDAD DE CEROS
        BRA DATO                ; SALTO A DATO

   SAL: LDA $82                 ; ACU=  CANTIDAD DE CEROS
        CMP $83                 ; CMP = CANTIDAD DE UNOS
        BHI MASUNO              ; SI HAY MAS UNOS QUE SALTE
        LDA #$05                ; ACU = #$05
        LDX #$04                ; X= #$04
        MUL                     ; MULTIPLICAMOS 5X4
        STA $94                 ; GUARDAMOS EN LA POS $94 EL RESULTADO
        BRA FIN                 ; SALTO A FIN

MASUNO: LDA $83                 ; CARGO EN ACU LA CANTIDAD DE UNOS
        AND #01                 ; MASCARA AND PARA QUEDARME CON EL BIT MENOS SIGNIFICATIVO
        BEQ PAR                 ; SALTA SI ES PAR
        LDHX #$0A05             ; H= #$0A X= #$05
        LDA #$0A                ; ACU= #$0A
        DIV                     ; DIVIDO #$AA/#$05
        STA $94                 ; GUARDO EN POS 94
        BRA FIN                 ; SALTO A FIN

   PAR: LDA #$05                ; ACU = #$05
        STA $94                 ; GUARDO EN LA POS 94
        BRA FIN                 ; SALTO A FIN

   FIN: SWI                     ; TERMINACION PROGRAMA. INT POR SOFT
        ORG $FFFA
        DW $EE00



