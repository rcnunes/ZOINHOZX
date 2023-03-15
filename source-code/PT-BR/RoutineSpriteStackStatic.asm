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
; INCLUDE - RoutineSpriteStackStatic
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; -------------------------------------------------------------
; Max number of static sprite pointers
MaxNumberOfStaticSpritePointers EQU 0x0021

; -------------------------------------------------------------
; Static sprite stack max size
StaticStackMaxSize EQU SpriteInstancePointerMemSize*MaxNumberOfStaticSpritePointers

; =============================================================

; -------------------------------------------------------------
; Memory Alloc: Static sprite stack routines' variables
StaticStackPointer: DW StaticStackTop ; Static sprite stack pointer
StaticStackSize:    DB 0x00 ; Static sprite stack current size

StaticStackBottom: DW 0x0000 ; Static sprite stack pointer bottom
StaticStack:       DS StaticStackMaxSize ; Static sprite stack (instance pointers)
StaticStackTop:    ; Stack top

; =============================================================
; Routine: Static sprite stack clear
; -------------------------------------------------------------
StaticStackClear:

      LD HL,StaticStackTop
      LD (StaticStackPointer),HL

; -------------------------------------------------------------

      LD HL,0x0000
      LD (StaticStackBottom),HL

; -------------------------------------------------------------

      XOR A
      LD (StaticStackSize),A

; -------------------------------------------------------------

      RET

; =============================================================
; Routine: Static sprite stack push
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
StaticStackPush:

      PUSH HL

; -------------------------------------------------------------

      DI
      LD (StackPointer),SP
      LD SP,(StaticStackPointer)

; -------------------------------------------------------------

      PUSH DE

      LD HL,StaticStackSize
      INC (HL)

; -------------------------------------------------------------

      LD (StaticStackPointer),SP
      LD (StaticStackBottom),SP
      LD SP,(StackPointer)
      EI

; -------------------------------------------------------------

      POP HL

      RET ; Exit

; =============================================================
; Routine: Static sprite stack sequential loop read
; -------------------------------------------------------------
; <- DE: Sprite instance pointer
; <- A : Return code ( 0x00 equals end of stack loop)
; -------------------------------------------------------------
StaticStackLoopRead:

      PUSH HL
      PUSH AF

; -------------------------------------------------------------

      DI
      LD (StackPointer),SP
      LD SP,(StaticStackPointer)

; -------------------------------------------------------------

      POP DE

      LD HL,StaticStackTop

      OR A ; Reset carry
      SBC HL,SP
      JR NZ,StaticStackEnd

; -------------------------------------------------------------

      ; Restore stack bottom pointer
      LD SP,(StaticStackBottom)

; -------------------------------------------------------------

StaticStackEnd:

; -------------------------------------------------------------

      LD (StaticStackPointer),SP
      LD SP,(StackPointer)
      EI

; -------------------------------------------------------------

      POP AF
      POP HL

      RET ; Exit

; =============================================================
; Routine: Background static sprite display
; -------------------------------------------------------------
BackgroundStaticDisplayOverlap:

      PUSH HL
      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      LD A,(StaticStackSize) ; Nr. of sprites
      LD B,A

BackgroundStaticDisplayOverlapLoop:

      CALL StaticStackLoopRead

      LD A,(DE)

      ; Display sprite instance
      CP BackgroundElementID
      JR NZ,BackgroundStaticDisplayOverlapSkip

; -------------------------------------------------------------

      LD A,(DynamicStackSize)
      LD C,A

BackgroundStaticDisplayOverlapDynamicLoop:

      EX DE,HL

      CALL DynamicStackLoopRead
      
      EX DE,HL

      CALL CheckDynamicSpriteOverlap
      CALL NC,DisplaySprite
      JR NC,BackgroundStaticDisplayOverlapSkip

      DEC C
      JR NZ,BackgroundStaticDisplayOverlapDynamicLoop

; -------------------------------------------------------------

BackgroundStaticDisplayOverlapSkip:

      DJNZ BackgroundStaticDisplayOverlapLoop

; -------------------------------------------------------------

      POP BC
      POP DE
      POP HL

      RET

; =============================================================
; Routine: Background static sprite display - ALL
; -------------------------------------------------------------
BackgroundStaticDisplay:

      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      LD A,(StaticStackSize) ; Nr. of sprites
      LD B,A

BackgroundStaticDisplayLoop:

      CALL StaticStackLoopRead

      LD A,(DE)

      ; Display sprite instance
      CP BackgroundElementID
      JR NZ,BackgroundStaticDisplayLoopSkip

      CALL SpriteInstanceDisplayFlagSetTrue
      CALL DisplaySprite

BackgroundStaticDisplayLoopSkip:

      DJNZ BackgroundStaticDisplayLoop

; -------------------------------------------------------------

      POP BC
      POP DE

      RET

; =============================================================
; Routine: Static sprite search by ID
; -------------------------------------------------------------
; -> A: Sprite ID to be searched
; <- DE: Found sprite instance
; <- Carry: Is set if found
; -------------------------------------------------------------
StaticSpriteSearchByID:

      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      LD HL,(StaticStackPointer)

; -------------------------------------------------------------

      ; ID to be found
      LD C,A

      ; Loop through all Static sprites
      LD A,(StaticStackSize)
      LD B,A

StaticSpriteSearchByIDLoop:

      CALL StaticStackLoopRead

      ; Check sprite ID
      LD A,(DE)
      CP C
      JR Z,StaticSpriteSearchByIDTrue

      DJNZ StaticSpriteSearchByIDLoop

      ; Sprite not found
      XOR A

      JR StaticSpriteSearchByIDEnd

StaticSpriteSearchByIDTrue:

      ; Sprite is found
      SCF

; -------------------------------------------------------------

StaticSpriteSearchByIDEnd:

; -------------------------------------------------------------

      LD (StaticStackPointer),HL

; -------------------------------------------------------------

      POP BC
      POP HL

      RET
