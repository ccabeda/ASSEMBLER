        ; RECORRER LISTA DE VALORES. CONTAR LOS QUE SON MAYORES A $0A



        ORG $80                   ; INICIO MEMORIA
        DB $09,$0A,$0B,$0F        ; LISTA DE NUMEROS    80 A 83
        DB $05                    ; CANTIDAD DE ELEMENTOS +1 DE LA LISTA        84
        DB $00                    ; CANTIDAD DE VALORES MAYORES A $0A           85
        DB $0A                    ; NUMERO A COMPARAR   86

        ORG $EE00                 ; INICIO PROGRAMA
        CLRA                      ; LIMPIO ACUMULADOR
        LDX #$80                  ; X= #$80
  DATO: DEC $84                   ; DECREMENTAMOS CANTIDAD DE ELEMENTOSA DE LA LISTA
        LDA $84                   ; ACU= $84
        CBEQA #$00 FIN            ; SI NO HAY MAS ELEMENTOS EN LA LISTA SALTA A FIN
        LDA ,X                    ; CARGAMOS EN ACU LO QUE INDICA X
        CMP $86                   ; COMPARAMOS CON LO DE LA POS $86
        BHI MAYOR                 ; SI ES MAYOR SALTA
        INC X                     ; INCREMENTAMOS X PARA PASAR DE NUMERO EN LA LISTA
        BRA DATO                  ; SALTA A DATO

 MAYOR: INC $85                   ; INCREMENTAMOS LA CANTIDAD DE VALORES MAYORES A $0A
        INC X                     ; INCREMENTAMOS X PARA PASAR DE NUMERO EN LA LISTA
        BRA DATO                  ; SALTA A DATO

   FIN: SWI                       ; FIN DE PROGRAMA. INT POR SOFT
        ORG $FFFA
        DW $EE00





