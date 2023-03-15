;############################################################################################################
; PROJECT TITLE:
; --------------
;
; "ZOINHO - IN THE GARDEN OF FOOLS"
; (Original title in Portuguese language: "ZOINHO - NO JARDIM DOS TOLOS")
;
; NB:
;
;    A) This is an isometric 3D game for the 8bit micro computer ZX SPECTRUM 48KBi.
;    B) ZX SPECTRUM was developed by Sinclair Research and are trademarks of Sky Group.
;
; -----------------------------------------------------------------------------------------------------------
;
; This file is part of the "ZOINHO - IN THE GARDEN OF FOOLS" distribution (http://github.com/ZOINHOZX/ZOINHO).
; (C) 2019-2023 RICARDO C. NUNES
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program. If not, see <http://www.gnu.org/licenses/>.
;
; -----------------------------------------------------------------------------------------------------------
;
; ZOINHO - IN THE GARDEN OF FOOLS © 2019-2023 by RICARDO C. NUNES is licensed under CC BY-NC-SA 4.0
;
; Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
;
; This is a human-readable summary of (and not a substitute for) the license. Disclaimer.
;
; You are free to:
;   Share — copy and redistribute the material in any medium or format
;   Adapt — remix, transform, and build upon the material
;
;   The licensor cannot revoke these freedoms as long as you follow the license terms.
;
;   You should have received a copy of the Attribution-NonCommercial-ShareAlike 4.0 International License
;   deed along with this projetc. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0>
;
; Under the following terms:
;   Attribution — You must give appropriate credit, provide a link to the license,
;   and indicate if changes were made. You may do so in any reasonable manner,
;   but not in any way that suggests the licensor endorses you or your use.
;
;   NonCommercial — You may not use the material for commercial purposes.
;
;   ShareAlike — If you remix, transform, or build upon the material,
;   you must distribute your contributions under the same license as the original.
;
;   No additional restrictions — You may not apply legal terms or technological measures
;   that legally restrict others from doing anything the license permits.
;
; Notices:
;   You do not have to comply with the license for elements of the material in the public domain
;   or where your use is permitted by an applicable exception or limitation.
;
;   No warranties are given. The license may not give you all of the permissions necessary
;   for your intended use. For example, other rights such as publicity, privacy,
;   or moral rights may limit how you use the material.
;
; -----------------------------------------------------------------------------------------------------------
; SOURCE CODE:
; ------------
;
; The Z80 Assembly mnemonic source code and Sinclair ZX SPECTRUM BASIC source code
; for this game is licensed under the:
;
; GNU General Public License v3.0
;
; NB:
;
;    A) The Z80 Assembly source code for this game was written targetting the syntax
;       and functionalities provided by the "PASMO Z80 ASSEMBLER" by
;       (C) 2004-2022 Julian Albo.
;
;    B) The Sinclair ZX SPECTRUM BASIC source code is provided in a .tap file format.
;       And it can be viewed and edited and stitched together using the applications
;       "ZX-Edit" and "ZX-BlockEdit" by (C) Claus Jahn.
;
; -----------------------------------------------------------------------------------------------------------
; CREATIVE WORK:
; --------------
;
; The original creative work in this project, including the concept art, story,
; texts, graphics, resources, encoded assets and game play are licensed under the:
;
; Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
;
; NB:
;
;    A) The music encoded in this game is of public domain and it includes two themes:
;       - "Greensleeves" (a.k.a. "Green Leaves To A Ground"), English folk song.
;       - An extract from "Nocturne In F Major Opus 55 No 1", by Frederic Chopin.
;
;    B) Screens, sprites, character sets and other graphical assets were created and
;       formatted in .SCR, .ZXP and .CH8 file formats.
;       And they can be viewed and edited using the application "ZX-PaintBrush" by
;       (C) Claus Jahn.
;
;############################################################################################################

;############################################################################################################
; PROJECT TITLE:
; --------------
;
; "ZOINHO - IN THE GARDEN OF FOOLS"
; (Original title in Portuguese language: "ZOINHO - NO JARDIM DOS TOLOS")
;
; NB:
;
;    A) This is an isometric 3D game for the 8bit micro computer ZX SPECTRUM 48KBi.
;    B) ZX SPECTRUM was developed by Sinclair Research and are trademarks of Sky Group.
;
; -----------------------------------------------------------------------------------------------------------
;
; This file is part of the "ZOINHO - IN THE GARDEN OF FOOLS" distribution (http://github.com/ZOINHOZX/ZOINHO).
; (C) 2019-2023 RICARDO C. NUNES
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program. If not, see <http://www.gnu.org/licenses/>.
;
; -----------------------------------------------------------------------------------------------------------
;
; ZOINHO - IN THE GARDEN OF FOOLS © 2019-2023 by RICARDO C. NUNES is licensed under CC BY-NC-SA 4.0
;
; Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
;
; This is a human-readable summary of (and not a substitute for) the license. Disclaimer.
;
; You are free to:
;   Share — copy and redistribute the material in any medium or format
;   Adapt — remix, transform, and build upon the material
;
;   The licensor cannot revoke these freedoms as long as you follow the license terms.
;
;   You should have received a copy of the Attribution-NonCommercial-ShareAlike 4.0 International License
;   deed along with this projetc. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0>
;
; Under the following terms:
;   Attribution — You must give appropriate credit, provide a link to the license,
;   and indicate if changes were made. You may do so in any reasonable manner,
;   but not in any way that suggests the licensor endorses you or your use.
;
;   NonCommercial — You may not use the material for commercial purposes.
;
;   ShareAlike — If you remix, transform, or build upon the material,
;   you must distribute your contributions under the same license as the original.
;
;   No additional restrictions — You may not apply legal terms or technological measures
;   that legally restrict others from doing anything the license permits.
;
; Notices:
;   You do not have to comply with the license for elements of the material in the public domain
;   or where your use is permitted by an applicable exception or limitation.
;
;   No warranties are given. The license may not give you all of the permissions necessary
;   for your intended use. For example, other rights such as publicity, privacy,
;   or moral rights may limit how you use the material.
;
; -----------------------------------------------------------------------------------------------------------
; SOURCE CODE:
; ------------
;
; The Z80 Assembly mnemonic source code and Sinclair ZX SPECTRUM BASIC source code
; for this game is licensed under the:
;
; GNU General Public License v3.0
;
; NB:
;
;    A) The Z80 Assembly source code for this game was written targetting the syntax
;       and functionalities provided by the "PASMO Z80 ASSEMBLER" by
;       (C) 2004-2022 Julian Albo.
;
;    B) The Sinclair ZX SPECTRUM BASIC source code is provided in a .tap file format.
;       And it can be viewed and edited and stitched together using the applications
;       "ZX-Edit" and "ZX-BlockEdit" by (C) Claus Jahn.
;
; -----------------------------------------------------------------------------------------------------------
; CREATIVE WORK:
; --------------
;
; The original creative work in this project, including the concept art, story,
; texts, graphics, resources, encoded assets and game play are licensed under the:
;
; Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)
;
; NB:
;
;    A) The music encoded in this game is of public domain and it includes two themes:
;       - "Greensleeves" (a.k.a. "Green Leaves To A Ground"), English folk song.
;       - An extract from "Nocturne In F Major Opus 55 No 1", by Frederic Chopin.
;
;    B) Screens, sprites, character sets and other graphical assets were created and
;       formatted in .SCR, .ZXP and .CH8 file formats.
;       And they can be viewed and edited using the application "ZX-PaintBrush" by
;       (C) Claus Jahn.
;
;############################################################################################################

; =================================================================================
; INCLUDE - RoutineEngineControl
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; =============================================================
; -------------------------------------------------------------
; Memory Alloc: Gameplay control states
GameplayControlStates: DB %11111111 ; D5:LEFT, D4:DOWN, D3:UP, D2:RIGHT, D1:FIRE, D0:JUMP

; -------------------------------------------------------------
; Define Values: Sinclair / Interface II buttons
Button_Left:  EQU %00100000
Button_Down:  EQU %00010000
Button_Up:    EQU %00001000
Button_Right: EQU %00000100
Button_Fire:  EQU %00000010
Button_Jump:  EQU %00000001

; =============================================================
; Strings for Key mapping for Redefine Key option

StrTitleRedefineKeys DB "REDEFINIR TECLAS:", StrEOS

StrTitleDefineKeys DB "DEFINIR TECLAS:", StrEOS

; -------------------------------------------------------------
StrPointerVector:

StrPointerUp    DB CharPointerUp, StrEOS
StrPointerDown  DB CharPointerDown, StrEOS
StrPointerRight DB CharPointerRight, StrEOS
StrPointerLeft  DB CharPointerLeft, StrEOS

; -------------------------------------------------------------

StrJoystick DB "JOYSTICK", StrEOS

; -------------------------------------------------------------

StrJump DB "PULAR", StrEOS
StrFire DB "DISPARAR", StrEOS

; =============================================================
; Label: Speccy keyboard I/O port and key segments
SpeccyKeyboardPort EQU 0xFE

KeysSegmentBNMSsSp EQU %01111111 ; 0x7F
KeysSegmentHJKLEn  EQU %10111111 ; 0xBF
KeysSegmentYUIOP   EQU %11011111 ; 0xDF
KeysSegment67890   EQU %11101111 ; 0xEF

KeysSegment54321   EQU %11110111 ; 0xF7
KeysSegmentTREWQ   EQU %11111011 ; 0xFB
KeysSegmentGFDSA   EQU %11111101 ; 0xFD
KeysSegmentVCXZCs  EQU %11111110 ; 0xFE

; =============================================================
; Label: Speccy keyboard cursor keys masks
; -------------------------------------------------------------
; Cursor keys
MaskKeys5____ EQU %00010000 ; 0x10 ; mask D4
MaskKeys6____ EQU %00010000 ;
MaskKeys_7___ EQU %00001000 ;
MaskKeys__8__ EQU %00000100 ;
MaskKeys___9_ EQU %00000010 ;
MaskKeys____0 EQU %00000001 ;

MaskKeys67890 EQU %00011111 ; 0x1F ; mask D4,D3,D2,D1,D0

; =============================================================
; Label: Reserved keys masks
; -------------------------------------------------------------
MaskKeys____En EQU %00000001 ; Enter key
MaskKeys____Sp EQU %00000001 ; Space key
MaskKeys__X__  EQU %00000100 ; Key: "X"
MaskKeys_C___  EQU %00001000 ; Key: "C"
MaskKeys__M__  EQU %00000100 ; Key: "N"

; =============================================================
; Label: Input Control Choices
; -------------------------------------------------------------
ControlChoiceInterfaceII EQU 0x01
ControlChoiceKeyboard    EQU 0x02

; =============================================================
; Memory Alloc: Input Control Choice
; -------------------------------------------------------------
ControlChoice: DB ControlChoiceKeyboard

; =============================================================
; Routine: Controls read
; -------------------------------------------------------------
ControlsRead:

      CALL ControlsReadKeyboard

; -------------------------------------------------------------

ControlsReadEnd:

      RET

; =============================================================
; Routine: Controls read keyboard
; -------------------------------------------------------------
ControlsReadKeyboard:

; -------------------------------------------------------------

      LD HL,RedefinedKeyStrokes
      
      LD B,0x00

; -------------------------------------------------------------

      ; Up
      LD A,(HL)
      INC HL
      IN A,(SpeccyKeyboardPort)
      AND (HL)
      JR Z,ControlsReadKeyboardUpSkip

      LD B,Button_Up

ControlsReadKeyboardUpSkip:

; -------------------------------------------------------------

      ; Down
      INC HL
      LD A,(HL)
      INC HL
      IN A,(SpeccyKeyboardPort)
      AND (HL)
      JR Z,ControlsReadKeyboardDownSkip

      LD A,Button_Down
      OR B
      LD B,A

ControlsReadKeyboardDownSkip:

; -------------------------------------------------------------

      ; Right
      INC HL
      LD A,(HL)
      INC HL
      IN A,(SpeccyKeyboardPort)
      AND (HL)
      JR Z,ControlsReadKeyboardRightSkip

      LD A,Button_Right
      OR B
      LD B,A

ControlsReadKeyboardRightSkip:

; -------------------------------------------------------------

      ; Left
      INC HL
      LD A,(HL)
      INC HL
      IN A,(SpeccyKeyboardPort)
      AND (HL)
      JR Z,ControlsReadKeyboardLeftSkip

      LD A,Button_Left
      OR B
      LD B,A

ControlsReadKeyboardLeftSkip:

; -------------------------------------------------------------

      ; Jump
      INC HL
      LD A,(HL)
      INC HL
      IN A,(SpeccyKeyboardPort)
      AND (HL)
      JR Z,ControlsReadKeyboardJumpSkip

      LD A,Button_Jump
      OR B
      LD B,A

ControlsReadKeyboardJumpSkip:

; -------------------------------------------------------------

      ; Fire
      INC HL
      LD A,(HL)
      INC HL
      IN A,(SpeccyKeyboardPort)
      AND (HL)
      JR Z,ControlsReadKeyboardFireSkip

      LD A,Button_Fire
      OR B
      LD B,A

ControlsReadKeyboardFireSkip:

; -------------------------------------------------------------

      LD A,B

      ; Store control state
      LD (GameplayControlStates),A

; -------------------------------------------------------------

      RET ; Exit

; =============================================================
; Memory Alloc: Key character mapping for Redefine Key option

StrKeyMapping:

StrKeyMappingBNMSsSp DB "BNM", CharBtnSymbolShift, CharBtnSpace
StrKeyMappingHJKLEn  DB "HJKL", CharBtnEnter
StrKeyMappingYUIOP   DB "YUIOP"
StrKeyMapping67890   DB "67890"

StrKeyMapping54321   DB "54321"
StrKeyMappingTREWQ   DB "TREWQ"
StrKeyMappingGFDSA   DB "GFDSA"
StrKeyMappingVCXZCs  DB "VCXZ", CharBtnCapsShift

StrKeyMapped DB " ", StrEOS

; =============================================================
; Memory Alloc: Redefined keys IN port addresses and key mask

RedefinedKeyStrokes:

RedefinedKeyUp:    DB KeysSegment67890, MaskKeys_7___  ; keyboard segment address (IN port) & key mask
RedefinedKeyDown:  DB KeysSegment67890, MaskKeys6____  ; keyboard segment address (IN port) & key mask
RedefinedKeyRight: DB KeysSegment67890, MaskKeys__8__  ; keyboard segment address (IN port) & key mask
RedefinedKeyLeft:  DB KeysSegment54321, MaskKeys5____  ; keyboard segment address (IN port) & key mask
RedefinedKeyJump:  DB KeysSegment67890, MaskKeys____0  ; keyboard segment address (IN port) & key mask
RedefinedKeyFire:  DB KeysSegment67890, MaskKeys___9_  ; keyboard segment address (IN port) & key mask

; -------------------------------------------------------------

DefineKey5: DB KeysSegment54321, MaskKeys5____  ; keyboard segment address (IN port) & key mask
DefineKey6: DB KeysSegment67890, MaskKeys6____  ; keyboard segment address (IN port) & key mask
DefineKey7: DB KeysSegment67890, MaskKeys_7___  ; keyboard segment address (IN port) & key mask
DefineKey8: DB KeysSegment67890, MaskKeys__8__  ; keyboard segment address (IN port) & key mask
DefineKey9: DB KeysSegment67890, MaskKeys___9_  ; keyboard segment address (IN port) & key mask
DefineKey0: DB KeysSegment67890, MaskKeys____0  ; keyboard segment address (IN port) & key mask

; =============================================================
; Label: Mask all

RedefinedKeyIndexUp    EQU 0x00
RedefinedKeyIndexDown  EQU 0x02
RedefinedKeyIndexRight EQU 0x04
RedefinedKeyIndexLeft  EQU 0x06
RedefinedKeyIndexJump  EQU 0x08
RedefinedKeyIndexFire  EQU 0x0A

; =============================================================
; Label: Mask all
MaskNoPress EQU %10111111
MaskSomeKey EQU %00011111

; =============================================================
; Routine: Set InterfaceII key mapping
; -------------------------------------------------------------
ControlInterfaceIISet:

     LD DE,RedefinedKeyStrokes

; -------------------------------------------------------------

     ; Up
     LD HL,DefineKey8

     LDI
     LDI

; -------------------------------------------------------------

     ; Down
     LD HL,DefineKey7

     LDI
     LDI

; -------------------------------------------------------------

     ; Right
     LD HL,DefineKey9

     LDI
     LDI

; -------------------------------------------------------------

     ; Left
     LD HL,DefineKey6

     LDI
     LDI

; -------------------------------------------------------------

     RET

; =============================================================
; Routine: Set Cursor Keys key mapping
; -------------------------------------------------------------
ControlCursorKeysSet:

     LD DE,RedefinedKeyStrokes

; -------------------------------------------------------------

     ; Up
     LD HL,DefineKey7

     LDI
     LDI

; -------------------------------------------------------------

     ; Down
     LD HL,DefineKey6

     LDI
     LDI

; -------------------------------------------------------------

     ; Right
     LD HL,DefineKey8

     LDI
     LDI

; -------------------------------------------------------------

     ; Left
     LD HL,DefineKey5

     LDI
     LDI

; -------------------------------------------------------------

     RET

; =============================================================
; Routine: Redefine keys
;  A -> : Redefined key index
; DE <- : Pressed key text string pointer
; -------------------------------------------------------------
KeyBoardRedefine:

     PUSH BC
     PUSH HL

; -------------------------------------------------------------

     LD BC,RedefinedKeyStrokes
     
     INC A

     LD H,0x00
     LD L,A

     ADD HL,BC

     PUSH HL
     POP BC

; -------------------------------------------------------------
; Press hysteresis

KeyBoardRedefineInit:

     LD H,KeysSegmentBNMSsSp

; -------------------------------------------------------------
; Get Pressed key

     LD H,KeysSegmentBNMSsSp

; Key press
KeyBoardRedefineCheckKeysLoop:

     RRC H

     LD A,H
     IN A,(SpeccyKeyboardPort)
     AND MaskSomeKey
     CP MaskSomeKey
     JR NZ,KeyBoardRedefineCheckKeysSegmentIndexGet

     JR KeyBoardRedefineCheckKeysLoop

; -------------------------------------------------------------
; Get keyboard segment key mapping string and store them

KeyBoardRedefineCheckKeysSegmentIndexGet:

     PUSH AF ; holds pressed key

     XOR 0xFF
     AND MaskSomeKey

     LD (BC),A ; stores pressed key
     DEC BC

; -------------------------------------------------------------

     LD A,H ; holds corresponding keyboard segment IN address

     LD (BC),A ; stores keyboard segment IN address

; -------------------------------------------------------------
; Check that no key is repeated

     EX AF,AF'

     CALL KeyBoardRedefineValidateNoRepeat
     JR NC,KeyBoardRedefineInitSkip

     POP AF

     ; Warning sound when key is repeated
     LD HL,JumpBeeperTemplate
     CALL PlayBeeper

     ; Try again
     JR KeyBoardRedefineInit

KeyBoardRedefineInitSkip:

     EX AF,AF'

; -------------------------------------------------------------
; Map key stroke to key string

     LD HL,StrKeyMapping-0x0005

     LD DE,0x0005

KeyBoardRedefineCheckKeysSegmentIndexGetLoop:

     ADD HL,DE ; HL holds pointer to corresponding keyboard segment key mapping string

     RLA
     JR C,KeyBoardRedefineCheckKeysSegmentIndexGetLoop

; -------------------------------------------------------------

     POP AF ; restore pressed key

; -------------------------------------------------------------
; Get key text from segment string

KeyBoardRedefineCheckKeysGetString:

     LD DE,0x00FF

KeyBoardRedefineCheckKeysGetStringLoop:

     INC E

     RRA
     JR C,KeyBoardRedefineCheckKeysGetStringLoop

     LD A,0x04
     SUB E
     LD E,A

     ADD HL,DE
     
     LD A,(HL)
     
     LD DE,StrKeyMapped
     
     LD (DE),A ; DE holds key text pointer

; -------------------------------------------------------------

KeyBoardReadEnd:

      POP HL
      POP BC

      RET

; =============================================================
; Routine: Redefine validate no repeated key
; BC -> : Current redefined key stroke
; -------------------------------------------------------------
KeyBoardRedefineValidateNoRepeat:

     INC BC

     PUSH BC
     
     DEC BC

; -------------------------------------------------------------

     PUSH BC
     POP HL

     LD DE,RedefinedKeyStrokes

     XOR A
     SBC HL,DE
     
     SRL L
     JR Z,KeyBoardRedefineValidateNoRepeatEnd

     LD E,L

; -------------------------------------------------------------

     LD HL,RedefinedKeyStrokes

KeyBoardRedefineValidateNoRepeatLoop:
     
     PUSH BC
     PUSH HL

     LD D,(HL)
     LD A,(BC)

     CP D
     JR NZ,KeyBoardRedefineValidateNoRepeatSkip

     INC HL
     INC BC

     LD D,(HL)
     LD A,(BC)

     CP D
     JR NZ,KeyBoardRedefineValidateNoRepeatSkip

     SCF ; Repeated key

     POP HL
     POP BC

     JR KeyBoardRedefineValidateNoRepeatEnd

KeyBoardRedefineValidateNoRepeatSkip:

     POP HL
     POP BC

     INC HL
     INC HL

     DEC E
     JR NZ,KeyBoardRedefineValidateNoRepeatLoop

     XOR A ; Key is not repeated

; -------------------------------------------------------------

KeyBoardRedefineValidateNoRepeatEnd:

     POP BC

; -------------------------------------------------------------

     RET

; =============================================================

MACRO M_HALT

  DI

  PUSH AF

  M_HALT_LOOP:

      LD A,KeysVCXZCs
      IN A,(SpeccyKeyboardPort)
      AND MaskKeys__X__
      JR NZ,M_HALT_LOOP

  POP AF

  EI

ENDM