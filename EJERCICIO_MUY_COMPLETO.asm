        ; DE UNA LISTA DE 4 NUMEROS, QUEDARSE CON EL MENOR. LUEGO CONTAR BITS EN 
        ; UNO Y CERO DE ESE. SUMAR LAS CANTIDADES (SIEMPRE DA 8) Y VER SI ES PAR O IMPAR.
        ; SI ES PAR, VER SI ES MAYOR A $02 Y SI ES GUARDAR $09 EN POS 94.
        ; SI ES IMPAR, A $AA SUMALE $05 Y MULTIPLICALO POR $0A Y GUARDALO EN POS 90
        
        
        ORG $80                 ; INICIO MEMORIA
        DB $AB,$06,$05,$AF      ; LISTA DE NUMEROS  80 A 83
        DB $05                  ; CANTIDAD DE NUMEROS+1 84
        DB $FF                  ; GUARDO EL NUMERO MENOR 85
        DB $00                  ; CANTIDAD DE CEROS 86
        DB $00                  ; CANTIDAD DE UNOS 87
        DB $00                  ; SUMA CANTIDADES 88
        DB $09                  ; CANTIDAD DE BITS +1 89
        ORG $90                 ; INICIO MEMORI EN 90
        DB $00                  ; GUARDAR SI ES IMPAR
        ORG $94                 ; INICIO MEMORIA EN POS 94
        DB $00                  ; GUARDAR
        
        
        ORG $EE00               ; INICIO PROGRAMA
        LDX #$80                ; X= #$80
  DATO: DEC $84                 ; DECREMENTO CANTIDAD DE ELEMENTOS
        LDA $84                 ; ACU= $84
        CBEQA #$00 BITS         ; SI NO HAY MAS NUMEROS SALTA A SAL
        LDA, X                  ; CARGO EN ACU LO QUE INDICA X
        CMP $85                 ; COMPARO CON EL VALOR DE LA POS $85
        BLO MENOR               ; SALTA SI ES MENOR LO DE ACU
        INCX                    ; INCREMENTO EN X PARA CAMBIAR DE NUMERO
        BRA DATO                ; SALTO A DATO
        
 MENOR: STA $85                 ; GUARDO EN LA POS $85 EL NUMERO MENOR
        INCX                    ; INCREMENTO X PARA PASAR DE NUMERO
        BRA DATO                ; SALTO A DATO
        
  BITS: DEC $89                 ; DECREMENTO LA CANTIDAD DE BITS
        LDA $89                 ; CARGO EN ACU LA CANTIDAD DE BITS
        CBEQA #$00 SUMA          ; CUANDO DEJE DE HABER BITS SALTA A SUMA
        LDA $85                 ; CARGO EN ACU EL NUMERO MAS CHICO
        ASLA                    ; ME QUEDO CON EL BIT MAS SIGNIFICATIVO
        BCC CERO                ; SI ES CERO SALTA
        INC $87                 ; INCREMENTO CANTIDAD DE UNOS
        BRA BITS                ; SALTA A BITS
        
  CERO: INC $86                 ; INCREMENTO CANTIDAD DE CEROS
        BRA BITS                ; SALTO A BITS
        
  SUMA: LDA $87                 ; CARGO EN ACU CANTIDAD DE UNOS
        ADD $86                 ; LE SUMO LA CANTIDAD DE CEROS
        STA $88                 ; GUARDO LA SUMA EN LA POS DE MEMORIA $88
        LDA $88                 ; CARGO EN ACU LA SUMA
        AND #$01                ; ME QUEDO CON EL BIT MENOS SIGNIFICATIVO
        BEQ PAR                 ; SALTA SI ES PAR
        LDA #$AA                ; CARGO EN ACU = #$AA
        ADD #$05                ; LE SUMO #$05
        LDX #$01                ; X= #$01
        MUL                     ; MULTIPLICO
        STA $90                 ; GUARDO EN POS 90
        BRA FIN                 ; SALTO A FIN
        
   PAR: LDA $88                 ; CARGO LA SUMA EN ACU  
        CMP #$02                ; COMPARO CON #$02
        BHI MAYOR               ; SALTA SI ES MAYOR
        BRA FIN                 ; SI ES MENOR QUE SALTE A FIN
        
 MAYOR: LDA #$09                ; CARGO EN ACU #$09
        STA $94                 ; GUARDO EN POS 94
        BRA FIN                 ; SALTO A FIN
        
   FIN: SWI                     ; FIN DE PROGRAMA. INT POR SOFT
        ORG $FFFA
        DW $EE00
        
        
        
        
        
