#INCLUDE <P16F628A.INC>

	__CONFIG _BODEN_ON & _CP_OFF & _PWRTE_ON & _WDT_OFF & _LVP_OFF & _MCLRE_ON & _HS_OSC
	#DEFINE BANK0 BCF STATUS,RP0 ;Seleciona Banco 0 de memória RAM
	#DEFINE BANK1 BSF STATUS,RP0 ;Seleciona Banco 1 de memória RAM

	CBLOCK 0x20 ; Endereço inicial de armazenamento das variáveis. Deve ser 0x20para o PIC16F628A
		VAR1 ;Endereço 0x20
		VAR2 ;Endereço 0x21
	ENDC ;Fim do bloco de memória

	ORG 0x00 ;Define localização da instrução seguinte na memória de programa GOTO INICIO

INICIO
		BANK1
		MOVLW B'00000000'
		MOVWF TRISA
		MOVLW B'00000000'
		MOVWF TRISB
		MOVLW B'00000000' ;Desabilita interrupções
		MOVWF INTCON
		BANK0
		MOVLW B'00000111' ;Desabilita comparadores analógicos e configura pinos do PORTA como E/S digitais
		MOVWF CMCON
		CLRF PORTB

MAIN
		BSF PORTB,2 ;Led ativado
		BSF PORTB,4 ;Led ativado
		BSF PORTB,6 ;Led ativado
		GOTO MAIN ; Volta para a sub-rotina MAIN
END