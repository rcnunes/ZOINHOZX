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
; INCLUDE - RoutineSpriteStackDynamic
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; -------------------------------------------------------------
; Max number of Dynamic sprite pointers
MaxNumberOfDynamicSpritePointers EQU 0x000D

; -------------------------------------------------------------
; Dynamic sprite stack max size
DynamicStackMaxSize EQU SpriteInstancePointerMemSize*MaxNumberOfDynamicSpritePointers

; =============================================================

; -------------------------------------------------------------
; Memory Alloc: Dynamic sprite stack pointer
DynamicStackPointer: DW DynamicStackTop

; -------------------------------------------------------------
; Memory Alloc: Dynamic sprite refresh stack pointer bottom
DynamicStackBottom: DW 0x0000

; -------------------------------------------------------------
; Memory Alloc: Dynamic sprite stack current size
DynamicStackSize: DB 0x00

; -------------------------------------------------------------
; Memory Alloc: Dynamic sprite stack (instance pointers)
DynamicStack: DS DynamicStackMaxSize
DynamicStackTop:

; =============================================================
; Routine: Dynamic sprite stack clear
; -------------------------------------------------------------
DynamicStackClear:

      LD HL,DynamicStackTop
      LD (DynamicStackPointer),HL

; -------------------------------------------------------------

      LD HL,0x0000
      LD (DynamicStackBottom),HL

; -------------------------------------------------------------

      XOR A
      LD (DynamicStackSize),A

; -------------------------------------------------------------

      RET

; =============================================================
; Routine: Dynamic sprite stack push
; -------------------------------------------------------------
; -> DE: Dynamic sprite instance pointer
; -------------------------------------------------------------
DynamicStackPush:

      PUSH HL

; -------------------------------------------------------------

      DI
      LD (StackPointer),SP
      LD SP,(DynamicStackPointer)

; -------------------------------------------------------------

      PUSH DE

      LD HL,DynamicStackSize
      INC (HL)

; -------------------------------------------------------------

      LD (DynamicStackPointer),SP
      LD (DynamicStackBottom),SP
      LD SP,(StackPointer)
      EI

; -------------------------------------------------------------

      POP HL

      RET ; Exit

; =============================================================
; Routine: Dynamic sprite stack sequential loop read
; -------------------------------------------------------------
; <- DE: Dynamic sprite instance pointer
; <- A : Return code ( 0x00 equals end of stack loop)
; -------------------------------------------------------------
DynamicStackLoopRead:

      DI

      PUSH HL
      PUSH AF

; -------------------------------------------------------------

      LD (StackPointer),SP
      LD SP,(DynamicStackPointer)

; -------------------------------------------------------------

      POP DE

      LD HL,DynamicStackTop

      OR A ; Reset carry
      SBC HL,SP
      JR NZ,DynamicStackEnd

      LD SP,(DynamicStackBottom)

DynamicStackEnd:

; -------------------------------------------------------------

      LD (DynamicStackPointer),SP
      LD SP,(StackPointer)

; -------------------------------------------------------------

      POP AF
      POP HL

      EI

      RET

; -------------------------------------------------------------
; Label: Stencil column padding
StencilLeftOffset  EQU 0x08
StencilRightOffset EQU 0x00

; =============================================================
; Routine: Clear dynamic sprite previous position
; -------------------------------------------------------------
; -> DE: Dynamic sprite instance pointer
; -------------------------------------------------------------
ClearDynamicSpritePreviousPos:

      PUSH HL
      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      DI

; -------------------------------------------------------------

      EX DE,HL

; -------------------------------------------------------------

      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstancePrevPosCol

      ; Get previous position (Column transformed to memory map)
      LD B,(HL)
      INC HL
      LD C,(HL)

; -------------------------------------------------------------

      ; Workaround to avoid stencil check failure near screen top
      LD A,C
      SUB 0x20
      LD C,A

; -------------------------------------------------------------

      M_OffsetPointer HL, ATTR_SpriteInstancePrevPosLin, ATTR_SpriteInstanceTemplatePointer

      ; Get pointer to sprite template (Column already in bytes)
      LD D,(HL)
      INC HL
      LD E,(HL)

      EX DE,HL

      ; Get sprite dimensions
      LD D,(HL)
      INC HL
      LD E,(HL)

;---------------------------------------------------------------

      CALL ClipSpritePixelClearArea

      JR C,ClearDynamicSpritePreviousPosEnd

;---------------------------------------------------------------

      LD A,B
      AND 0x07
      JR Z,ClearDynamicSpritePreviousPosSkipRightPadding

      INC D

ClearDynamicSpritePreviousPosSkipRightPadding:

      LD A,B
      SRL A
      SRL A
      SRL A
      LD B,A

; -------------------------------------------------------------

      PUSH BC

      LD HL,BufferScreenAddress

      LD A,C
      LD C,0x00

      SRL A
      RR C
      SRL A
      RR C
      SRL A
      RR C

      LD B,A

      ADD HL,BC

      LD BC,0x0020
      XOR A
      SBC HL,BC

      LD (BufferScreenCurrentAddress),HL

      POP BC

      LD C,B
      LD B,0x00

; -------------------------------------------------------------

      LD A,D

ClearDynamicSpritePreviousPosLineLoop:

      PUSH BC

      LD HL,(BufferScreenCurrentAddress)
      
      LD BC,0x0020
      ADD HL,BC
      
      LD (BufferScreenCurrentAddress),HL
      
      POP BC

      ADD HL,BC

      EX AF,AF'

      XOR A

ClearDynamicSpritePreviousPosColumnLoop:

      LD (HL),A
      INC HL

      DEC D
      JR NZ,ClearDynamicSpritePreviousPosColumnLoop

      EX AF,AF'

      LD D,A

      DEC E
      JR NZ,ClearDynamicSpritePreviousPosLineLoop

; -------------------------------------------------------------

      EI

; -------------------------------------------------------------

ClearDynamicSpritePreviousPosEnd:

      POP BC
      POP DE
      POP HL

      RET ; Exit

; -------------------------------------------------------------
; Memory Alloc: Clear colour attribute
ClearColourAttribute: DB 0x03

; =============================================================
; Routine: Clear dynamic sprite previous position colour attribute
; -------------------------------------------------------------
; -> DE: Dynamic sprite instance pointer
; -------------------------------------------------------------
ClearDynamicSpritePreviousPosColourAttribute:

      PUSH DE
      PUSH BC

;---------------------------------------------------------------

      DI

;---------------------------------------------------------------

      ; Read sprite instance pointer
      EX DE,HL

;---------------------------------------------------------------

      ; Skip to previous coord
      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstancePrevPosCol

      LD B,(HL) ; Get previous position (top left)
      INC HL
      LD C,(HL)
      INC HL

; -------------------------------------------------------------

      ; Workaround to avoid stencil check failure near screen top
      LD A,C
      SUB 0x20
      LD C,A

; -------------------------------------------------------------

      LD (SpritePosition),BC

      ; Skip from Previous position (bottom) to template pointer
      M_OffsetPointer HL, ATTR_SpriteInstancePrevPosBotCol, ATTR_SpriteInstanceTemplatePointer

      ; Get sprite template pointer
      LD D,(HL)
      INC HL
      LD E,(HL)

      EX DE,HL

      LD C,(HL)
      INC HL
      LD B,(HL)
      INC HL

      LD (SpriteDimension),BC

;---------------------------------------------------------------

      CALL ClipSpriteAttrClearArea
      
      JR C,ClearDynamicSpritePreviousPosColourAttributeEnd

;---------------------------------------------------------------

      LD A,(ClearColourAttribute)
      CALL ColourAttributePaint

;---------------------------------------------------------------

ClearDynamicSpritePreviousPosColourAttributeEnd:

      EI

;---------------------------------------------------------------

      POP BC
      POP DE

      RET ; Exit

; =============================================================
; Routine: Check dynamic sprite overlap
; -------------------------------------------------------------
; -> HL: Dynamic sprite instance pointer
; -> DE: Static sprite instance pointer
; -------------------------------------------------------------
CheckDynamicSpriteOverlap:

      PUSH HL
      PUSH BC
      PUSH DE

; -------------------------------------------------------------

      DI

      PUSH IX
      PUSH IY

; -------------------------------------------------------------
; Get dynamic sprite top left and bottom right coordinates

      ; Skip to previous coords
      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstancePrevPosCol

      LD A,(HL) ; Top left coordinate - previous position
      INC HL

      AND 0xF8 ; Bitwise pad to the left
      LD B,A

      LD A,(HL)
      INC HL

      AND 0xF8 ; Bitwise pad to the top
      LD C,A

      LD A,(HL) ; Bottom right coordinate - previous position
      INC HL

      OR 0x07 ; Bitwise pad to the right
      LD IXH,A

      LD A,(HL)
      INC HL

      OR 0x07 ; Bitwise pad to the bottom
      LD IXL,A

      ; Get static sprite top left and bottom right coordinates
      EX DE,HL

      ; Skip to previous coords
      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstancePrevPosCol

      LD D,(HL) ; Top left coordinate - previous position
      INC HL
      LD E,(HL)
      INC HL

      LD A,(HL) ; Bottom right coordinate - previous position
      LD IYH,A
      INC HL
      LD A,(HL)
      LD IYL,A
      INC HL

; -------------------------------------------------------------
; 1) Any dynamic coord falls into the static borders

      ; Dtc (B) >= Stc (D)
      LD A,B
      CP D
      JR C,CheckScenario2

      ; Dtc (B) <= Sbc (IYH)
      LD A,IYH
      CP B
      JR C,CheckScenario2

      ; Dtl (C) >= Stl (E)
      LD A,C
      CP E
      JR C,CheckScenario2

      ; Dtl (C) <= Sbl (IYL)
      LD A,IYL
      CP C
      JR NC,CheckIsTrue

; -------------------------------------------------------------
; 2) Dynamic borders may overlap bottom left static borders

CheckScenario2:

      ; Dtc (B) <= Stc (D)
      LD A,D
      CP B
      JR C,CheckScenario3

      ; Dbc (IXH) >= Stc (D)
      LD A,IXH
      CP D
      JR C,CheckScenario3

      ; Dtl (C) >= Stl (E)
      LD A,C
      CP E
      JR C,CheckScenario3

      ; Dtl (C) <= Sbl (IYL)
      LD A,IYL
      CP C
      JR NC,CheckIsTrue

; -------------------------------------------------------------
; 3) Dynamic borders may overlap top right static borders

CheckScenario3:

      ; Dtc (B) >= Stc (D)
      LD A,B
      CP D
      JR C,CheckScenario4

      ; Dtc (B) <= Sbc (IYH)
      LD A,IYH
      CP B
      JR C,CheckScenario4

      ; Dtl (C) =< Stl (E)
      LD A,E
      CP C
      JR C,CheckScenario4

      ; Dbl (IXL) >= Stl (E)
      LD A,IXL
      CP E
      JR NC,CheckIsTrue

; -------------------------------------------------------------
; 4) Dynamic borders may overlap top left static borders

CheckScenario4:

      ; Dtc (B) < Stc (D)
      LD A,D
      CP B
      JR C,CheckScenario5

      ; Dbc (IXH) >= Stc (D)
      LD A,IXH
      CP D
      JR C,CheckScenario5

      ; Dtl (C) < Stl (E)
      LD A,E
      CP C
      JR C,CheckScenario5

      ; Dbl (IXL) >= Stl (E)
      LD A,IXL
      CP E
      JR NC,CheckIsTrue

; -------------------------------------------------------------
; 5) Dynamic borders eclipses static borders

CheckScenario5:

      ; Dtc (B) < Stc (D)
      LD A,B
      CP D
      JR NC,CheckIsFalse

      ; Dbc (IXH) > Sbc (IYH)
      LD A,IXH
      CP IYH
      JR C,CheckIsFalse

      ; Dtl (C) < Stl (E)
      LD A,E
      CP C
      JR C,CheckIsFalse

      ; Dbl (IXL) > Sbl (IYL)
      LD A,IXL
      CP IYL
      JR NC,CheckIsTrue

; -------------------------------------------------------------

CheckIsFalse:

      SCF
      JR CheckFinish

; -------------------------------------------------------------

CheckIsTrue:

      XOR A

; -------------------------------------------------------------

CheckFinish:

      POP IY
      POP IX

      EI

; -------------------------------------------------------------

      POP DE
      POP BC
      POP HL

      RET ; Exit

; =============================================================
; Routine: Check sprite stacks overlap
; -------------------------------------------------------------
CheckSpriteStacksOverlap:

      PUSH BC
      PUSH DE

; -------------------------------------------------------------
; Clear all static sprites' display flag

      ; Nr. of static sprites to refresh
      LD A,(StaticStackSize)
      LD B,A

ClearStaticSpriteDisplayFlagLoop:

      CALL StaticStackLoopRead

      LD A,(DE)
      CP BackgroundElementID
      JR Z,SpriteInstanceDisplayFlagSetFalseSkip

      CALL SpriteInstanceDisplayFlagSetFalse

SpriteInstanceDisplayFlagSetFalseSkip:

      DJNZ ClearStaticSpriteDisplayFlagLoop

; -------------------------------------------------------------

      ; Nr. of dynamic sprites to refresh
      LD A,(DynamicStackSize)
      LD C,A

CheckDynamicSpriteStackLoop:

      CALL DynamicStackLoopRead

; -------------------------------------------------------------

      EX DE,HL

; -------------------------------------------------------------

      ; Nr. of static sprites to refresh
      LD A,(StaticStackSize)
      LD B,A

CheckStaticSpriteStackLoop:

      CALL StaticStackLoopRead

      LD A,(DE)
      CP BackgroundElementID
      JR Z,CheckStaticSpriteStackSkip

; -------------------------------------------------------------

      CALL CheckDynamicSpriteOverlap
      JR C,CheckStaticSpriteStackSkip

; -------------------------------------------------------------

      CALL SpriteInstanceDisplayFlagSetTrue

; -------------------------------------------------------------

CheckStaticSpriteStackSkip:

      DJNZ CheckStaticSpriteStackLoop

; -------------------------------------------------------------

      DEC C
      JR NZ,CheckDynamicSpriteStackLoop

; -------------------------------------------------------------

CheckSpriteStacksOverlapEnd:

      POP DE
      POP BC

      RET ; Exit

; =============================================================
; Routine: Check DeadZoinho stacks overlap
; -------------------------------------------------------------
CheckZoinhoDeadStacksOverlap:

      PUSH BC
      PUSH DE

; -------------------------------------------------------------
; Clear all static sprites' display flag

      ; Nr. of static sprites to refresh
      LD A,(StaticStackSize)
      LD B,A

CheckDeadZoinhoClearStaticSpriteDisplayFlagLoop:

      CALL StaticStackLoopRead
      CALL SpriteInstanceDisplayFlagSetFalse

      DJNZ CheckDeadZoinhoClearStaticSpriteDisplayFlagLoop

; -------------------------------------------------------------

      LD A,ZoinhoDeadID
      CALL DynamicSpriteSearchByID

      EX DE,HL

; -------------------------------------------------------------

      ; Nr. of static sprites to refresh
      LD A,(StaticStackSize)
      LD B,A

CheckDeadZoinhoStaticSpriteStackLoop:

      CALL StaticStackLoopRead

; -------------------------------------------------------------

      CALL CheckDynamicSpriteOverlap
      JR C,CheckDeadZoinhoStaticSpriteStackSkip

; -------------------------------------------------------------

      CALL SpriteInstanceDisplayFlagSetTrue

; -------------------------------------------------------------

CheckDeadZoinhoStaticSpriteStackSkip:

      DJNZ CheckDeadZoinhoStaticSpriteStackLoop

; -------------------------------------------------------------

CheckDeadZoinhoSpriteStacksOverlapEnd:

      POP DE
      POP BC

      RET ; Exit

; =============================================================
; Routine: Dynamic sprite search by ID
; -------------------------------------------------------------
; -> A: Sprite ID to be searched
; <- DE: Found sprite instance
; <- Carry: Is set if found
; -------------------------------------------------------------
DynamicSpriteSearchByID:

      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      LD HL,(DynamicStackPointer)

; -------------------------------------------------------------

      ; ID to be found
      LD C,A

      ; Loop through all dynamic sprites
      LD A,(DynamicStackSize)
      LD B,A

DynamicSpriteSearchByIDLoop:

      CALL DynamicStackLoopRead

      ; Check sprite ID
      LD A,(DE)
      CP C
      JR Z,DynamicSpriteSearchByIDTrue

      DJNZ DynamicSpriteSearchByIDLoop

      ; Sprite not found
      XOR A

      JR DynamicSpriteSearchByIDEnd

DynamicSpriteSearchByIDTrue:

      ; Sprite is found
      SCF

; -------------------------------------------------------------

DynamicSpriteSearchByIDEnd:

; -------------------------------------------------------------

      LD (DynamicStackPointer),HL

; -------------------------------------------------------------

      POP BC
      POP HL

      RET

; =============================================================
; Routine: Clip sprite pixel clear area, if outside visible screen
; -------------------------------------------------------------
; <-> BC: Sprite previous position
; <-> DE: Sprite dimensions
; -------------------------------------------------------------
ClipSpritePixelClearArea:

; -------------------------------------------------------------

      LD A,ScreenPixelLineMax
      CP C
      JR NC,ClipSpritePixelClearAreaShow

; -------------------------------------------------------------
; Line coordinate is outside visible screen

      ; Get line offset
      LD A,0xFF
      SUB C
      LD C,A

      ; Subtract line offset from dimension
      LD A,E
      SUB C
      
      JR Z,ClipSpritePixelClearAreaHide
      JR C,ClipSpritePixelClearAreaHide

      LD E,A

      LD C,0x00

ClipSpritePixelClearAreaShow:

      XOR A
      
      JR ClipSpritePixelClearAreaEnd
      
ClipSpritePixelClearAreaHide:

      SCF

; -------------------------------------------------------------

ClipSpritePixelClearAreaEnd:

      RET

; =============================================================
; Routine: Clip sprite attribute clear area, if outside visible screen
; -------------------------------------------------------------
; <-> BC: Sprite previous position
; <-> DE: Sprite dimensions
; -------------------------------------------------------------
ClipSpriteAttrClearArea:

      PUSH BC
      PUSH DE

; -------------------------------------------------------------

      LD BC,(SpritePosition)

      LD A,ScreenPixelLineMax
      CP B
      JR NC,ClipSpriteAttrClearAreaShow

; -------------------------------------------------------------
; Line coordinate is outside visible screen

      ; Get line offset
      LD A,0xFF
      SUB B
      LD B,A

      ; Subtract line offset from dimension
      LD DE,(SpriteDimension)

      LD A,D
      SUB B
      
      JR Z,ClipSpriteAttrClearAreaHide
      JR C,ClipSpriteAttrClearAreaHide

      LD D,A

      LD (SpriteDimension),DE

      LD B,0x00

      LD (SpritePosition),BC
      
ClipSpriteAttrClearAreaShow:

      XOR A
      
      JR ClipSpriteAttrClearAreaEnd

ClipSpriteAttrClearAreaHide:

      SCF

; -------------------------------------------------------------

ClipSpriteAttrClearAreaEnd:

      POP DE
      POP BC

      RET

