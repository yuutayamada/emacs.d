; Subroutine File for the 16F690
;
; This software is provided to users "as is" without any warranty,
; support, or claim that it is bug free.  It is the user's
; responsibility to write, debug, and fix their own code that
; connects with these subroutines.  The author of these subroutines
; will not be providing any technical support for this code.


        __CONFIG b'001111000100'    ; 16F690 config.
        RADIX  DEC

; 16F690  Registers and Bits
; #INCLUDE <p16F690.inc>      ; <-- Contains Standard Definitions
; Use absolute path because I don't know how to add include path.
#include "/home/uta/share/devkit/microchip/MPLAB/mpasmx/p16f690.inc"      ; <-- Contains Standard Definitions

; standard parameters for this lab
#include "./lab16f690_parametors.inc"

; I added at stepping motor project
; Those SLOW and QUICK are passed to WAIT_SHORT subroutine
; and the limit is 255.
SLOW  equ 100  ; mSec
QUICK equ 50  ; mSec
TIMES equ 12  ; number of times to rotate full degree

;===================================================================
; The Start Of The Main Code (Your Code) Goes Below
; Do Not Make ANY Changes Above this line
;===================================================================
; LED(DS1-DC4) => RC0-RC3 in PORTC
; switch1 => PORTA RC3(3rd bit)

START:
        ; (1) Wait Button input
        btfsc PORTA, 3  ; wait until switch input (PORTA 3rd bit)
        goto START

        ; (2) CW slow
        movlw SLOW
        movwf DURATION
        call CW360    ; I include (3) this subroutine

        ; (4)
        call Wait

        ; (5)
        movlw SLOW
        movwf DURATION
        call CCW360

        ; (6)
        call Wait

STEP7:
        ; (7) Wait Button input
        btfsc PORTA, 3  ; wait until switch input (PORTA 3rd bit)
        goto STEP7

        ; (8)
        movlw QUICK
        movwf DURATION
        call CW360

        ; (9)
        call Wait

        ; (10)
        movlw QUICK    ; Probably this assignment does not need...
        movwf DURATION    ; because already set at (8)
        call CCW360

        ; (11)
        call Wait

        goto START    ; (12)

;===================================================================
; All user subroutines go here.
;===================================================================
Tick:
        ; This subroutine needs to be set W register to
        ; decide the output. (for example movlw b'0001')
        movwf PORTC
        movfw DURATION
        call WAIT_SHORT    ;  wait DURATION [msec]
        return

CW30:   ; Rotate 30 degree to Clock Wise
        movlw b'0001'
        call Tick
        movlw b'0010'
        call Tick
        movlw b'0100'
        call Tick
        movlw b'1000'
        call Tick
        return

CW360:  ; Rotate full degree to Clock Wise
        movlw TIMES
        movwf COUNT
CW360_core:
        call CW30
        decfsz COUNT, F
        goto CW360_core
        ; (3)
        movlw b'0001'
        call	Tick
        return

CCW30: ; Rotate 30 degree to Counter Clock Wise
        movlw b'1000'
        call Tick
        movlw b'0100'
        call Tick
        movlw b'0010'
        call Tick
        movlw b'0001'
        call Tick
        return

CCW360: ; Rotate full degree to Counter Clock Wise
        movlw TIMES
        movwf COUNT
CCW360_core:
        call CCW30
        decfsz COUNT, F
        goto CCW360_core
        return

Wait:
        movlw	1
        call WAIT_LONG    ; wait 1/4 seconds
        return

;===================================================================
; predefined sub routins
#include "./subroutins.inc"      ; <-- Contains Standard Definitions

; Don't put anything below the END Directive
        END
