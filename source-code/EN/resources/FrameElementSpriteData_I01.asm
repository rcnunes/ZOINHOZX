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
; INCLUDE - FrameElementSpriteData_I01
; =================================================================================

; =================================================================================
; SPRITE - (1) - 16 x 27 pixels (= 2 x 3,5 attributes)
; =================================================================================

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameElement sprite data

FrameElementSpriteData:

; ---------------------------------------------------------------------------------
; Memory Alloc: Frame Element 0

BasicFrameElementSpriteData:

; Sprite

DB 0x00, 0x03, 0x00, 0x0F, 0x00, 0x3F, 0x00, 0xFF, 0x03, 0xF6, 0x0F, 0xB6, 0x3F, 0xB6, 0xFF, 0xB4
DB 0xFB, 0xEC, 0xD9, 0xEC, 0xDA, 0xEC, 0xFA, 0xFE, 0x94, 0x7E, 0xDC, 0xB6, 0x4D, 0xDF, 0x0D, 0xDD
DB 0x0D, 0x8D, 0x29, 0x1B, 0x1B, 0x3E, 0x32, 0x38, 0x22, 0x74, 0x0E, 0x6C, 0x02, 0x64, 0x26, 0x66
DB 0x04, 0x52, 0x40, 0x32, 0x08, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: Frame Element 1

OutterFrameElementSpriteData:

; Sprite

DB 0x03, 0x00, 0x0F, 0xC0, 0x3F, 0xC0, 0xFD, 0xE0, 0xE6, 0xE0, 0x7A, 0xE0, 0x7E, 0xF0, 0x14, 0xF0
DB 0x1D, 0xD0, 0x39, 0xD8, 0x39, 0xD8, 0x39, 0xBC, 0x39, 0x1C, 0x5D, 0x1C, 0x0B, 0x1E, 0x86, 0x8F
DB 0x8D, 0xC3, 0xC8, 0xE1, 0x48, 0x65, 0x40, 0x21, 0x06, 0x22, 0x07, 0x04, 0x4F, 0x40, 0x18, 0x10
DB 0xF0, 0x00, 0xE2, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: Frame Element 2

SkullFrameElementSpriteData:

; Sprite

DB 0x00, 0x03, 0x00, 0x0F, 0x00, 0x3F, 0x00, 0xFB, 0x03, 0xFB, 0x0D, 0xFB, 0x3C, 0xFE, 0xFC, 0x36
DB 0xCF, 0x14, 0x73, 0x1E, 0x1F, 0xEE, 0x40, 0xEE, 0x08, 0x1E, 0x22, 0x1C, 0x00, 0x4E, 0x1F, 0x0E
DB 0xB7, 0x8E, 0x67, 0xCC, 0x7D, 0xCC, 0x59, 0xC6, 0x7F, 0x86, 0xBF, 0x02, 0x50, 0x10, 0x21, 0x00
DB 0x06, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: Frame Element 3

FishBoneFrameElementSpriteData:

; Sprite

DB 0x00, 0x03, 0x00, 0x0F, 0x00, 0x3F, 0x00, 0xEE, 0x03, 0xDC, 0x0F, 0x3A, 0x3C, 0xDB, 0xFB, 0xB9
DB 0xBB, 0xB1, 0xAD, 0xB4, 0x60, 0xB4, 0xC0, 0x36, 0x00, 0x72, 0x7C, 0x78, 0x6E, 0x3C, 0x78, 0x16
DB 0x7B, 0x0A, 0x24, 0x0A, 0x0A, 0xCA, 0x09, 0x04, 0xC2, 0xF4, 0xC2, 0xC0, 0x60, 0xA0, 0x10, 0x88
DB 0x00, 0x48, 0x40, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
