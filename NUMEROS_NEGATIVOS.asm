           ;Determine la cantidad de n�meros negativos (Bit m�s significativo en uno)
           ;en un bloque de datos determinado. La longitud del bloque est� en la
           ;direcci�n $0091 y el bloque comienza en la direcci�n $0092. Coloque el
           ;resultado en la direcci�n $0090.

           ORG $90              ;INICIO MEMORIA
           DB $00               ; GUARDO CANTIDAD DE NEGATIVOS
           DB $04               ; CANTIDAD DE NUMEROS +1
           DB $AB,$FA,$CC,$01   ; LISTA DE NUMEROS
           DB $00               ; CANTIDAD DE NEGATIVOS

           ORG $EE00            ; INICIO PROGRAMA
           CLRA                 ; LIMPIO ACUMULADOR
           LDX #$92             ; X= #$92
   DATO:   DEC $91              ; DECREMENTO CANTIDAD DE NUMEROS
           LDA $91              ; ACU= $91
           CBEQA #$00 FIN       ; SI NO HAY MAS NUMEROS QUE SALTE A FIN
           LDA ,X               ; CARGO EN ACU LO QUE INDICA X
           ASLA                 ; ME QUEDO CON EL BIT MAS SIGNIFICATIVO
           BCS NEGATIVO         ; SI ES 1 QUE SALTE A NEGATIVO
           INC X                ; INCREMENTO X PARA PASAR DE NUMERO
           BRA DATO             ; SALTO A DATO

 NEGATIVO: INC $96              ; INCREMENTO CANTIDAD DE NEGATIVOS
           INC X                ; INCREMENTO X PARA PASAR DE NUMERO
           BRA DATO             ; SALTO A DATO

    FIN:   LDA $96              ; ACU= $96
           STA $90              ; GUARDO EN LA POS 90 LO DE ACU
           SWI                  ; FIN DE PROGRAMA. INT POR SOFT
           ORG $FFFA
           DW $EE00



