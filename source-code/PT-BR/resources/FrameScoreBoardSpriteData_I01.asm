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
; INCLUDE - FrameScoreBoardSpriteData_I01
; =================================================================================

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameHeart sprite data

FrameHeartSpriteData:

; Sprite (16 x 16)

DB 0x1C, 0x38, 0x3E, 0x7C, 0x7F, 0xD6, 0xFF, 0xEB, 0xFF, 0xF5, 0xFF, 0xFB, 0xFF, 0xF5
DB 0xFF, 0xFB, 0x7F, 0xF6, 0x3F, 0xFC, 0x1F, 0xF8, 0x0F, 0xF0, 0x07, 0xE0, 0x03, 0xC0
DB 0x01, 0x80, 0x00, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameHeartBroken sprite data

FrameHeartBrokenSpriteData:

; Sprite (16 x 16)

DB 0x1C, 0x38, 0x3E, 0x7C, 0x7E, 0x56, 0xFC, 0xEB, 0xF1, 0xF5, 0xFC, 0xFB, 0xFE, 0x75
DB 0xFF, 0x3B, 0x7E, 0x76, 0x3E, 0xFC, 0x1E, 0xF8, 0x0F, 0xF0, 0x07, 0xE0, 0x03, 0xC0
DB 0x01, 0x80, 0x00, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameMushroom sprite data

;FrameMushroomSpriteData:

; Sprite (16 x 16)

;DB 0x00, 0x00, 0x07, 0xF0, 0x1F, 0xF8, 0x3B, 0xFC, 0x71, 0xFA, 0xE0, 0xFD, 0xF1, 0xDA
;DB 0xFB, 0xF5, 0xDF, 0xFA, 0x7E, 0x74, 0x1F, 0xE8, 0x07, 0xD0, 0x08, 0x08, 0x1F, 0xD4
;DB 0x1F, 0xE8, 0x8F, 0xD3

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameBook sprite data

FrameBookSpriteData:

; Sprite (16 x 16)

DB 0x00, 0x00, 0x01, 0x80, 0x06, 0x60, 0x19, 0x98, 0x26, 0x78, 0x31, 0xE8, 0x3F, 0x88
DB 0x3D, 0x68, 0x25, 0x68, 0x3D, 0x68, 0x3F, 0x68, 0x25, 0x58, 0x3F, 0x30, 0x3D, 0xE0
DB 0x1F, 0x80, 0x00, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameSkull sprite data

FrameSkullSpriteData:

; Sprite (8 x 8)

DB 0x7C, 0xFE, 0xAF, 0xFF, 0xDE, 0x7C, 0x70, 0x50

; Padding for alignment
DS 0x10

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameAxe sprite data

FrameAxeSpriteData:

; Sprite (8 x 8)

DB 0x22, 0x23, 0xAF, 0xAF, 0x23, 0x22, 0x20, 0x20

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeElbowTop sprite data

FramePipeElbowTopSpriteData:

; Sprite (16 x 16)

DB 0x00, 0x00, 0x3E, 0x00, 0x6F, 0x80, 0x5F, 0xF0, 0x5F, 0xF0, 0x7F, 0xE0, 0x7B, 0xDC
DB 0x7B, 0xBF, 0x79, 0x7F, 0x78, 0x3F, 0xFC, 0x0F, 0xFC, 0x03, 0x00, 0x00, 0x78, 0x00
DB 0x58, 0x00, 0x58, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeElbowRight sprite data

FramePipeElbowRightSpriteData:

; Sprite (16 x 16)

DB 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0xEC, 0x00, 0xDC, 0x00
DB 0xBF, 0x00, 0x7F, 0xC0, 0xFF, 0xF0, 0x4F, 0xD8, 0xC3, 0xE8, 0xFF, 0xE8, 0xFF, 0xF8
DB 0xFF, 0xF0, 0xC0, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeBottomLeft sprite data

FramePipeBottomLeftSpriteData:

; Sprite (8 x 8)

DB 0x00, 0xFC, 0xFC, 0x5B, 0x5F, 0x6F, 0x3F, 0x03

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeTopLeftCorner sprite data

FramePipeTopLeftCornerSpriteData:

; Sprite (8 x 8)

DB 0x03, 0x3F, 0x6F, 0x5F, 0x5B, 0xFC, 0xFC, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeVertical sprite data

FramePipeVerticalSpriteData:

; Sprite (8 x 8)

DB 0x78, 0x78, 0x78, 0x78, 0x78, 0x78, 0x78, 0x78

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeHorizontal sprite data

FramePipeHorizontalSpriteData:

; Sprite (8 x 8)

DB 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeHorizontalTip sprite data

FramePipeHorizontalTipSpriteData:

; Sprite (8 x 8)

DB 0x00, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeHorizontalHighlight sprite data

FramePipeHorizontalHighlightSpriteData:

; Sprite (8 x 8)

DB 0x00, 0x00, 0x00, 0x00, 0xFF, 0xE8, 0xFF, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeDiagonal sprite data

FramePipeDiagonalSpriteData:

; Sprite (8 x 8)

DB 0xC0, 0xF0, 0xFC, 0xFF, 0xFF, 0x3F, 0x0F, 0x03

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeDiagonalHighlight sprite data

FramePipeDiagonalHighlightSpriteData:

; Sprite (8 x 8)

DB 0xC0, 0x30, 0xCC, 0xFB, 0xFE, 0x3F, 0x0F, 0x03

; ---------------------------------------------------------------------------------
; Memory Alloc: FramePipeDiagonalCracked sprite data

FramePipeDiagonalCrackedSpriteData:

; Sprite (8 x 8)

DB 0xC0, 0xF0, 0xFC, 0xDF, 0xE3, 0x2F, 0x0F, 0x03