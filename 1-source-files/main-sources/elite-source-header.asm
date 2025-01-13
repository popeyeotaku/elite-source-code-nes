; ******************************************************************************
;
; NES ELITE GAME SOURCE (iNES HEADER)
;
; NES Elite was written by Ian Bell and David Braben and is copyright D. Braben
; and I. Bell 1991/1992
;
; The code in this file has been reconstructed from a disassembly of the version
; released on Ian Bell's personal website at http://www.elitehomepage.org/
;
; The commentary is copyright Mark Moxon, and any misunderstandings or mistakes
; in the documentation are entirely my fault
;
; The terminology and notations used in this commentary are explained at
; https://elite.bbcelite.com/terminology
;
; The deep dive articles referred to in this commentary can be found at
; https://elite.bbcelite.com/deep_dives
;
; ------------------------------------------------------------------------------
;
; This source file contains the iNES header for NES Elite.
;
; ------------------------------------------------------------------------------
;
; This source file produces the following binary file:
;
;   * header.bin
;
; ******************************************************************************

 INCLUDE "1-source-files/main-sources/elite-build-options.asm"

 _NTSC = (_VARIANT = 1)
 _PAL  = (_VARIANT = 2)

; ******************************************************************************
;
; ELITE iNES HEADER
;
; Produces the binary file header.bin.
;
; ******************************************************************************

 CODE% = $8000          ; The address where the code will be run

 LOAD% = $8000          ; The address where the code will be loaded

 ORG CODE%

; ******************************************************************************
;
;       Name: iNES header
;       Type: Variable
;   Category: Start and end
;    Summary: The iNES header for running in an emulator
;  Deep dive: Splitting NES Elite across multiple ROM banks
;
; ******************************************************************************

 EQUS "NES"             ; Bytes #0 to #2 = identification string for iNES file

 EQUB $1A               ; Byte #3 = identification string terminator

 EQUB 8                 ; Byte #4 = 8 pages of 16K ROM = 128K

 EQUB 0                 ; Byte #5 = 0 = board uses CHR RAM

 EQUB $12               ; Byte #6 = mapper and WRAM configuration
                        ;
                        ;   * Bit 1 set = Cartridge contains battery-backed RAM
                        ;                 at $6000 to $7FFF
                        ;
                        ;   * Bits 4-7 = mapper number, %0001 = MMC1

 EQUB %1000             ; Byte #7: NES2.0 Header
 EQUB 0                 ; Byte #8
 EQUB 0                 ; Byte #9
 EQUB $70               ; Byte #10: save RAM size (64<<7=8K)
 EQUB $07               ; Byte #11: CHR-RAM size (64<<7=8K)
 EQUB $01               ; Byte #12: PAL NES timing
 EQUB 0                 ; Byte #13
 EQUB 0                 ; Byte #14
 EQUB $01               ; Byte #15: uses standard NES controllers

; ******************************************************************************
;
; Save header.bin
;
; ******************************************************************************

 PRINT "S.header.bin ", ~CODE%, " ", ~P%, " ", ~LOAD%, " ", ~LOAD%
 SAVE "3-assembled-output/header.bin", CODE%, P%, LOAD%
