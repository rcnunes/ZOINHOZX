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
; INCLUDE - TemplateSpriteFrame
; =================================================================================

; =================================================================================
; Memory Alloc: Isometric Frame
FrameIsometricStageTemplate:

; ---------------------------------------------------------------------------------

DB 0x1A ; Sprite counter

; ---------------------------------------------------------------------------------
; Left hand stage frame

DW OutterFrameElementZSimpleSpriteTemplate
DB 0x00, 0x70

DW BasicFrameElementZSimpleSpriteTemplate
DB 0x10, 0x74

DW SkullFrameElementZSimpleSpriteTemplate
DB 0x20, 0x7C

DW BasicFrameElementZSimpleSpriteTemplate
DB 0x30, 0x84

DW BasicFrameElementZSimpleSpriteTemplate
DB 0x40, 0x8C

DW FishBoneFrameElementZSimpleSpriteTemplate
DB 0x50, 0x94

DW BasicFrameElementZSimpleSpriteTemplate
DB 0x60, 0x9C

DW BasicFrameElementZSimpleSpriteTemplate
DB 0x70, 0xA4

; ---------------------------------------------------------------------------------
; Right hand stage frame

DW BasicFrameElementSimpleSpriteTemplate
DB 0x80, 0xA4

DW BasicFrameElementSimpleSpriteTemplate
DB 0x90, 0x9C

DW SkullFrameElementSimpleSpriteTemplate
DB 0xA0, 0x94

DW BasicFrameElementSimpleSpriteTemplate
DB 0xB0, 0x8C

DW BasicFrameElementSimpleSpriteTemplate
DB 0xC0, 0x84

DW FishBoneFrameElementSimpleSpriteTemplate
DB 0xD0, 0x7C

DW BasicFrameElementSimpleSpriteTemplate
DB 0xE0, 0x74

DW OutterFrameElementSimpleSpriteTemplate
DB 0xF0, 0x70

; ---------------------------------------------------------------------------------
; Highlights

DW BrightHighlightSimpleSpriteTemplate
DB 0x08, 0x80

DW BrightHighlightSimpleSpriteTemplate
DB 0x28, 0x88

DW BrightHighlightSimpleSpriteTemplate
DB 0x50, 0xA8

DW BrightHighlightSimpleSpriteTemplate
DB 0x58, 0xA0

DW DarkHighlightSimpleSpriteTemplate
DB 0xA0, 0xA0

DW DarkHighlightSimpleSpriteTemplate
DB 0xA0, 0xA8

DW DarkHighlightSimpleSpriteTemplate
DB 0xD0, 0x88

DW DarkHighlightSimpleSpriteTemplate
DB 0xD8, 0x90

DW DarkHighlightSimpleSpriteTemplate
DB 0xF0, 0x80

DW DarkHighlightSimpleSpriteTemplate
DB 0xF0, 0x88

; =================================================================================
; Memory Alloc: Score Board Frame
FrameScoreBoardTemplate:

; ---------------------------------------------------------------------------------

DB 0x2E ; Sprite counter

; ---------------------------------------------------------------------------------
; Left hand score board

DW FrameBookSimpleSpriteTemplate
DB 0x08, 0xA8

DW FrameAxeSimpleSpriteTemplate
DB 0x20, 0xB0

; ---------------------------------------------------------------------------------
; Right hand score board

DW FrameHeartSimpleSpriteTemplate
DB 0xE0, 0xA8

DW FrameSkullSimpleSpriteTemplate
DB 0xD0, 0xB0

; ---------------------------------------------------------------------------------
; Left hand pipe frame - score board

DW FramePipeElbowTopLeftSimpleSpriteTemplate
DB 0x00, 0x90

DW FramePipeElbowRightLeftSimpleSpriteTemplate
DB 0x48, 0xB0

DW FramePipeBottomLeftSimpleSpriteTemplate
DB 0x00, 0xB8

; ---------------------------------------------------------------------------------
; Right hand pipe frame - score board

DW FramePipeElbowTopRightSimpleSpriteTemplate
DB 0xF0, 0x90

DW FramePipeElbowRightRightSimpleSpriteTemplate
DB 0xA8, 0xB0

DW FramePipeBottomRightSimpleSpriteTemplate
DB 0xF8, 0xB8

; ---------------------------------------------------------------------------------
; Left - Vertical Pipes

DW FramePipeVerticalSimpleSpriteTemplate
DB 0x00, 0xA0

DW FramePipeVerticalSimpleSpriteTemplate
DB 0x00, 0xA8

DW FramePipeVerticalSimpleSpriteTemplate
DB 0x00, 0xB0

; ---------------------------------------------------------------------------------
; Right - Vertical Pipes

DW FramePipeVerticalRightSimpleSpriteTemplate
DB 0xF8, 0xA0

DW FramePipeVerticalRightSimpleSpriteTemplate
DB 0xF8, 0xA8

DW FramePipeVerticalRightSimpleSpriteTemplate
DB 0xF8, 0xB0

; ---------------------------------------------------------------------------------
; Left - Horizontal Pipes

DW FramePipeHorizontalTipLeftSimpleSpriteTemplate
DB 0x08, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0x10, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0x18, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0x20, 0xB8

DW FramePipeHorizontalHighlightSimpleSpriteTemplate
DB 0x28, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0x30, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0x38, 0xB8

DW FramePipeHorizontalTipRightSimpleSpriteTemplate
DB 0x40, 0xB8

; ---------------------------------------------------------------------------------
; Right - Horizontal Pipes

DW FramePipeHorizontalTipRightSimpleSpriteTemplate
DB 0xF0, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0xE8, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0xE0, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0xD8, 0xB8

DW FramePipeHorizontalHighlightSimpleSpriteTemplate
DB 0xD0, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0xC8, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0xC0, 0xB8

DW FramePipeHorizontalTipLeftSimpleSpriteTemplate
DB 0xB8, 0xB8

; ---------------------------------------------------------------------------------
; Left - Diagonal Pipes

DW FramePipeDiagonalSimpleSpriteTemplate
DB 0x10, 0x98

DW FramePipeDiagonalHighlightSimpleSpriteTemplate
DB 0x18, 0x9C

DW FramePipeDiagonalSimpleSpriteTemplate
DB 0x20, 0xA0

DW FramePipeDiagonalSimpleSpriteTemplate
DB 0x28, 0xA4

DW FramePipeDiagonalSimpleSpriteTemplate
DB 0x30, 0xA8

DW FramePipeDiagonalCrackedSimpleSpriteTemplate
DB 0x38, 0xAC

DW FramePipeDiagonalSimpleSpriteTemplate
DB 0x40, 0xB0

; ---------------------------------------------------------------------------------
; Right - Diagonal Pipes

DW FramePipeDiagonalRightSimpleSpriteTemplate
DB 0xE8, 0x98

DW FramePipeDiagonalHighlightRightSimpleSpriteTemplate
DB 0xE0, 0x9C

DW FramePipeDiagonalRightSimpleSpriteTemplate
DB 0xD8, 0xA0

DW FramePipeDiagonalRightSimpleSpriteTemplate
DB 0xD0, 0xA4

DW FramePipeDiagonalRightSimpleSpriteTemplate
DB 0xC8, 0xA8

DW FramePipeDiagonalCrackedRightSimpleSpriteTemplate
DB 0xC0, 0xAC

DW FramePipeDiagonalRightSimpleSpriteTemplate
DB 0xB8, 0xB0

; =================================================================================
; Memory Alloc: Entry Menu Frame
FrameEntryMenuTemplate:

; ---------------------------------------------------------------------------------

DB 0x10 ; Sprite counter

; ---------------------------------------------------------------------------------
; Left hand score board

DW FrameBookSimpleSpriteTemplate
DB 0x08, 0xAF

DW FrameSkullMenuSimpleSpriteTemplate
DB 0xEC, 0xAF

DW StoneHeadOrnamentLeftSimpleSpriteTemplate
DB 0x00, 0x00

DW BrightYellowHighlightSimpleSpriteTemplate
DB 0x18, 0x00

DW StoneHeadOrnamentRightSimpleSpriteTemplate
DB 0xE0, 0x00

DW BrightYellowHighlightSimpleSpriteTemplate
DB 0xDF, 0x00

DW FramePipeTopLeftCornerSimpleSpriteTemplate
DB 0x18, 0x28

DW FramePipeHorizontalTipLeftSimpleSpriteTemplate
DB 0x20, 0x25

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0x28, 0x25

DW FramePipeTopRightCornerSimpleSpriteTemplate
DB 0xE0, 0x28

DW FramePipeHorizontalTipRightSimpleSpriteTemplate
DB 0xD8, 0x25

DW FramePipeBottomLeftSimpleSpriteTemplate
DB 0x18, 0xB8

DW FramePipeHorizontalTipLeftSimpleSpriteTemplate
DB 0x20, 0xB8

DW FramePipeHorizontalSimpleSpriteTemplate
DB 0x28, 0xB8

DW FramePipeBottomRightSimpleSpriteTemplate
DB 0xE0, 0xB8

DW FramePipeHorizontalTipRightSimpleSpriteTemplate
DB 0xD8, 0xB8


