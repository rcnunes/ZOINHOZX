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

; =================================================================================
; INCLUDE - RoutineEngineText
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; ---------------------------------------------------------------------------------
; Memory Alloc: Custom character set data

INCLUDE "resources/ZoinhoCharsetData_I01.asm"

; =============================================================
; Labels: ASCII Control Characters
; -------------------------------------------------------------
StrEOS     EQU 0x00
StrNewLine EQU "\n"

CharSetAddress EQU ZoinhoCharset
SpeccyRomCharFirst EQU CharBottomRightCorner

; =============================================================
; Routine: Print text string
; -------------------------------------------------------------
; -> DE: String
; -> BC: Coordinates (B: Column; C: Line)
; -> A : Color attribute
; -------------------------------------------------------------
StrPrint:

    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------

    CALL StrPrintAttr

; -------------------------------------------------------------

    ; Get buffer screen initial address
    LD HL,BufferScreenAddress

    LD A,B

    LD B,C
    LD C,0x00

    ADD A,C
    LD C,A

    ADD HL,BC

    ; Preserve buffer screen initial address
    DEC HL
    PUSH HL
    PUSH HL

; -------------------------------------------------------------

StrPrintLoop:

    ; Get character ROM initial address
    LD A,(DE)

    CP StrEOS
    JR Z,StrPrintEnd

    CP StrNewLine
    JR NZ,StrPrintNewLineSkip

StrPrintNewLine:

    POP HL
    POP HL
    LD BC,0x0100
    ADD HL,BC
    PUSH HL
    PUSH HL

    INC DE
    LD A,(DE)

    CP StrEOS
    JR Z,StrPrintEnd

    CP StrNewLine
    JR Z,StrPrintNewLine

StrPrintNewLineSkip:

    INC DE
    SUB SpeccyRomCharFirst

    LD B,0x00
    LD C,A

    SLA C
    RL B
    SLA C
    RL B
    SLA C
    RL B

    LD HL,CharSetAddress

    ADD HL,BC

; -------------------------------------------------------------

    PUSH HL
    POP BC

    POP HL
    INC HL
    PUSH HL

    LD A,0x08

StrPrintCharLoop:

    EX AF,AF'

    LD A,(BC)
    INC BC

    LD (HL),A

    PUSH DE

    LD DE,0x0020
    ADD HL,DE

    POP DE

    EX AF,AF'

    DEC A
    JR NZ,StrPrintCharLoop

    JR StrPrintLoop

; -------------------------------------------------------------

StrPrintEnd:

    POP HL
    POP HL

; -------------------------------------------------------------

    POP AF
    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Print text string color
; -------------------------------------------------------------
; -> DE: String
; -> BC: Coordinates (B: Column; C: Line)
; -> A : Color attribute
; -------------------------------------------------------------
StrPrintAttr:

    PUSH HL
    PUSH DE
    PUSH BC

    EX AF,AF'

    LD A,ColourPaletteBrightMagenta
    LD (RainbowColor),A

; -------------------------------------------------------------

    ; Get buffer screen initial address
    LD HL,BufferScreenAttrAddressLow

    LD A,B

    LD B,C
    LD C,0x00

    SRL B
    RR C
    SRL B
    RR C
    SRL B
    RR C

    ADD A,C
    LD C,A

    ADD HL,BC

    PUSH HL
    PUSH HL

; -------------------------------------------------------------

StrPrintAttrLoop:

    LD A,(DE)

    CP StrEOS
    JR Z,StrPrintAttrEnd

    CP StrNewLine
    JR NZ,StrPrintAttrNewLineSkip

    POP HL
    POP HL
    LD BC,0x0020
    ADD HL,BC
    PUSH HL
    PUSH HL

    INC DE

    JR StrPrintAttrLoop

StrPrintAttrNewLineSkip:

; -------------------------------------------------------------

    POP HL

    EX AF,AF'

    CP ColourPaletteRainbow
    JR NZ,StrPrintAttrRainbowSkip

    LD C,A

    LD A,(RainbowColor)

    LD (HL),A
    INC HL

    INC A
    CP ColourPaletteCycle
    JR C,StrPrintAttrRainbowColourUpdate

    LD A,ColourPaletteBrightMagenta

StrPrintAttrRainbowColourUpdate:

    LD (RainbowColor),A

    LD A,C

    JR StrPrintAttrContinue

StrPrintAttrRainbowSkip:

    LD (HL),A
    INC HL

StrPrintAttrContinue:

    EX AF,AF'

    INC DE

    PUSH HL

    JR StrPrintAttrLoop

; -------------------------------------------------------------

StrPrintAttrEnd:

    POP HL
    POP HL

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Memory Alloc: Scroll elements
; -------------------------------------------------------------
StrSpace: DB " ", StrEOS
StrScrollLeftTopCorner: DB CharScrollLeftTopCorner, StrEOS
StrScrollRightTopCorner: DB CharScrollRightTopCorner, StrEOS
StrScrollLeftBottomCorner: DB CharScrollLeftBottomCorner, StrEOS
StrScrollRightBottomCorner: DB CharScrollRightBottomCorner, StrEOS

; =============================================================
; Memory Alloc: Scroll dimensions
; -------------------------------------------------------------
ScrollDimensions:

ScrollColumns: DB 0x00
ScrollLines:   DB 0x00

; =============================================================
; Memory Alloc: Space fill
; -------------------------------------------------------------
StrSpaceFill: DB " ", StrEOS

; =============================================================
; Macro: Place top scroll curls
; -------------------------------------------------------------
PlaceTopCurls:

    PUSH BC

; -------------------------------------------------------------

    LD A,ColourPaletteBrightYellow
    LD DE,StrScrollLeftTopCorner
    CALL StrPrint

; -------------------------------------------------------------

    INC B

    LD DE,StrSpaceFill

    LD A,(ScrollColumns)
    DEC A
    LD H,A

    LD A,ColourPaperBrightYellow

ScrollTopFillLoop:

    CALL StrPrint

    INC B

    DEC H
    JR NZ,ScrollTopFillLoop

; -------------------------------------------------------------

    LD A,ColourPaletteBrightYellow
    LD DE,StrScrollRightTopCorner
    CALL StrPrint

; -------------------------------------------------------------

    POP BC

    RET

; =============================================================
; Macro: Place scroll clear line
; -------------------------------------------------------------
PlaceClearLine:

    PUSH BC

; -------------------------------------------------------------

    LD DE,StrSpaceFill

    LD A,(ScrollColumns)
    LD H,A

    LD A,ColourPaperBrightYellow

ScrollClearLineFillLoop:

    CALL StrPrint

    INC B

    DEC H
    JR NZ,ScrollClearLineFillLoop

; -------------------------------------------------------------

    LD A,ColourPaperBlack
    CALL StrPrint

; -------------------------------------------------------------

    POP BC

    RET

; =============================================================
; Macro: Place bottom scroll curls
; -------------------------------------------------------------
PlaceBottomCurls:

    PUSH BC

; -------------------------------------------------------------

    LD A,ColourPaletteBrightYellow
    LD DE,StrScrollLeftBottomCorner
    CALL StrPrint

; -------------------------------------------------------------

    INC B

    LD DE,StrSpaceFill

    LD A,(ScrollColumns)
    DEC A
    LD H,A

    LD A,ColourPaperBrightYellow

PlaceBottomCurlsLoop:

    CALL StrPrint

    INC B

    DEC H
    JR NZ,PlaceBottomCurlsLoop

; -------------------------------------------------------------

    LD A,ColourPaletteBrightYellow
    LD DE,StrScrollRightBottomCorner
    CALL StrPrint

; -------------------------------------------------------------

    POP BC

    RET

; =============================================================
; Label: Scroll Display (enable / disable input)
; -------------------------------------------------------------
ScrollDisplayInputEnabled  EQU 0x00
ScrollDisplayInputDisabled EQU 0xFF

; =============================================================
; Memory Alloc: Scroll Display (enable / disable input flag)
; -------------------------------------------------------------
ScrollDisplayInputflag: DB ScrollDisplayInputEnabled

; =============================================================
; Routine: Scroll Display
; -------------------------------------------------------------
; -> DE: String
; -> BC: Coordinates (B: Column; C: Line)
; -------------------------------------------------------------
ScrollDisplay:

    PUSH DE
    PUSH BC

; -------------------------------------------------------------
; Calculate text dimensions

    CALL ScrollDimensionsGet

; -------------------------------------------------------------
; Display scroll at initial unrolled state

    CALL PlaceTopCurls

    INC C

    CALL PlaceBottomCurls

; -------------------------------------------------------------
; Restore original position

    POP BC
    PUSH BC

; -------------------------------------------------------------
; Animate unrolling of scroll

    INC C

    LD HL,ZoinhoDeadBeeperTemplate
    CALL PlayBeeperInterleavedClear

; -------------------------------------------------------------

    LD A,(ScrollDisplayInputflag)
    CP ScrollDisplayInputEnabled
    JR Z,ScrollDisplayExitMessage

    LD A,(ScrollLines)
    DEC A
    LD L,A

    JR ScrollDisplayLoop

; -------------------------------------------------------------

ScrollDisplayExitMessage:

    LD A,(ScrollLines)
    INC A
    INC A
    LD L,A

; -------------------------------------------------------------

ScrollDisplayLoop:

    CALL PlaceClearLine

    INC C

    CALL PlaceBottomCurls

; -------------------------------------------------------------
; Refresh animation and play sound

    PUSH BC
    PUSH HL

    CALL SwapScreenBufferAll

    LD HL,ZoinhoDeadBeeperTemplate
    CALL PlayBeeperInterleaved

    POP HL
    POP BC

; -------------------------------------------------------------
; Loop through animation

    DEC L
    JR NZ,ScrollDisplayLoop

; -------------------------------------------------------------
; Restore initial position and display the actual text

    POP BC
    POP DE

    INC B
    INC C

    PUSH BC

    LD A,ColourPaperBrightYellow
    CALL StrPrint

; -------------------------------------------------------------

    POP BC

    LD A,(ScrollLines)
    ADD A,C
    DEC A
    LD C,A

; -------------------------------------------------------------

    LD A,(ScrollDisplayInputflag)
    CP ScrollDisplayInputEnabled
    JR NZ,ScrollDisplayEnd

; -------------------------------------------------------------

    LD A,ColourPaperBrightYellow
    LD DE,StrScrollDisplayExit
    CALL StrPrint

; -------------------------------------------------------------

    CALL SwapScreenBufferAll

; -------------------------------------------------------------

ScrollPressEnterLoop:

    LD A,KeysSegmentVCXZCs
    IN A,(SpeccyKeyboardPort)
    AND MaskKeys__X__

    JR NZ,ScrollPressEnterLoop

; -------------------------------------------------------------

ScrollDisplayEnd:

    CALL SwapScreenBufferAll

; -------------------------------------------------------------

    RET

; =============================================================
; Routine: Scroll Dimensions Get
; -------------------------------------------------------------
ScrollDimensionsGet:

   PUSH DE
   PUSH BC

; -------------------------------------------------------------

   LD BC,0x0000
   
   LD (ScrollDimensions),BC

; -------------------------------------------------------------

ScrollDimensionsGetLoop:

   LD A,(DE)
   INC DE
   
   INC C

   CP StrNewLine
   JR NZ,ScrollDimensionsGetSkipLineCount

   INC B

   LD A,(ScrollColumns)
   CP C
   JR NC,ScrollDimensionsGetSkipColumnUpdate

   LD A,C
   LD (ScrollColumns),A

ScrollDimensionsGetSkipColumnUpdate

   LD C,0x00

   JR ScrollDimensionsGetLoop

ScrollDimensionsGetSkipLineCount:

   CP StrEOS
   JR Z,ScrollDimensionsGetEnd

   JR ScrollDimensionsGetLoop

; -------------------------------------------------------------

ScrollDimensionsGetEnd:

   INC B
   INC B

   LD A,B

   LD (ScrollLines),A

; -------------------------------------------------------------

   LD A,(ScrollColumns)
   CP C
   JR NC,ScrollDimensionsGetSkipColumnUpdateFinal

   LD A,C
   LD (ScrollColumns),A

ScrollDimensionsGetSkipColumnUpdateFinal:

; -------------------------------------------------------------

   LD A,(ScrollColumns)
   INC A
   LD (ScrollColumns),A

; -------------------------------------------------------------

   POP BC
   POP DE

   RET
