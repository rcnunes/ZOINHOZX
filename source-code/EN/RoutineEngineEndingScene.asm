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
; INCLUDE - RoutineEngineEndingScene
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; =============================================================
; Routine: Ending Scene Display
; -------------------------------------------------------------
EndingSceneDisplay:

   CALL ScreenBufferClear

; -------------------------------------------------------------

   CALL DisplayMagnifiedBackground
   
; -------------------------------------------------------------

   LD DE,CherubLeftSimpleSpriteTemplate
   LD BC,0x1000

   CALL DisplaySimpleSprite

; -------------------------------------------------------------

   LD DE,0x0401
   LD (SpriteDimension),DE

; -------------------------------------------------------------

   LD A,ColourPaletteBrightYellow
   LD BC,0x1800
   CALL ColourAttributePaint

   LD A,ColourPaletteBrightYellow
   LD BC,0x2000
   CALL ColourAttributePaint

; -------------------------------------------------------------

   LD A,ColourPaletteDarkWhite
   LD BC,0x1010
   CALL ColourAttributePaint

   LD A,ColourPaletteDarkWhite
   LD BC,0x2010
   CALL ColourAttributePaint

; -------------------------------------------------------------
; -------------------------------------------------------------

   LD DE,CherubRightSimpleSpriteTemplate
   LD BC,0xE000

   CALL DisplaySimpleSprite

; -------------------------------------------------------------

   LD DE,0x0401
   LD (SpriteDimension),DE

; -------------------------------------------------------------

   LD A,ColourPaletteBrightYellow
   LD BC,0xE000
   CALL ColourAttributePaint

   LD A,ColourPaletteBrightYellow
   LD BC,0xE800
   CALL ColourAttributePaint

; -------------------------------------------------------------

   LD A,ColourPaletteDarkWhite
   LD BC,0xE010
   CALL ColourAttributePaint

   LD A,ColourPaletteDarkWhite
   LD BC,0xF010
   CALL ColourAttributePaint

; -------------------------------------------------------------
; -------------------------------------------------------------

   LD A,ScrollDisplayInputDisabled
   LD (ScrollDisplayInputflag),A

   LD DE,StrEndingText
   LD BC,0x0501
   CALL ScrollDisplay

   LD A,ScrollDisplayInputEnabled
   LD (ScrollDisplayInputflag),A

; -------------------------------------------------------------
; -------------------------------------------------------------

EndingSceneDisplayEnd:

   CALL SwapScreenBufferAll

; -------------------------------------------------------------

    LD HL,ChopinNocturneOpus55No1BeeperTemplate
    CALL PlayBeeperInterleavedClear

EndingSceneDisplayWaitForENTERKeyLoop:

    CALL PlayBeeperInterleaved

    LD A,KeysSegmentHJKLEn
    IN A,(SpeccyKeyboardPort)
    AND MaskKeys____En

    JR NZ,EndingSceneDisplayWaitForENTERKeyLoop

; -------------------------------------------------------------

   RET

; =============================================================
; Memory Alloc: Display Sprite (Magnified 8x8) - attributes
; -------------------------------------------------------------
SpriteMagDim:

   SpriteMagDimLin: DB 0x00
   SpriteMagDimCol: DB 0x00

SpriteMagPos:

   SpriteMagPosLin: DB 0x00
   SpriteMagPosCol: DB 0x00

SpriteMagColour: DB 0x00
SpriteMagChar:   DB 0x00, StrEOS

; =============================================================
; Label: Display Sprite Colour Palette Flag
; -------------------------------------------------------------
SpriteMagColourRandomFlagTrue  EQU 0x00
SpriteMagColourRandomFlagFalse EQU 0xFF

; =============================================================
; Memory Alloc: Display Sprite Colour Palette Flag
; -------------------------------------------------------------
SpriteMagColourRandomFlag: DB SpriteMagColourRandomFlagFalse

; =============================================================
; Routine: Display Sprite (Magnified 8x8)
; -------------------------------------------------------------
; -> DE: Sprite data
; -> HL: Dimensions ( [1..32], [1..24] )
; -> BC: Position ( [0..31], [0..23] )
; -------------------------------------------------------------
DisplaySpriteMagnified:

   LD (SpriteMagDim),HL
   LD (SpriteMagPos),BC

; -------------------------------------------------------------

   LD L,0x00

DisplaySpriteMagnifiedLinLoop:

   LD H,0x00

DisplaySpriteMagnifiedColLoop:

; -------------------------------------------------------------

   LD A,(DE)

   LD B,0x08

DisplaySpriteMagnifiedPlotLoop:

   BIT 7,A

   JR Z,DisplaySpriteMagnifiedPlotSkip

; -------------------------------------------------------------

   PUSH AF
   PUSH HL
   PUSH BC
   PUSH DE
   
   LD A,0x08
   SUB B
   ADD A,H
   LD H,A

   LD BC,(SpriteMagPos)

   ADD HL,BC

   PUSH HL
   POP BC

   LD A,(SpriteMagColourRandomFlag)
   CP SpriteMagColourRandomFlagTrue
   JR NZ,DisplaySpriteMagnifiedPlotRandomColourSkip

   LD A,R
   AND 0x07
   SLA A
   SLA A
   SLA A
   LD D,A

   LD A,R
   AND 0x07

   OR D

   JR DisplaySpriteMagnifiedPlotFixedColourSkip

DisplaySpriteMagnifiedPlotRandomColourSkip:

   LD A,(SpriteMagColour)

DisplaySpriteMagnifiedPlotFixedColourSkip:


   LD DE,SpriteMagChar

   CALL DisplaySpriteMagnifiedString

   POP DE
   POP BC
   POP HL
   POP AF

; -------------------------------------------------------------

DisplaySpriteMagnifiedPlotSkip:

   SLA A

   DJNZ DisplaySpriteMagnifiedPlotLoop

; -------------------------------------------------------------

   INC DE

   LD A,0x08
   ADD A,H
   LD H,A

   LD A,(SpriteMagDimCol)

   CP H
   JR NZ,DisplaySpriteMagnifiedColLoop

; -------------------------------------------------------------

   INC L
   LD A,(SpriteMagDimLin)

   CP L
   JR NZ,DisplaySpriteMagnifiedLinLoop

; -------------------------------------------------------------

   RET

; =============================================================
; Label: Display magnified pattern
; -------------------------------------------------------------
DisplaySpriteMagnifiedPatternSingle EQU 0x00
DisplaySpriteMagnifiedPatternCross  EQU 0xFF

; =============================================================
; Memory Alloc: Display magnified pattern
; -------------------------------------------------------------
DisplaySpriteMagnifiedPattern: DB DisplaySpriteMagnifiedPatternCross

; =============================================================
; Routine: Display magnified background flames
; -------------------------------------------------------------
DisplaySpriteMagnifiedString:

   PUSH AF

; -------------------------------------------------------------

   LD A,(DisplaySpriteMagnifiedPattern)
   CP DisplaySpriteMagnifiedPatternSingle
   JR NZ,DisplaySpriteMagnifiedStringSingleSkip

; -------------------------------------------------------------

   POP AF
   PUSH AF

   CALL StrPrint

   JR DisplaySpriteMagnifiedStringEnd

DisplaySpriteMagnifiedStringSingleSkip:

; -------------------------------------------------------------

   POP AF
   PUSH AF

   PUSH BC

   DEC B
   CALL DisplaySpriteMagnifiedClipping

   CALL StrPrint

; -------------------------------------------------------------

   POP BC
   PUSH BC

   INC B
   CALL DisplaySpriteMagnifiedClipping

   CALL StrPrint

; -------------------------------------------------------------

   POP BC
   PUSH BC

   DEC C
   CALL DisplaySpriteMagnifiedClipping

   CALL StrPrint

; -------------------------------------------------------------

   POP BC

   INC C
   CALL DisplaySpriteMagnifiedClipping

   CALL StrPrint

; -------------------------------------------------------------

DisplaySpriteMagnifiedStringEnd:

   POP AF

   RET

; =============================================================
; Routine: Display magnified coordinate clipping
; -------------------------------------------------------------
DisplaySpriteMagnifiedClipping:

  PUSH AF

; -------------------------------------------------------------

  LD A,B
  CP 0xFF
  JR NZ,DisplaySpriteMagnifiedClippingColLowSkip

  LD B,0x00

DisplaySpriteMagnifiedClippingColLowSkip:

; -------------------------------------------------------------

  LD A,B
  CP 0x20
  JR C,DisplaySpriteMagnifiedClippingColHighSkip

  LD B,0x1F

DisplaySpriteMagnifiedClippingColHighSkip:

; -------------------------------------------------------------

  LD A,C
  CP 0xFF
  JR NZ,DisplaySpriteMagnifiedClippingLinLowSkip

  LD C,0x00

DisplaySpriteMagnifiedClippingLinLowSkip:

; -------------------------------------------------------------

  LD A,C
  CP 0x18
  JR C,DisplaySpriteMagnifiedClippingLinHighSkip

  LD C,0x17

DisplaySpriteMagnifiedClippingLinHighSkip:

; -------------------------------------------------------------

  POP AF

  RET


; =============================================================
; Routine: Display magnified colour resolve
; -------------------------------------------------------------
; ->  A: Colour
; -------------------------------------------------------------
DisplayMagnifiedColourResolve:

   CP ColourPaletteRainbow
   JR NZ,DisplayMagnifiedColourResolveRainbowSkip

; -------------------------------------------------------------

   LD A,SpriteMagColourRandomFlagTrue
   LD (SpriteMagColourRandomFlag),A

   JR DisplayMagnifiedColourResolveEnd

; -------------------------------------------------------------

DisplayMagnifiedColourResolveRainbowSkip:

   LD (SpriteMagColour),A

   LD A,SpriteMagColourRandomFlagFalse
   LD (SpriteMagColourRandomFlag),A

; -------------------------------------------------------------

DisplayMagnifiedColourResolveEnd:

   RET

; =============================================================
; Routine: Display magnified srite ( Single Solid)
; -------------------------------------------------------------
; ->  A: Colour
; -> DE: Sprite data pointer
; -> BC: Position
; -> HL: Dimension
; -------------------------------------------------------------
DisplayMagnifiedSingleSolid:

   CALL DisplayMagnifiedColourResolve

; -------------------------------------------------------------

   LD A,DisplaySpriteMagnifiedPatternSingle
   LD (DisplaySpriteMagnifiedPattern),A

; -------------------------------------------------------------

   LD A,CharSolid
   LD (SpriteMagChar),A

; -------------------------------------------------------------

   CALL DisplaySpriteMagnified

; -------------------------------------------------------------

   RET

; =============================================================
; Routine: Display magnified srite ( Single Checkered)
; -------------------------------------------------------------
DisplayMagnifiedSingleCheckered:

   CALL DisplayMagnifiedColourResolve

; -------------------------------------------------------------

   LD A,DisplaySpriteMagnifiedPatternSingle
   LD (DisplaySpriteMagnifiedPattern),A

; -------------------------------------------------------------

   LD A,CharCheckered
   LD (SpriteMagChar),A

; -------------------------------------------------------------

   CALL DisplaySpriteMagnified

; -------------------------------------------------------------

   RET

; =============================================================
; Routine: Display magnified srite ( Cross Checkered)
; -------------------------------------------------------------
DisplayMagnifiedCrossCheckered:

   CALL DisplayMagnifiedColourResolve

; -------------------------------------------------------------

   LD A,DisplaySpriteMagnifiedPatternCross
   LD (DisplaySpriteMagnifiedPattern),A

; -------------------------------------------------------------

   LD A,CharCheckered
   LD (SpriteMagChar),A

; -------------------------------------------------------------

   CALL DisplaySpriteMagnified

; -------------------------------------------------------------

   RET

; =============================================================
; Routine: Display magnified background
; -------------------------------------------------------------
DisplayMagnifiedBackground:

; -------------------------------------------------------------
; Background farther
; -------------------------------------------------------------

   LD A,ColourPaletteDarkGreen
   LD DE,FlamesPatternISpriteData
   LD HL,0x1008
   LD BC,0x000A

   CALL DisplayMagnifiedSingleCheckered

; -------------------------------------------------------------

   LD A,ColourPaletteDarkGreen
   LD DE,FlamesPatternIISpriteData
   LD HL,0x1008
   LD BC,0x100A

   CALL DisplayMagnifiedSingleCheckered

; -------------------------------------------------------------
; Background coloured
; -------------------------------------------------------------

   LD A,ColourPaletteRainbow
   LD DE,FlamesPatternISpriteData
   LD HL,0x1008
   LD BC,0x000F

   CALL DisplayMagnifiedCrossCheckered

; -------------------------------------------------------------

   LD A,ColourPaletteRainbow
   LD DE,FlamesPatternIISpriteData
   LD HL,0x1008
   LD BC,0x100F

   CALL DisplayMagnifiedCrossCheckered

; -------------------------------------------------------------
; Zoinho Headshot
; -------------------------------------------------------------

   LD A,ColourPaletteBlack
   LD DE,ZoinhoHeadshotSpriteData
   LD HL,0x100E
   LD BC,0x080A

   CALL DisplayMagnifiedCrossCheckered

; -------------------------------------------------------------

   LD A,ColourPaletteBrightYellow
   LD DE,ZoinhoHeadshotSpriteData
   LD HL,0x100E
   LD BC,0x080A

   CALL DisplayMagnifiedSingleSolid

; -------------------------------------------------------------

   LD A,ColourPaletteBrightWhite
   LD DE,ZoinhoEyeHighlightSpriteData
   LD HL,0x0802
   LD BC,0x0F10

   CALL DisplayMagnifiedSingleSolid

; -------------------------------------------------------------

   RET
