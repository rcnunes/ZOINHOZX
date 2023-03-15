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
; INCLUDE - RoutineEngineStencil
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; -------------------------------------------------------------
; Labels: Stencil stack valid ID thresholds
; ID has to be >= StencilStackValidID_Low and < StencilStackValidID_High
StencilStackValidID_Low  EQU 0x80
StencilStackValidID_High EQU 0xC0

; -------------------------------------------------------------
; Labels: Stencil state options
StencilCheckEnabled  EQU 0x00
StencilCheckDisabled EQU 0xFF

; =============================================================

; -------------------------------------------------------------
; Memory Alloc: Stencil routines' variables
StackPointerTmp: DW 0x0000 ; Stencil check coordinates

StencilBufferStackSize:    DB 0x00 ; StencilBuffer stack current size
StencilBufferStack:        DS 4*MaxNumberOfDynamicSpritePointers
StencilBufferStackTop:     ; Stencil stack top
StencilBufferStackPointer: DW StencilBufferStackTop ; StencilBuffer stack pointer

; =============================================================
; Routine: StencilBuffer stack push
; -------------------------------------------------------------
; -> DE: Stencil Buffer Coordinates
; -------------------------------------------------------------
StencilBufferStackPush:

      PUSH AF

; -------------------------------------------------------------

      DI
      LD (StackPointerTmp),SP

; -------------------------------------------------------------

      ; Workaround to avoid stencil check failure near screen top
      LD A,E
      SUB 0x20
      JR NC,StencilBufferStackPushContinue

      XOR A

StencilBufferStackPushContinue:

      LD E,A

; -------------------------------------------------------------

      LD SP,(StencilBufferStackPointer)

      PUSH DE

      LD A,(StencilBufferStackSize)
      INC A
      LD (StencilBufferStackSize),A

      LD (StencilBufferStackPointer),SP

; -------------------------------------------------------------

      LD SP,(StackPointerTmp)
      EI

; -------------------------------------------------------------

      POP AF

      RET ; Exit

; =============================================================
; Routine: StencilBuffer stack clear
; -------------------------------------------------------------
StencilBufferStackClear:

; -------------------------------------------------------------

      ; StencilBuffer stack pointer
      LD HL,StencilBufferStackTop
      LD (StencilBufferStackPointer),HL

      ; StencilBuffer stack current size
      XOR A
      LD (StencilBufferStackSize),A

; -------------------------------------------------------------

      RET ; Exit

; -------------------------------------------------------------
; Memory Alloc: Stencil check switch
StencilCheckSwitch: DB StencilCheckDisabled ; Initial Stencil state is disabled

; -------------------------------------------------------------
; Memory Alloc: Stencil state flag
StencilStateFlag: DB StencilCheckDisabled ; Initial Stencil state is disabled

; -------------------------------------------------------------
; Memory Alloc: Stencil check coordinates
StencilCheckCoord:

      StencilCheckColumn: DB 0x00
      StencilCheckLine:   DB 0x00

; =============================================================
; Routine: Stencil Check
; -------------------------------------------------------------
StencilCheck:

      PUSH HL
      PUSH BC
      PUSH DE
      PUSH IY

; -------------------------------------------------------------

      LD (StackPointerTmp),SP

; -------------------------------------------------------------

      LD A,(StencilCheckSwitch)

      CP StencilCheckDisabled
      JR Z,StencilCheckTrue

; -------------------------------------------------------------

      LD A,(StencilStateFlag)

      CP StencilCheckDisabled
      JR Z,StencilCheckTrue

; -------------------------------------------------------------

      LD HL,StencilCheckCoord

      LD B,(HL)
      INC HL
      LD C,(HL)

      LD A,(StencilBufferStackSize)
      LD IYH,A

; -------------------------------------------------------------

      LD SP,(StencilBufferStackPointer)

; -------------------------------------------------------------

StencilCheckLoop:

      POP HL ; Retrieve Stencil Buffer Bottom Right coordinate
      POP DE ; Retrieve Stencil Buffer Top Left coordinate

      ; Evaluate whether or not check coordinate passes Stencil test
      LD A,B
      CP D
      JR C,StencilCheckNext

      CP H
      JR NC,StencilCheckNext

      LD A,C
      CP E
      JR C,StencilCheckNext

      CP L
      JR NC,StencilCheckNext

      JR StencilCheckTrue

StencilCheckNext:

      DEC IYH
      DEC IYH

      JR NZ,StencilCheckLoop

; -------------------------------------------------------------

StencilCheckFalse:

      SCF ; Set carry flag

      JR StencilCheckEnd

; -------------------------------------------------------------

StencilCheckTrue:

      OR A ; Reset carry flag

; -------------------------------------------------------------

StencilCheckEnd:

; -------------------------------------------------------------

      LD SP,(StackPointerTmp)

; -------------------------------------------------------------

      POP IY
      POP DE
      POP BC
      POP HL

      RET ; Exit

; =============================================================
; Routine: Push sprite instance coords to stencil stack
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
StencilStackPushSprite:

      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      EX DE,HL

; -------------------------------------------------------------
; Check whether sprite ID can be pushed to stencil stack
; ID has to be >= StencilStackValidID_Low and < StencilStackValidID_High

      LD A,(HL)

      CP StencilStackValidID_Low
      JR C,StencilStackPushSpriteEnd

      CP StencilStackValidID_High
      JR NC,StencilStackPushSpriteEnd

; -------------------------------------------------------------
; Determine stencil mask top left coordinate
; Select either current or else previous position,
; whichever is the top left most position.

      M_OffsetPointer HL, ATTR_SpriteInstanceID, ATTR_SpriteInstanceCurrPosCol

      ; Get current position column
      LD D,(HL)
      INC HL

      ; Get current position line
      LD E,(HL)
      INC HL

; -------------------------------------------------------------

      ; Get previous position column
      LD A,D
      LD D,(HL)
      LD B,D ; B should hold the greatest column value
      INC HL

; -------------------------------------------------------------

      ; Check which column position is smaller
      CP D
      JR C,StencilStackPushSpriteCurrColIsGreater

      LD B,A ; B holds the greatest column value
      LD A,D ; A holds the smallest column value

StencilStackPushSpriteCurrColIsGreater:

      ; Offset column limit further left and clip value for bitwise alignment
      AND 0xF8

      ; Smaller column coordinate
      LD D,A

; -------------------------------------------------------------

      ; Get previous position line
      LD A,E
      LD E,(HL)
      LD C,E ; C should hold the greatest line value

; -------------------------------------------------------------

      ; Check which line position is smaller
      CP E
      JR C,StencilStackPushSpriteCurrLineIsGreater

      LD C,A ; C holds the greatest line value
      LD A,E ; A holds the smallest line value

StencilStackPushSpriteCurrLineIsGreater:

      ; Offset line further up
      AND 0xF8

      ; Smaller line coordinate
      LD E,A

; -------------------------------------------------------------
; DE holds top left most coordinates
; BC holds top left alternate coordinates

;      DEC D
      LD A,D
      AND 0xF8
      LD D,A

      DEC E

      ; Push stencil mask top left most coordinate (DE)
      CALL StencilBufferStackPush

; -------------------------------------------------------------

      M_OffsetPointer HL, ATTR_SpriteInstancePrevPosLin, ATTR_SpriteInstanceTemplatePointer

      ; Get sprite template pointer
      LD D,(HL)
      INC HL
      LD E,(HL)

      EX DE,HL

      ; Get sprite template dimension
      LD D,(HL)
      INC HL
      LD E,(HL)

      ; Add sprite dimension to top left alternate coordinate to get bottom right most position

      PUSH BC ; Top left alternate coordinate
      POP HL

      ADD HL,DE

      EX DE,HL

; -------------------------------------------------------------
; DE holds bottom right most coordinates

      ; Offset column further right
      LD A,D
      ADD A,0x18
      JR NC,StencilStackPushSpriteBottomRightColumnAdjustSkip

      LD A,0xFF

StencilStackPushSpriteBottomRightColumnAdjustSkip:

      ; Pad column value for bitwise alignment
      OR 0x07
      LD D,A

      ; Offset line further down
      INC E

      ; Push stencil mask bottom right most coordinate (DE)
      CALL StencilBufferStackPush

; -------------------------------------------------------------

StencilStackPushSpriteEnd:

      POP BC
      POP DE

      RET ; Exit