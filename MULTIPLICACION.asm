        ; MULTIPLICA DOS NUMEROS
        
        ORG $80         ;INICIO MEMORIA
        DB $85,$F2      ; NUMEROS 
        
        ORG $EE00       ; INICIO PROGRAMA
        LDA $80         ; ACU= $80   
        LDX $81         ; X= $81    
        MUL             ; MLUTIPLICO       
        SWI             ; FIN DE PROGRAMA       
        
        ORG $FFFA
        DW $EE00
