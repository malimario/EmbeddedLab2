;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

   		mov.w #0023h, R4
   		mov.w #00FDh, R5

   		cmp R4, R5;

   		jl less;
   		jge greater_equal;

   		jmp $;

less:
		call #less_function;
		jmp $;

greater_equal:

		jeq equal
		call #greater_function;
		jmp $;

less_function:

		mov.w #000Ah, &2000h
		mov.w #0009h, &2002h
		mov.w #0008h, &2004h
		mov.w #0007h, &2006h
		mov.w #0006h, &2008h
		sub #1h, R4;
		ret;

equal:

		jmp $;

greater_function:

		mov.w #0001h, &2010h
		mov.w #0002h, &2012h
		mov.w #0003h, &2014h
		mov.w #0004h, &2016h
		mov.w #0005h, &2018h
		sub #1h, R4;
		ret;

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
