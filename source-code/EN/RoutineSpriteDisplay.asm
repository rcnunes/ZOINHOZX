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
; INCLUDE - RoutineSpriteDisplay
; =================================================================================

; =============================================================
; Label: Colour Attribute flag values
; -------------------------------------------------------------
SpriteDataColourAttributeClash      EQU 0x00
SpriteDataColourAttributeMonochrome EQU 0xFF

; =============================================================
; Memory Alloc: Colour Attribute flags
SpriteDataColourAttributeFlag:   DB 0x00
SpriteDataColourAttributeChoice: DB SpriteDataColourAttributeClash

; =============================================================
; Memory Alloc: Current Monochrome Colour
SpriteDataColourAttributeMonochromeColour: DB ColourPaletteBrightCyan

; =============================================================
; Label: Zoinho Swimming Flag values
ZoinhoSwimmingFlagFalse EQU 0x00
ZoinhoSwimmingFlagTrue  EQU 0xFF

; =============================================================
; Label: Zoinho maximum sinking value
ZoinhoMaxSinkingValue EQU 0x10

; =============================================================
; Memory Alloc: Zoinho Swimming Flag and sinking counter
ZoinhoSwimmingFlag:   DB ColourPaletteBrightCyan
ZoinhoSinkingCounter: DB 0x00

; =============================================================
; Routine: Zoinho sinking routine
; -------------------------------------------------------------
ZoinhoSinking:

    PUSH AF
    PUSH DE

    CP ZoinhoID
    JR NZ,ZoinhoSinkingEnd

    LD A,(SharkTankFlag)
    CP SharkTankFlagTrue
    JR NZ,ZoinhoSinkingEnd

    LD A,ZoinhoID
    CALL DynamicSpriteSearchByID

    M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY
    LD A,(DE)

    CP 0x00
    JR NZ,ZoinhoSinkingEnd

    LD A,ZoinhoSwimmingFlagTrue
    LD (ZoinhoSwimmingFlag),A

    LD A,(ZoinhoSinkingCounter)
    CP ZoinhoMaxSinkingValue
    JR Z,ZoinhoSinkingEnd

    INC A

    LD (ZoinhoSinkingCounter),A

ZoinhoSinkingEnd:

    POP DE
    POP AF

    RET

; =============================================================
; Routine: Display Sprite
; -------------------------------------------------------------
; -> DE: sprite instance pointer
; -------------------------------------------------------------
DisplaySprite:

    PUSH HL

; -------------------------------------------------------------

    LD H,D
    LD L,E

; -------------------------------------------------------------

    ; Get sprite ID
    LD A,(HL)

    PUSH AF

; -------------------------------------------------------------
; Zoinho is swimming, or not

    CALL ZoinhoSinking

; -------------------------------------------------------------

    EX AF,AF'

; -------------------------------------------------------------
; Evaluate whether or not to display sprite

    ; Skip to display flag
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag

    LD A,(HL)

    CP SpriteInstanceDisplayFlagTrue
    JR NZ,DisplaySpriteEnd

; -------------------------------------------------------------
; Mask sprite ID to determine its class

    EX AF,AF'

    AND 0xF0

; -------------------------------------------------------------
; Static sprite class display routine

    CP SpriteStaticClassID
    JR C,DisplayStaticSpriteSkip

    CP SpriteBackgroundClassID
    JR NC,DisplayStaticSpriteSkip

    CALL DisplayStaticSprite

    JR DisplaySpriteEnd

DisplayStaticSpriteSkip:

; -------------------------------------------------------------
; Background sprite class display routine

    CP SpriteBackgroundClassID
    JR NZ,DisplayBackgroundSpriteSkip

    CALL DisplayBackgroundSprite

    JR DisplaySpriteEnd

DisplayBackgroundSpriteSkip:

; -------------------------------------------------------------
; Dynamic sprite class display routine

    CP SpriteDynamicClassID
    JR C,DisplayDynamicSpriteSkip

    CP SpriteCollectClassID
    JR NC,DisplayDynamicSpriteSkip

    CALL DisplayDynamicSprite

    JR DisplaySpriteEnd

DisplayDynamicSpriteSkip:

; -------------------------------------------------------------
; Collectable sprite class display routine

    CP SpriteCollectClassID
    JR C,DisplayCollectSpriteSkip

    CALL DisplayStaticSprite

    JR DisplaySpriteEnd

DisplayCollectSpriteSkip:

; -------------------------------------------------------------

DisplaySpriteEnd:

; -------------------------------------------------------------
; Is Zoinho swimming, then apply swim wake

    POP AF

    CALL ZoinhoSwimming

; -------------------------------------------------------------
; Zoinho is swimming flag cleared

    LD A,ZoinhoSwimmingFlagFalse
    LD (ZoinhoSwimmingFlag),A

; -------------------------------------------------------------

    POP HL

    RET

; -------------------------------------------------------------
; Memory Alloc: Display Sprite Pixel variables
SpriteDimension:

      SpriteDimensionColumns: DB 00
      SpriteDimensionLines:   DB 00

SpritePosition:

      SpritePositionLine:   DB 00
      SpritePositionColumn: DB 00

SpriteByteSize: DW 0x0000

SpriteDirOffset: DW 0x0000

; =============================================================
; Label: Horizontal Flip Flag
; -------------------------------------------------------------
SpriteDataHorizontalFlipFalse EQU 0x00
; Flip routine is triggered whenever Z direction is set
SpriteDataHorizontalFlipTrue  EQU SpriteFrontIsoZ

; =============================================================
; Routine: Display Simple Sprite Template
; -------------------------------------------------------------
; -> DE: Simple sprite template
; -> BC: Screen coordinates
; -------------------------------------------------------------
DisplaySimpleSprite:

    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------
; Read simple sprite template's dimensions

    EX DE,HL

    LD E,(HL) ; Columns dimension
    INC HL
    LD D,(HL) ; Lines dimension
    INC HL

    LD (SpriteDimension),DE

; -------------------------------------------------------------
; Get sprite's colour attribute value

    LD A,(HL) ; Colour attribute index
    INC HL

    EX AF,AF' ; Preserve colour attribute

; -------------------------------------------------------------
; Read simple sprite default direction

    LD A,(HL) ; Default direction, either X or Z
    INC HL

; -------------------------------------------------------------
; Get simple sprite's data pointer

    LD E,(HL)
    INC HL
    LD D,(HL)

; -------------------------------------------------------------

    EX AF,AF' ; Restore colour attribute / Preserve default direction
    LD H,A    ; Preserve colour attribute
; -------------------------------------------------------------

    ; Check whether data pointer is null, or not
    XOR A
    CP D
    JR Z,DisplaySimpleSpriteBlitterSkip

; -------------------------------------------------------------

    EX AF,AF' ; Restore default direction

; -------------------------------------------------------------

    ; Evaluate whether or not to display mirrored sprite
    CP SpriteDataHorizontalFlipTrue

    PUSH AF ; Preserve Z flag state
    CALL Z,BlitterBytewiseUnmaskedMirrored ; Display mirrored sprite unmasked data
    POP AF ; Restore Z flag state

    CALL NZ,BlitterBytewiseUnmasked ; Display sprite unmasked data

DisplaySimpleSpriteBlitterSkip:

; -------------------------------------------------------------

    LD A,H ; Restore colour attribute

    CALL ColourAttributePaint

; -------------------------------------------------------------

      POP AF
      POP BC
      POP DE
      POP HL

      RET

; =============================================================
; Routine: Display Sprite Frame Template
; -------------------------------------------------------------
; -> HL: Pointer to frame template
; -------------------------------------------------------------
DisplaySpriteFrameTemplate:

      PUSH HL
      PUSH DE
      PUSH BC
      PUSH AF

; -------------------------------------------------------------
; Get the number of sprites to be displayed

      LD A,(HL)
      INC HL

; -------------------------------------------------------------
; Loop through all sprites to be displayed

DisplaySpriteFrameTemplateLoop:

      ; Get sprite template pointer
      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL

      ; Get sprite screen position
      LD B,(HL)
      INC HL
      LD C,(HL)
      INC HL

      ; Display simple sprite
      CALL DisplaySimpleSprite

      ; Loop check
      DEC A
      JR NZ,DisplaySpriteFrameTemplateLoop

; -------------------------------------------------------------

      POP AF
      POP BC
      POP DE
      POP HL

      RET

; =============================================================
; Label: Pixel screen max line
ScreenPixelLineMax EQU 0xC0

; =============================================================
; Routine: Clip sprite data area, if outside visible screen
; -------------------------------------------------------------
; <-> DE: Sprite data pointer
; <-> BC: Sprite coordinate
; -------------------------------------------------------------
ClipSpriteDataArea:

      PUSH HL

; -------------------------------------------------------------

      LD A,ScreenPixelLineMax
      CP C
      JR NC,ClipSpriteDataShow

; -------------------------------------------------------------
; Line coordinate is outside visible screen

      ; Get line offset
      LD A,0xFF
      SUB C
      LD C,A
      INC C ; Carry overflow adjust -- otherwise the clipping algorithm fails

      ; Subtract line offset from dimension
      LD A,(SpriteDimensionLines)
      SUB C

      JR Z,ClipSpriteDataHide
      JR C,ClipSpriteDataHide

      LD (SpriteDimensionLines),A

      ; Offset sprite data pointer
      LD A,(SpriteDimensionColumns)
      LD H,0x00
      LD L,A ; Nr. of columns

      EX DE,HL

ClipSpriteDataAreaOffsetDataPointer:

      ADD HL,DE ; Add n columns to each offset line
      DEC C
      JR NZ,ClipSpriteDataAreaOffsetDataPointer

      EX DE,HL

      LD C,0x00

ClipSpriteDataShow:

      XOR A

      JR ClipSpriteDataAreaEnd

ClipSpriteDataHide:

      SCF

      JR ClipSpriteDataAreaEnd

; -------------------------------------------------------------

ClipSpriteDataAreaEnd:

      POP HL

      RET

; =============================================================
; Memory Alloc: Sprite Dimension Line Counter
; -------------------------------------------------------------
SpriteDimensionLineCounter: DB 0x00

; =============================================================
; Routine: Blitter Bytewise
; -------------------------------------------------------------
; -> DE: Sprite data pointer
; -> BC: Sprite coordinate
; -------------------------------------------------------------
BlitterBytewise:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Convert line coord to address offset
    CALL BlitterScreenAddressInit

; -------------------------------------------------------------

BlitterBytewiseLineLoop:

    ; Initialize column counter
    LD A,(SpriteDimensionColumns)

    EX DE,HL ; Flip data and screen pointers

; -------------------------------------------------------------

BlitterBytewiseColumnLoop:

    EX AF,AF' ; Preserve column counter

; -------------------------------------------------------------

    LD A,(DE) ; Get current screen byte
    AND (HL)  ; Apply sprite mask data
    INC HL    ; Move to sprite data
    OR (HL)   ; Apply sprite data
    LD (DE),A ; Write result byte back to screen
    INC DE
    INC HL

; -------------------------------------------------------------

    EX AF,AF' ; Restore column counter

    ; Evaluate column counter
    DEC A
    JR NZ,BlitterBytewiseColumnLoop

; -------------------------------------------------------------

    EX DE,HL ; Flip data and screen pointers back

    ; Offset screen address
    ADD HL,BC

    ; Evaluate line counter
    LD A,(SpriteDimensionLineCounter)
    DEC A
    LD (SpriteDimensionLineCounter),A
    JR NZ,BlitterBytewiseLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Blitter Bytewise - Unmasked
; -------------------------------------------------------------
; -> DE: Sprite data pointer
; -> BC: Sprite coordinate
; -------------------------------------------------------------
BlitterBytewiseUnmasked:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Convert line coord to address offset
    CALL BlitterScreenAddressInit

; -------------------------------------------------------------

BlitterBytewiseUnmaskedLineLoop:

    ; Initialize column counter
    LD A,(SpriteDimensionColumns)

    EX DE,HL ; Flip data and screen pointers

; -------------------------------------------------------------

BlitterBytewiseUnmaskedColumnLoop:

    EX AF,AF' ; Preserve column counter

; -------------------------------------------------------------

    LD A,(DE) ; Get current screen byte
    OR (HL)   ; Apply sprite data
    LD (DE),A ; Write result byte back to screen
    INC DE
    INC HL

; -------------------------------------------------------------

    EX AF,AF' ; Restore column counter

    ; Evaluate column counter
    DEC A
    JR NZ,BlitterBytewiseUnmaskedColumnLoop

; -------------------------------------------------------------

    EX DE,HL ; Flip data and screen pointers back

    ; Offset screen address
    ADD HL,BC

    ; Evaluate line counter
    LD A,(SpriteDimensionLineCounter)
    DEC A
    LD (SpriteDimensionLineCounter),A
    JR NZ,BlitterBytewiseUnmaskedLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Blitter Bytewise Mirrored
; -------------------------------------------------------------
; -> DE: Sprite data pointer
; -> BC: Sprite coordinate
; -------------------------------------------------------------
BlitterBytewiseMirrored:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Convert line coord to address offset
    CALL BlitterScreenAddressInitMirrored

; -------------------------------------------------------------

BlitterBytewiseMirroredLineLoop:

    ; Initialize column counter
    LD A,(SpriteDimensionColumns)

    EX DE,HL ; Flip data and screen pointers

; -------------------------------------------------------------

BlitterBytewiseMirroredColumnLoop:

    EX AF,AF' ; Preserve column counter

; -------------------------------------------------------------

    LD A,(DE) ; Get current screen byte

    CALL MirrorByte

    AND (HL)  ; Apply sprite mask data
    INC HL    ; Move to sprite data
    OR (HL)   ; Apply sprite data

    CALL MirrorByte

    LD (DE),A ; Write result byte back to screen
    DEC DE
    INC HL

; -------------------------------------------------------------

    EX AF,AF' ; Restore column counter

    ; Evaluate column counter
    DEC A
    JR NZ,BlitterBytewiseMirroredColumnLoop

; -------------------------------------------------------------

    EX DE,HL ; Flip data and screen pointers back

    ; Offset screen address
    ADD HL,BC

    ; Evaluate line counter
    LD A,(SpriteDimensionLineCounter)
    DEC A
    LD (SpriteDimensionLineCounter),A
    JR NZ,BlitterBytewiseMirroredLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Blitter Bytewise Mirrored - Unmasked
; -------------------------------------------------------------
; -> DE: Sprite data pointer
; -> BC: Sprite coordinate
; -------------------------------------------------------------
BlitterBytewiseUnmaskedMirrored:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Convert line coord to address offset
    CALL BlitterScreenAddressInitMirrored

; -------------------------------------------------------------

BlitterBytewiseUnmaskedMirroredLineLoop:

    ; Initialize column counter
    LD A,(SpriteDimensionColumns)

; -------------------------------------------------------------

BlitterBytewiseUnmaskedMirroredColumnLoop:

    EX AF,AF' ; Preserve column counter

; -------------------------------------------------------------

    LD A,(DE) ; Get sprite data

    CALL MirrorByte

    OR (HL)   ; Apply current screen byte

    LD (HL),A ; Write result byte back to screen

    DEC HL
    INC DE

; -------------------------------------------------------------

    EX AF,AF' ; Restore column counter

    ; Evaluate column counter
    DEC A
    JR NZ,BlitterBytewiseUnmaskedMirroredColumnLoop

; -------------------------------------------------------------

    ; Offset screen address
    ADD HL,BC

    ; Evaluate line counter
    LD A,(SpriteDimensionLineCounter)
    DEC A
    LD (SpriteDimensionLineCounter),A
    JR NZ,BlitterBytewiseUnmaskedMirroredLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Blitter Bitwise
; -------------------------------------------------------------
; -> DE: Sprite data pointer
; -> BC: Sprite coordinate
; -------------------------------------------------------------
BlitterBitwise:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Define shift steps based on column coord
    LD A,B
    AND 0x07
    LD (ShiftSteps),A

; -------------------------------------------------------------

    ; Define mask's left and right paddings
    LD A,0xFF

    CALL ShiftByte

    LD A,L

    EXX
    LD D,A   ; D' holds mask's left padding
    XOR 0xFF
    LD E,A   ; E' holds mask's right padding
    EXX

; -------------------------------------------------------------

    ; Convert line coord to address offset
    CALL BlitterScreenAddressInit

; -------------------------------------------------------------

BlitterBitwiseLineLoop:

    ; Initialize carry bytes
    EXX
    LD B,D    ; Move left padding to mask carry
    LD C,0x00 ; Move zero to sprite carry
    EXX

    ; Initialize column counter
    LD A,(SpriteDimensionColumns)

; -------------------------------------------------------------

BlitterBitwiseColumnLoop:

    EX AF,AF' ; Preserve column counter

; -------------------------------------------------------------

    ; Get mask data
    LD A,(DE)
    INC DE

    ; Shift mask byte and preserve carry byte
    EXX
    CALL ShiftByte
    LD A,B ; Get previous mask carry byte
    LD B,L ; Store current mask carry byte
    OR H   ; Apply shifted mask
    EXX

    ; Apply mask to screen byte
    AND (HL)
    LD (HL),A

    ; Get sprite data
    LD A,(DE)
    INC DE

    ; Shift sprite byte and preserve carry byte
    EXX
    CALL ShiftByte
    LD A,C ; Get previous sprite carry byte
    LD C,L ; Store current sprite carry byte
    OR H   ; Apply shifted sprite
    EXX

    ; Apply sprite to screen byte
    OR (HL)
    LD (HL),A

    INC HL

; -------------------------------------------------------------

    EX AF,AF' ; Restore column counter

    ; Evaluate column counter
    DEC A
    JR NZ,BlitterBitwiseColumnLoop

; -------------------------------------------------------------

    ; Apply mask carry to screen byte
    EXX
    LD A,B ; Get mask carry byte
    OR E   ; Apply mask's right padding
    EXX

    AND (HL)
    LD (HL),A

    ; Apply sprite carry to screen byte
    EXX
    LD A,C ; Get sprite carry byte
    EXX

    OR (HL)
    LD (HL),A

; -------------------------------------------------------------

    ; Offset screen address
    ADD HL,BC

    ; Evaluate line counter
    LD A,(SpriteDimensionLineCounter)
    DEC A
    LD (SpriteDimensionLineCounter),A
    JR NZ,BlitterBitwiseLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Memory Alloc: Shift byte
; -------------------------------------------------------------
ShiftSteps: DB 0x00

; =============================================================
; Routine: Shift byte
; -------------------------------------------------------------
; -> A: Byte to be shifted
; <- H: Shifted byte
; <- L: Carry byte
; -------------------------------------------------------------
ShiftByte:

; -------------------------------------------------------------

    ; Prepare HL for shift
    LD H,A ;
    LD L,0x00

    ; Retrieve number of shift steps
    LD A,(ShiftSteps)

; -------------------------------------------------------------

    ; Check 1 bit offset
    CP 0x01
    JP NZ,ShiftByte2Bits

    ; Shift right H (1 bit), store carry byte in L
    SRL H
    RR L

    JP ShiftByteEnd

; -------------------------------------------------------------

ShiftByte2Bits:

    ; Check 2 bits offset
    CP 0x02
    JP NZ,ShiftByte3Bits

    ; Shift right H (2 bits), store carry byte in L
    SRL H
    RR L
    SRL H
    RR L

    JP ShiftByteEnd

; -------------------------------------------------------------

ShiftByte3Bits:

    ; Check 3 bits offset
    CP 0x03
    JP NZ,ShiftByte4Bits

    ; Shift right H (3 bits), store carry byte in L
    SRL H
    RR L
    SRL H
    RR L
    SRL H
    RR L

    JP ShiftByteEnd

; -------------------------------------------------------------

ShiftByte4Bits:

    ; Check 4 bits offset
    CP 0x04
    JP NZ,ShiftByte5Bits

    ; Shift right H (4 bits), store carry byte in L
    SRL H
    RR L
    SRL H
    RR L
    SRL H
    RR L
    SRL H
    RR L

    JP ShiftByteEnd

; -------------------------------------------------------------

ShiftByte5Bits:

    ; Check 5 bits offset
    CP 0x05
    JP NZ,ShiftByte6Bits

    ; Shift right H (5 bits), store carry byte in L
    LD L,H
    LD H,00
    ADD HL,HL
    ADD HL,HL
    ADD HL,HL

    JP ShiftByteEnd

; -------------------------------------------------------------

ShiftByte6Bits:

    ; Check 6 bits offset
    CP 0x06
    JP NZ,ShiftByte7Bits

    ; Shift right H (6 bits), store carry byte in L
    LD L,H
    LD H,00
    ADD HL,HL
    ADD HL,HL

    JP ShiftByteEnd

; -------------------------------------------------------------

ShiftByte7Bits:

    ; Shift right H (7 bits), store carry byte in L
    LD L,H
    LD H,0x00
    ADD HL,HL

; -------------------------------------------------------------

ShiftByteEnd:

    RET

; =============================================================
; Routine: Mirror byte
; -------------------------------------------------------------
; <-> A: Byte to be mirrored
; -------------------------------------------------------------
MirrorByte:

    PUSH BC

; -------------------------------------------------------------

    LD C,A    ; A = 76543210

    RLCA
    RLCA      ; A = 54321076

    XOR C
    AND 0xAA
    XOR C     ; A = 56341270

    LD C,A
    RLCA
    RLCA
    RLCA      ; A = 41270563

    RRC C     ; C = 05634127

    XOR C
    AND 0x66
    XOR C     ; A = 01234567

; -------------------------------------------------------------

    POP BC

    RET

; =============================================================
; Routine: Blitter Bitwise Mirrored
; -------------------------------------------------------------
; -> DE: Sprite data pointer
; -> BC: Sprite coordinate
; -------------------------------------------------------------
BlitterBitwiseMirrored:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Define shift steps based on column coord
    LD A,B
    AND 0x07
    LD (ShiftSteps),A


; -------------------------------------------------------------

    ; Define mask's left and right paddings
    LD A,0xFF

    CALL ShiftByte

    LD A,L

    EXX
    LD D,A   ; D' holds mask's left padding
    XOR 0xFF
    LD E,A   ; E' holds mask's right padding
    EXX

; -------------------------------------------------------------

    ; Convert line coord to address offset
    CALL BlitterScreenAddressInitMirrored

    ; Offset for carry byte
    INC HL

; -------------------------------------------------------------

BlitterBitwiseMirroredLineLoop:

    ; Initialize carry bytes
    EXX
    LD B,E    ; Move right padding to mask carry
    LD C,0x00 ; Move zero to sprite carry
    EXX

    ; Initialize column counter
    LD A,(SpriteDimensionColumns)

; -------------------------------------------------------------

BlitterBitwiseMirroredColumnLoop:

    EX AF,AF' ; Preserve column counter

; -------------------------------------------------------------

    ; Get mask data
    LD A,(DE)
    INC DE

    ; Shift mask byte and preserve carry byte
    EXX
    CALL MirrorByte
    CALL ShiftByte
    LD A,B ; Get previous mask carry byte
    LD B,H ; Store current mask carry byte
    OR L   ; Apply shifted mask
    EXX

    ; Apply mask to screen byte
    AND (HL)
    LD (HL),A

    ; Get sprite data
    LD A,(DE)
    INC DE

    ; Shift sprite byte and preserve carry byte
    EXX
    CALL MirrorByte
    CALL ShiftByte
    LD A,C ; Get previous sprite carry byte
    LD C,H ; Store current sprite carry byte
    OR L   ; Apply shifted sprite
    EXX

    ; Apply sprite to screen byte
    OR (HL)
    LD (HL),A
    DEC HL

; -------------------------------------------------------------

    EX AF,AF' ; Restore column counter

    ; Evaluate column counter
    DEC A
    JR NZ,BlitterBitwiseMirroredColumnLoop

; -------------------------------------------------------------

    ; Apply mask carry to screen byte
    EXX
    LD A,B ; Get mask carry byte
    OR D   ; Apply mask's left padding
    EXX

    AND (HL)
    LD (HL),A

    ; Apply sprite carry to screen byte
    EXX
    LD A,C ; Get sprite carry byte
    EXX

    OR (HL)
    LD (HL),A

; -------------------------------------------------------------

    ; Offset screen address
    ADD HL,BC

    ; Evaluate line counter
    LD A,(SpriteDimensionLineCounter)
    DEC A
    LD (SpriteDimensionLineCounter),A
    JR NZ,BlitterBitwiseMirroredLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Blitter Screen Address Init
; -------------------------------------------------------------
; <-> BC: Sprite coordinate
; <-  HL: Sprite data pointer
; -------------------------------------------------------------
BlitterScreenAddressInit:

    LD H,0x00
    LD L,C

    ADD HL,HL
    ADD HL,HL
    ADD HL,HL
    ADD HL,HL
    ADD HL,HL

    ; Convert column coord to address offset and align coord to bytewise position
    SRL B
    SRL B
    SRL B

    LD C,B
    LD B,0x00

    ADD HL,BC

    LD BC,BufferScreenAddress
    ADD HL,BC ; HL holds initial screen address

; -------------------------------------------------------------

    ; Define address line offset
    LD A,(SpriteDimensionColumns)

    LD C,A

    LD A,0x20
    SUB C

    LD B,0x00
    LD C,A

; -------------------------------------------------------------

    ; Initialize sprite dimension line counter
    LD A,(SpriteDimensionLines)
    LD (SpriteDimensionLineCounter),A

; -------------------------------------------------------------

    RET


; =============================================================
; Routine: Blitter Screen Address Init - Mirrored
; -------------------------------------------------------------
; <-> BC: Sprite coordinate
; <-  HL: Sprite data pointer
; -------------------------------------------------------------
BlitterScreenAddressInitMirrored:

    ; Convert line coord to address offset
    LD H,0x00
    LD L,C

    ADD HL,HL
    ADD HL,HL
    ADD HL,HL
    ADD HL,HL
    ADD HL,HL

    ; Convert column coord to address offset and align coord to bytewise position
    SRL B
    SRL B
    SRL B

    LD C,B
    LD B,0x00

    ADD HL,BC

    LD BC,BufferScreenAddress
    ADD HL,BC ; HL holds initial screen address

; -------------------------------------------------------------

    ; Shift address to farthest column
    LD A,(SpriteDimensionColumns)

    LD B,0x00
    LD C,A
    DEC C

    ADD HL,BC ; HL holds shifted screen address

; -------------------------------------------------------------

    ; Define address line offset
    LD A,0x20
    INC C
    ADD A,C

    LD C,A

; -------------------------------------------------------------

    ; Initialize sprite dimension line counter
    LD A,(SpriteDimensionLines)
    LD (SpriteDimensionLineCounter),A

; -------------------------------------------------------------

    RET

; =============================================================
; Memory Alloc: Sprite colour attribute index
SpriteColourAttribute: DB 0x00

; -------------------------------------------------------------
; Labels: Attribute Flash & Bright
ColorAttributeFlash:  EQU %10000000
ColorAttributeBright: EQU %01000000

; -------------------------------------------------------------
; Labels: Color attribute ink (palette)
ColourPaletteMask          EQU %00000111

ColourPaletteBlack         EQU 0x00 ; Black

ColourPaletteDarkBlue      EQU 0x01 ; Dark Blue
ColourPaletteBrightBlue    EQU (ColourPaletteDarkBlue | ColorAttributeBright) ; Bright Blue
ColourPaletteDarkRed       EQU 0x02 ; Dark Red
ColourPaletteBrightRed     EQU (ColourPaletteDarkRed | ColorAttributeBright) ; Bright Red
ColourPaletteDarkMagenta   EQU 0x03 ; Dark Magenta
ColourPaletteBrightMagenta EQU (ColourPaletteDarkMagenta | ColorAttributeBright) ; Bright Magenta
ColourPaletteDarkGreen     EQU 0x04 ; Dark Green
ColourPaletteBrightGreen   EQU (ColourPaletteDarkGreen | ColorAttributeBright) ; Bright Green
ColourPaletteDarkCyan      EQU 0x05 ; Dark Cyan
ColourPaletteBrightCyan    EQU (ColourPaletteDarkCyan | ColorAttributeBright) ; Bright Cyan
ColourPaletteDarkYellow    EQU 0x06 ; Dark Yellow
ColourPaletteBrightYellow  EQU (ColourPaletteDarkYellow | ColorAttributeBright) ; Bright Yellow
ColourPaletteDarkWhite     EQU 0x07 ; Dark White
ColourPaletteBrightWhite   EQU (ColourPaletteDarkWhite | ColorAttributeBright) ; Bright White

; -------------------------------------------------------------
; Labels: Color attribute special aliases
ColourPaletteCurrent       EQU 0xFD ; Colour attribute will be the one stored in SpriteColourAttribute
ColourPaletteSpriteData    EQU 0xFE ; Colour attribute from sprite data
ColourPaletteRainbow       EQU 0xFF ; Cycling colors rainbow effect

; =============================================================
; Labels: Color attribute paper
ColourPaperBlack         EQU %00000000 ; Black

ColourPaperDarkBlue      EQU %00001000 ; Dark Blue
ColourPaperBrightBlue    EQU (ColourPaperDarkBlue | ColorAttributeBright) ; Bright Blue
ColourPaperDarkRed       EQU %00010000 ; Dark Red
ColourPaperBrightRed     EQU (ColourPaperDarkRed | ColorAttributeBright) ; Bright Red
ColourPaperDarkMagenta   EQU %00011000 ; Dark Magenta
ColourPaperBrightMagenta EQU (ColourPaperDarkMagenta | ColorAttributeBright) ; Bright Magenta
ColourPaperDarkGreen     EQU %00100000 ; Dark Green
ColourPaperBrightGreen   EQU (ColourPaperDarkGreen | ColorAttributeBright) ; Bright Green
ColourPaperDarkCyan      EQU %00101000 ; Dark Cyan
ColourPaperBrightCyan    EQU (ColourPaperDarkCyan | ColorAttributeBright) ; Bright Cyan
ColourPaperDarkYellow    EQU %00110000 ; Dark Yellow
ColourPaperBrightYellow  EQU (ColourPaperDarkYellow | ColorAttributeBright) ; Bright Yellow
ColourPaperDarkWhite     EQU %00111000 ; Dark White
ColourPaperBrightWhite   EQU (ColourPaperDarkWhite | ColorAttributeBright) ; Bright White

; =============================================================
; Memory Alloc: Rainbow color
RainbowColor: DB 0x01

; =============================================================
; Label: RainbowColor cycle limit
; -------------------------------------------------------------
ColourPaletteCycle EQU (ColourPaletteBrightWhite+0x01)

; =============================================================
; Memory Alloc: Rainbow color
;SpriteDataColourAttributePointer: DW 0x0000

; =============================================================
; Label: Screen attribute top limit memory area
BufferScreenAddressAttrLow EQU (BufferScreenAddress+SpeccyScreenAttributesOffset)

; =============================================================
; Routine: Colour Attribute Paint
; -------------------------------------------------------------
; -> A: Attribute Value
; -> BC: Sprite coordinate
; -------------------------------------------------------------
ColourAttributePaint:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    CP ColourPaletteRainbow
    JR NZ,ColourAttributePaintRainbowCycleSkip

    LD A,(RainbowColor)
    INC A
    AND 0x07 ; Limit colour cycle to white
    JR NZ,ColourAttributePaintRainbowCycleBlackSkip
    INC A
ColourAttributePaintRainbowCycleBlackSkip:
    LD (RainbowColor),A
    OR 0x40  ; Set rainbow colour as bright

ColourAttributePaintRainbowCycleSkip:

; -------------------------------------------------------------

    EX AF,AF' ; Preserve colour attribute

; -------------------------------------------------------------

    LD A,(SpriteDataColourAttributeFlag)
    CP SpriteDataColourAttributeMonochrome
    JR NZ,ColourAttributePaintMonochrome

    LD A,(SpriteDataColourAttributeMonochromeColour)

    EX AF,AF' ; Preserve colour attribute

ColourAttributePaintMonochrome:

; -------------------------------------------------------------

    LD D,B

; -------------------------------------------------------------
; Convert coords to colour attribute address

    SRL B
    SRL B
    SRL B

    LD A,C
    AND 0xF8

    LD H,0x00
    LD L,A

    ADD HL,HL
    ADD HL,HL

    LD C,B
    LD B,0x00

    ADD HL,BC

    LD BC,BufferScreenAttrAddress

    ADD HL,BC

; -------------------------------------------------------------
; Calculate line address offset

    LD A,D
    AND 0x07
    LD A,(SpriteDimensionColumns)
    JR Z,AttributePaintPaddingSkip

    INC A

AttributePaintPaddingSkip:

    LD B,0x00
    LD C,A

    EX DE,HL

    LD HL,0x0020
    XOR A
    SBC HL,BC

    EX DE,HL

; -------------------------------------------------------------

    LD A,(SpriteDimensionLines)
    SRL A
    SRL A
    SRL A
    LD B,A
    INC B

; -------------------------------------------------------------

AttributePaintLineLoop:

    LD A,C

; -------------------------------------------------------------

AttributePaintColumnLoop:

    EX AF,AF'

    LD (HL),A
    INC HL

    EX AF,AF'

    DEC A
    JR NZ,AttributePaintColumnLoop

    ADD HL,DE

    DJNZ AttributePaintLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Display Dynamic Sprite
; -------------------------------------------------------------
; -> DE: sprite instance pointer
; -------------------------------------------------------------
DisplayDynamicSprite:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; HL holds Instance pointer
    EX DE,HL

; -------------------------------------------------------------

    ; Get sprite Instance current position
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceCurrPosCol

    LD B,(HL) ; B holds column
    INC HL
    LD C,(HL) ; C holds column

    LD (SpritePosition),BC

; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    PUSH BC ; Preserve sprite position

; -------------------------------------------------------------

    ; Get sprite Instance base Template pointer
    M_OffsetPointer HL, ATTR_SpriteInstanceCurrPosLin, ATTR_SpriteInstanceTemplatePointer

    ; DE holds Template pointer
    LD D,(HL)
    INC HL
    LD E,(HL)
    DEC HL

; -------------------------------------------------------------

    ; Swap Instance and Template pointers
    ; DE holds Instance pointer
    ; HL holds Template pointer
    EX DE,HL

; -------------------------------------------------------------

    ; Get sprite Template dimensions
    M_OffsetPointer HL, ATTR_SpriteTemplateRoot, ATTR_SpriteTemplateDimCol

    LD C,(HL) ; C holds columns dimension
    INC HL
    LD B,(HL) ; B holds lines dimension

    INC HL
    LD A,(HL)
    DEC HL

    ; BC holds sprite dimensions with swapped nibbles and is stored in memory
    LD (SpriteDimension),BC

; -------------------------------------------------------------

    ; Calc sprite total byte size
    PUSH HL
    PUSH AF

    LD A,C
    LD C,B
    LD B,0x00

    LD HL,0x0000

DisplayDynamicSpriteCalcByteSizeLoop:

    ADD HL,BC

    DEC A
    JR NZ,DisplayDynamicSpriteCalcByteSizeLoop

    ADD HL,HL ; Double for mask

    LD (SpriteByteSize),HL

    POP AF

    CP 0x00
    JR Z,DisplayDynamicSpriteCalcDirOffsetSkip

    PUSH HL
    POP BC

    LD HL,0x0000

DisplayDynamicSpriteCalcDirOffsetLoop:

    ADD HL,BC

    DEC A
    JR NZ,DisplayDynamicSpriteCalcDirOffsetLoop

    LD (SpriteDirOffset),HL

DisplayDynamicSpriteCalcDirOffsetSkip:

    POP HL

; -------------------------------------------------------------

    ; BC should hold total sprite data offset
    LD BC,0x0000 ; Initialize offset value

; -------------------------------------------------------------

    ; Get sprite Instance step counter
    M_OffsetPointer DE, ATTR_SpriteInstanceTemplatePointer, ATTR_SpriteInstanceStepCounter

    LD A,(DE)

    CP 0x00
    JR Z,DisplayDynamicSpriteStepOffsetSkip

; -------------------------------------------------------------

    PUSH HL ; Preserve Template pointer

    ; Get sprite Template step offset
    LD BC,(SpriteByteSize)

    LD HL,0x0000

DisplayDynamicSpriteStepOffsetLoop:

    ADD HL,BC

    DEC A
    JR NZ,DisplayDynamicSpriteStepOffsetLoop

    ; BC holds total step offset
    PUSH HL
    POP BC

    POP HL ; Restore Template pointer

DisplayDynamicSpriteStepOffsetSkip:

; -------------------------------------------------------------

    ; Get sprite Instance direction counter
    M_OffsetPointer DE, ATTR_SpriteInstanceStepCounter, ATTR_SpriteInstanceDirCounter

    LD A,(DE)

; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    PUSH AF ; Preserve Instance direction

    ; Only directions 0 (X front) and 1 (X back) should be considered for offsetting
    ; Directions 2 (Z front) and 3 (Z back), are not present in sprite data and are therefore mirrored
    AND %00000001

    CP 0x00
    JR Z,DisplayDynamicSpriteDirOffsetSkip

; -------------------------------------------------------------

    PUSH HL ; Preserve Template pointer

    ; Get sprite Template direction offset
    LD DE,(SpriteDirOffset)

    ; Get previously calculated step offset
    PUSH BC
    POP HL

    ; Add direction offset value
    ADD HL,DE

    ; BC holds total offset (step and direction offsets)
    PUSH HL
    POP BC

    POP HL ; Restore Template pointer

DisplayDynamicSpriteDirOffsetSkip:

; -------------------------------------------------------------

    ; Get sprite Template colour attribute
    M_OffsetPointer HL, ATTR_SpriteTemplateDimLin, ATTR_SpriteTemplateColorAttrIndex

    LD A,(HL)

; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    EX AF,AF' ; Preserve Colour attribute

; -------------------------------------------------------------

    ; Get sprite Template position offset
    M_OffsetPointer HL, ATTR_SpriteTemplateColorAttrIndex, ATTR_SpriteTemplatePosColOffset

; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    POP AF ; Restore Instance direction
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    POP DE ; Restore sprite position
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    PUSH AF ; Preserve Instance direction

    INC HL

; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    PUSH DE ; Preserve offset sprite position

; -------------------------------------------------------------

    ; Get sprite Template sprite data pointer
    M_OffsetPointer HL, ATTR_SpriteTemplatePosLinOffset, ATTR_SpriteTemplateData

    ; DE holds sprite Template sprite data pointer
    LD E,(HL)
    INC HL
    LD D,(HL)

    ; HL holds base Template sprite data pointer
    EX DE,HL

    ; Ofset data pointer according to both step and direction aggregated offset
    ADD HL,BC

; =============================================================
    ; DE holds offset Template sprite data pointer
    EX DE,HL

; =============================================================
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    POP BC ; Restore offset sprite position

; -------------------------------------------------------------

    ; Evaluate whether sprite is clipped at the top screen or else hidden altogether
    CALL ClipTopSpriteDataDim             ; If clipped, its line position and dimension will be adjusted accordingly
    JR NC,DisplayDynamicSpriteBlitterSkip ; If hidden beyond screen top, skip displaying it

; -------------------------------------------------------------

    ; Restore Colour attribute
    EX AF,AF'
    LD H,A ; H now holds Colour attribute

; -------------------------------------------------------------

;#############################################################
; SINKING SPRITE TEST - BEGIN

    LD A,(ZoinhoSwimmingFlag)
    CP ZoinhoSwimmingFlagTrue
    JR NZ,DisplayDynamicSpriteContinue

    LD A,(ZoinhoSinkingCounter)
    SUB 0x20
    XOR 0xFF
    LD (SpriteDimensionLines),A

    LD A,(ZoinhoSinkingCounter)
    ADD A,C
    LD C,A

DisplayDynamicSpriteContinue:

; SINKING SPRITE TEST - END
;#############################################################

    ; Evaluate whether to use bytewise or else bitwise blitters
    LD A,B ; Get column coord
    AND 0x07

    CP 0x00
    JR NZ,DisplayDynamicSpriteBytewiseSkip

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    ; Evaluate whether or not to display mirrored sprite
    POP AF        ; Restore Instance direction
    AND %00000010 ; D1 is set if direction is 02 (Z front) or 03 (Z back) and in either case sprite data must be mirrored

    PUSH AF ; Preserve Z flag state
    CALL Z,BlitterBytewise ; Display sprite data
    POP AF ; Restore Z flag state

    PUSH AF ; Preserve Z flag state ; Push dummy value to stack, because of expected FIFO sequence at the end
    CALL NZ,BlitterBytewiseMirrored ; Display mirrored sprite data

    JR DisplayDynamicSpriteColourAttr

DisplayDynamicSpriteBytewiseSkip:

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    ; Evaluate whether or not to display mirrored sprite
    POP AF        ; Restore Instance direction
    AND %00000010 ; D1 is set if direction is 02 (Z front) or 03 (Z back) and in either case sprite data must be mirrored

    PUSH AF ; Preserve Z flag state
    CALL Z,BlitterBitwise ; Display sprite data
    POP AF ; Restore Z flag state

    PUSH AF ; Preserve Z flag state ; Push dummy value to stack, because of expected FIFO sequence at the end
    CALL NZ,BlitterBitwiseMirrored ; Display mirrored sprite data

; -------------------------------------------------------------

DisplayDynamicSpriteColourAttr:

    LD A,H ; Get Colour attribute

    CALL ColourAttributePaint

; -------------------------------------------------------------

DisplayDynamicSpriteBlitterSkip:

    POP AF ; Remove either dummy value or else Instance direction from stack

; -------------------------------------------------------------

DisplayDynamicSpriteEnd:

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Clip sprite data dimension, if outside visible screen
; -------------------------------------------------------------
; <-> DE: Sprite data pointer
; <-> BC: Sprite coordinate
; NB: HL is used as temporary register without preserving it
; -------------------------------------------------------------
ClipTopSpriteDataDim:

; -------------------------------------------------------------

    ; Check whether line coord is negative (> 192)
    LD A,0xC0
    CP C
    JR NC,ClipTopSpriteDataDimEnd

; -------------------------------------------------------------

    ; Flip line coord sign
    LD A,C
    XOR 0xFF
    INC A
    LD C,A

    ; Check whether sprite lines dimension is equal to or less than absolute value of negative line coord
    ; If it is, that means sprite lines are fully hidden
    INC C
    LD A,(SpriteDimensionLines)
    CP C
    JR C,ClipTopSpriteDataDimHidden
    DEC C

    ; Rectify sprite lines dimension
    SUB C
    LD (SpriteDimensionLines),A

    ; Offset sprite data pointer
    LD A,(SpriteDimensionColumns)

    EX DE,HL

    LD D,0x00
    LD E,A

    LD A,C ; Number of lines to be offset

ClipTopSpriteDataDimOffsetLoop:

    ADD HL,DE ; Offset once for mask data
    ADD HL,DE ; Offset twice for sprite data (must be interleaved)

    DEC A
    JR NZ,ClipTopSpriteDataDimOffsetLoop

    ; DE holds offset data pointer
    EX DE,HL

    ; Rectify line coord, clipping it at the top of the screen
    LD C,0x00

    ; Sprite should be displayed
    SCF

    RET

; -------------------------------------------------------------

ClipTopSpriteDataDimHidden:

    ; Sprite should NOT be displayed
    XOR A

    RET

; -------------------------------------------------------------

ClipTopSpriteDataDimEnd:

    ; Sprite should be displayed
    SCF

    RET

; =============================================================
; Routine: Clear Dynamic Sprite Instance
; -------------------------------------------------------------
; -> DE: sprite instance pointer
; -------------------------------------------------------------
ClearDynamicSprite:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    EX DE,HL

; -------------------------------------------------------------

    ; Get sprite Instance current position
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceCurrPosCol

    LD A,(HL) ; B holds column coord
    AND 0xF8
    DEC A
    LD B,A
    INC HL
    LD C,(HL) ; C holds line coord

; -------------------------------------------------------------

    ; Get sprite Instance base Template pointer
    M_OffsetPointer HL, ATTR_SpriteInstanceCurrPosLin, ATTR_SpriteInstanceTemplatePointer

    ; DE holds Template pointer
    LD D,(HL)
    INC HL
    LD E,(HL)

; -------------------------------------------------------------

    ; Get sprite Template dimensions
    M_OffsetPointer DE, ATTR_SpriteTemplateRoot, ATTR_SpriteTemplateDimCol

    EX DE,HL

    LD E,(HL) ; E holds columns dimension
    INC HL
    LD D,(HL) ; D holds lines dimension

    ; Evaluate column position bitwise and allow for right padding if necessary
    LD A,B
    AND 0x07
    JR Z,ClearDynamicSpritePaddingSkip

    INC E

ClearDynamicSpritePaddingSkip:

; -------------------------------------------------------------

    ; Evaluate clipping at the top
    LD (SpriteDimension),DE

    CALL ClipTopSpriteDataDim
    JR NC,ClearDynamicSpriteEnd

    CALL BlitterClear

; -------------------------------------------------------------

ClearDynamicSpriteEnd:

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Clear Sprite Instance
; -------------------------------------------------------------
; -> BC: sprite position
; -------------------------------------------------------------
BlitterClear:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Convert line coord to address offset
    CALL BlitterScreenAddressInit

    INC HL

; -------------------------------------------------------------

    ; Initialize line counter
    LD A,(SpriteDimensionLines)
    LD D,A

BlitterClearLineLoop:

    ; Initialize column counter
    LD A,(SpriteDimensionColumns)
    LD E,A

; -------------------------------------------------------------

    XOR A ; Clear value

BlitterClearColumnLoop:

; -------------------------------------------------------------

    LD (HL),A ; Write clear byte to screen
    INC HL

; -------------------------------------------------------------

    ; Evaluate column counter
    DEC E
    JR NZ,BlitterClearColumnLoop

; -------------------------------------------------------------

    ; Offset screen address
    ADD HL,BC

    ; Evaluate line counter
    DEC D
    JR NZ,BlitterClearLineLoop

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Display Static Sprite
; -------------------------------------------------------------
; -> DE: sprite instance pointer
; -------------------------------------------------------------
DisplayStaticSprite:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Initialize sprite data
    CALL DisplayStaticBackgroundSpriteInit

; -------------------------------------------------------------

    ; Evaluate whether or not to display mirrored sprite
    CP SpriteDataHorizontalFlipTrue

    PUSH AF ; Preserve Z flag state
    CALL Z,BlitterBytewiseMirrored ; Display mirrored sprite data
    POP AF ; Restore Z flag state

    CALL NZ,BlitterBytewise ; Display sprite data

; -------------------------------------------------------------

    LD A,H ; Restore colour attribute

    CALL ColourAttributePaint

; -------------------------------------------------------------

DisplayStaticSpriteEnd:

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Display Background Sprite
; -------------------------------------------------------------
; -> DE: sprite instance pointer
; -------------------------------------------------------------
DisplayBackgroundSprite:

    DI

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    ; Initialize sprite data
    CALL DisplayStaticBackgroundSpriteInit

; -------------------------------------------------------------

    ; Evaluate whether or not to display mirrored sprite
    CP SpriteDataHorizontalFlipTrue

    PUSH AF ; Preserve Z flag state
    CALL Z,BlitterBytewiseUnmaskedMirrored ; Display mirrored sprite unmasked data
    POP AF ; Restore Z flag state

    CALL NZ,BlitterBytewiseUnmasked ; Display sprite unmasked data

; -------------------------------------------------------------

    LD A,H ; Restore colour attribute

    CALL ColourAttributePaint

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    EI

    RET

; =============================================================
; Routine: Display Static / Background Sprite Init
; -------------------------------------------------------------
; -> DE: sprite instance pointer
; -------------------------------------------------------------
DisplayStaticBackgroundSpriteInit:

    ; HL holds Instance pointer
    EX DE,HL

; -------------------------------------------------------------

    ; Get sprite Instance current position
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceCurrPosCol

    LD B,(HL) ; B holds column
    INC HL
    LD C,(HL) ; C holds column

; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    PUSH BC ; Preserve sprite position

; -------------------------------------------------------------

    ; Get sprite Instance base Template pointer
    M_OffsetPointer HL, ATTR_SpriteInstanceCurrPosLin, ATTR_SpriteInstanceTemplatePointer

    ; DE holds Template pointer
    LD D,(HL)
    INC HL
    LD E,(HL)
    DEC HL

; -------------------------------------------------------------

    ; Swap Instance and Template pointers
    ; DE holds Instance pointer
    ; HL holds Template pointer
    EX DE,HL

; -------------------------------------------------------------

    ; Get sprite Template dimensions
    M_OffsetPointer HL, ATTR_SpriteTemplateRoot, ATTR_SpriteTemplateDimCol

    LD C,(HL) ; C holds columns dimension
    INC HL
    LD B,(HL) ; B holds lines dimension

    ; BC holds sprite dimensions with swapped nibbles and is stored in memory
    LD (SpriteDimension),BC

; -------------------------------------------------------------

    ; Get sprite Template default direction
    M_OffsetPointer HL, ATTR_SpriteTemplateDimLin, ATTR_SpriteTemplateVerticalFlip

    LD A,(HL)

    EX AF,AF' ; Preserve direction counter

; -------------------------------------------------------------

    ; Get sprite Template colour attribute
    M_OffsetPointer HL, ATTR_SpriteTemplateVerticalFlip, ATTR_SpriteTemplateColorAttrIndex

    LD A,(HL)

    EX AF,AF' ; Preserve colour attribute

; -------------------------------------------------------------

    ; Get sprite Template sprite data pointer
    M_OffsetPointer HL, ATTR_SpriteTemplateColorAttrIndex, ATTR_SpriteTemplateData

    ; DE holds sprite Template sprite data pointer
    LD E,(HL)
    INC HL
    LD D,(HL)

; -------------------------------------------------------------

    EX AF,AF' ; Restore colour attribute
    LD H,A    ; Preserve colour attribute

; -------------------------------------------------------------

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    POP BC ; Restore sprite position

    EX AF,AF' ; Restore direction counter

; -------------------------------------------------------------

    RET

; =============================================================
; Routine: Zoinho Swimming
; -------------------------------------------------------------
ZoinhoSwimming:

    CP ZoinhoID
    JR NZ,DisplaySpriteSwimWakeSkip

    LD A,(ZoinhoSinkingCounter)
    CP ZoinhoMaxSinkingValue
    JR NZ,DisplaySpriteSwimWakeSkip

    LD A,(ZoinhoSwimmingFlag)
    CP ZoinhoSwimmingFlagTrue
    JR NZ,DisplaySpriteSwimWakeSkip

    LD HL,0x0803
    LD (SpriteDimension),HL

    PUSH DE
    PUSH BC

    LD BC,(SpritePosition)

    LD A,0x1F
    ADD A,C
    LD C,A

    LD DE,SwimWakeSpriteData

    CALL BlitterBitwise

    LD A,ColourPaletteBrightYellow

    LD HL,0x0704
    LD (SpriteDimension),HL

    CALL ColourAttributePaint

    POP BC
    POP DE

DisplaySpriteSwimWakeSkip:

    RET