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
; INCLUDE - RoutineSpriteInstance
; =================================================================================

; =============================================================
; GLOBAL DEFINITIONS
; =============================================================

; -------------------------------------------------------------
; Sprite instance Display Flag
SpriteInstanceDisplayFlagFalse EQU 0x00
SpriteInstanceDisplayFlagTrue EQU 0xFF

; -------------------------------------------------------------
; Sprite instance pointer size
SpriteInstancePointerMemSize EQU 0x02 ; sprite instance pointer memory size

; -------------------------------------------------------------
; Sprite instance memory size
SpriteInstanceMemorySize EQU 0x11 ; All attributes plus template pointer

; -------------------------------------------------------------
; Max number of sprite instances
MaxNumberOfSpriteInstances EQU 0x002C
;MaxNumberOfSpriteInstances EQU ( MaxNumberOfDynamicSpritePointers + MaxNumberOfStaticSpritePointers )

; -------------------------------------------------------------
; Sprite instance stack max size
SpriteInstanceStackMemorySize EQU SpriteInstanceMemorySize*MaxNumberOfSpriteInstances

; =============================================================
; MACROS
; =============================================================

; -------------------------------------------------------------
; Offset values to sprite instance attributes

ATTR_SpriteInstanceRoot            EQU 0

ATTR_SpriteInstanceID              EQU 0
ATTR_SpriteInstanceDisplayFlag     EQU 1
ATTR_SpriteInstanceIsoPosX         EQU 2
ATTR_SpriteInstanceIsoPosY         EQU 3
ATTR_SpriteInstanceIsoPosZ         EQU 4
ATTR_SpriteInstanceMinimapIndex    EQU 5
ATTR_SpriteInstanceCurrPosCol      EQU 6
ATTR_SpriteInstanceCurrPosLin      EQU 7
ATTR_SpriteInstancePrevPosCol      EQU 8
ATTR_SpriteInstancePrevPosLin      EQU 9
ATTR_SpriteInstancePrevPosBotCol   EQU 10
ATTR_SpriteInstancePrevPosBotLin   EQU 11
ATTR_SpriteInstanceStepCounter     EQU 12
ATTR_SpriteInstanceDirCounter      EQU 13
ATTR_SpriteInstanceAnimCounter     EQU 14
ATTR_SpriteInstanceTemplatePointer EQU 15

ATTR_SpriteInstanceOffset EQU (ATTR_SpriteInstanceTemplatePointer+2)

DW_ATTR_SpriteInstanceOffset          EQU (0x0001*ATTR_SpriteInstanceOffset)
DW_ATTR_SpriteInstanceTemplatePointer EQU (0x0001*ATTR_SpriteInstanceTemplatePointer)
DW_ATTR_SpriteInstanceStepCounter     EQU (0x0001*ATTR_SpriteInstanceStepCounter)
DW_ATTR_SpriteInstanceDirCounter      EQU (0x0001*ATTR_SpriteInstanceDirCounter)
DW_ATTR_SpriteInstanceIsoPosX         EQU (0x0001*ATTR_SpriteInstanceIsoPosX)
DW_ATTR_SpriteInstanceIsoPosY         EQU (0x0001*ATTR_SpriteInstanceIsoPosY)

; -------------------------------------------------------------
; Sprite direction counter values

SpriteFrontIsoX EQU 0x00
SpriteBackIsoX  EQU 0x01
SpriteFrontIsoZ EQU 0x02
SpriteBackIsoZ  EQU 0x03

SpriteUpIsoY    EQU 0x04

; -------------------------------------------------------------
; Break point

MACRO M_BREAKPOINT

DI
EX AF,AF'

DEBUG_WAIT_FOR_KEY:

      LD A,Keys67890
      IN A,(SpeccyKeyboardPort)
      AND 0x02
      JR NZ,DEBUG_WAIT_FOR_KEY

EX AF,AF'
EI

ENDM

; -------------------------------------------------------------
; Offset instance pointer

MACRO M_OffsetPointerINC,REG16,CNT
  REPT CNT
    INC REG16
  ENDM
ENDM

MACRO M_OffsetPointerDEC,REG16,CNT
  REPT CNT
    DEC REG16
  ENDM
ENDM

MACRO M_OffsetPointer,REG16,FROM,TO
  IF TO > FROM
    M_OffsetPointerINC REG16,(TO-FROM)
  ELSE
    M_OffsetPointerDEC REG16,(FROM-TO)
  ENDIF
ENDM

; -------------------------------------------------------------

MACRO M_LongOffsetPointerHL_INC,CNT
  PUSH BC
  LD BC,0x0001 * CNT
  ADD HL,BC
  POP BC
ENDM

MACRO M_LongOffsetPointerHL_DEC,CNT
  PUSH BC
  LD BC,0x0001 * CNT
  XOR A
  SBC HL,BC
  POP BC
ENDM

MACRO M_LongOffsetPointerHL,FROM,TO
  IF TO > FROM
    M_LongOffsetPointerHL_INC (TO-FROM)
  ELSE
    M_LongOffsetPointerHL_DEC (FROM-TO)
  ENDIF
ENDM

MACRO M_AltOffsetPointerHL,FROM,TO
  IF TO > FROM
    M_LongOffsetPointerHL_INC (TO-FROM)
  ELSE
    M_LongOffsetPointerHL_DEC (FROM-TO)
  ENDIF
ENDM

; =============================================================

; -------------------------------------------------------------
; Memory Alloc: Sprite instance routines' variables
SpriteInstanceStackPointer: DW SpriteInstanceStack ; Sprite instance stack pointer

SpriteInstanceStack: DS SpriteInstanceStackMemorySize ; Sprite instance stack

; =============================================================
; Routine: Sprite instance stack clear
; -------------------------------------------------------------
SpriteInstanceStackClear:

      LD HL,SpriteInstanceStack
      LD (SpriteInstanceStackPointer),HL

; -------------------------------------------------------------

      RET

; =============================================================
; Routine: Sprite instance constructor
; -------------------------------------------------------------
; -> BC: Sprite hires position
; -> HL: Sprite template pointer
; ->  A: Sprite ID
; <- DE: Sprite instance pointer
; -------------------------------------------------------------
CreateSpriteInstance:

      ; Preserve Registers
      PUSH HL
      PUSH AF

; -------------------------------------------------------------

      DI

; -------------------------------------------------------------

      ; Get current instance pointer
      LD DE,(SpriteInstanceStackPointer)

      PUSH DE

      EX DE,HL

      ; Store sprite ID
      LD (HL),A
      INC HL

      ; Initialize Display Flag
      LD A,SpriteInstanceDisplayFlagFalse
      LD (HL),A
      INC HL

      ; Reserve and initialize attributes for 3D coordinates
      XOR A

      LD (HL),A ; X
      INC HL
      LD (HL),A ; Y
      INC HL
      LD (HL),A ; Z
      INC HL

      ; Reserve and initialize attribute for Minimap index
      LD (HL),A
      INC HL

      ; Store sprite position attribute (current)
      LD (HL),B
      INC HL
      LD (HL),C
      INC HL

      ; Store sprite position attribute (previous - top left)
      LD (HL),B
      INC HL
      LD (HL),C
      INC HL

      ; Store sprite position attribute (previous - bottom right)
      LD A,(DE) ; Get sprite column dimension
      SLL A ; Convert column dimension to pixel scale
      SLL A
      SLL A
      ADD A,B

      LD (HL),A ; previous position (bottom) column
      INC HL

      INC DE
      LD A,(DE) ; Get sprite line dimension
      ADD A,C
;      DEC DE

      LD (HL),A ; previous position (bottom) line
      INC HL

      ; Initialize sprite step counter
      XOR A
      LD (HL),A
      INC HL

      ; Initialize sprite direction counter
      M_OffsetPointer DE, ATTR_SpriteTemplateDimLin, ATTR_SpriteTemplateVerticalFlip
      LD A,(DE)
      LD (HL),A
      INC HL

      ; Initialize sprite animation counter
      LD (HL),A
      INC HL

      ; Store sprite template pointer
      M_OffsetPointer DE, ATTR_SpriteTemplateVerticalFlip, ATTR_SpriteTemplateRoot
      LD (HL),D
      INC HL
      LD (HL),E
      INC HL

; -------------------------------------------------------------

      ; Set next instance pointer
      LD (SpriteInstanceStackPointer),HL

; -------------------------------------------------------------

      POP DE

; -------------------------------------------------------------

      EI

; -------------------------------------------------------------

      ; Restore Registers
      POP AF
      POP HL

      ; Exit
      RET

; =============================================================
; Routine: Calculate sprite instance previous coordinates
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
UpdateSpritePrevPos:

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    EX DE,HL

    ; Skip to current position
    M_OffsetPointer HL, ATTR_SpriteInstanceID, ATTR_SpriteInstanceCurrPosCol

    LD B,(HL) ; Get current position coordinates
    INC HL
    LD C,(HL)
    INC HL

    LD (HL),B ; Save current as previous position
    INC HL
    LD (HL),C

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Set sprite display flag true
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
SpriteInstanceDisplayFlagSetTrue:

      PUSH DE
      PUSH AF

; -------------------------------------------------------------

      ; Skip to display flag
      M_OffsetPointer DE, ATTR_SpriteInstanceID, ATTR_SpriteInstanceDisplayFlag

      LD A,SpriteInstanceDisplayFlagTrue
      LD (DE),A

; -------------------------------------------------------------

      POP AF
      POP DE

      RET ; Exit

; =============================================================
; Routine: Set sprite display flag false
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
SpriteInstanceDisplayFlagSetFalse:

      PUSH DE
      PUSH AF

; -------------------------------------------------------------

      ; Skip to display flag
      M_OffsetPointer DE, ATTR_SpriteInstanceID, ATTR_SpriteInstanceDisplayFlag

      LD A,SpriteInstanceDisplayFlagFalse
      LD (DE),A

; -------------------------------------------------------------

      POP AF
      POP DE

      RET ; Exit

