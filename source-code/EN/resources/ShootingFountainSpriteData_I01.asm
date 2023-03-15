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
; INCLUDE - ShootingFountainSpriteData_I01
; =================================================================================

; =================================================================================
; SPRITE - (1,2) - 24 x 32 pixels (= 3 x 4 attributes)
; =================================================================================

; ---------------------------------------------------------------------------------
; Memory Alloc: ShootingFountain sprite data

ShootingFountainSpriteData:

; ---------------------------------------------------------------------------------
; Memory Alloc: ShootingFountainX sprite data

ShootingFountainXSpriteData:

; ---------------------------------------------------------------------------------
; Memory Alloc: X - Step 01

ShootingFountainX1:

; Interleaved

DB 0xFF, 0x00, 0x83, 0x00, 0xDF, 0x00, 0xF9, 0x00, 0x01, 0x7C, 0x0F, 0x20, 0xE0, 0x06, 0x00, 0xFE, 0x0F, 0xE0, 0xC0, 0x1D, 0x00, 0xF1, 0x1F, 0xC0, 0x80, 0x35, 0x00, 0xFF, 0x0F, 0xA0, 0x00, 0x6B, 0x00, 0xDE, 0x0F, 0x60, 0x00, 0x6D, 0x00, 0xE1, 0x0F, 0xE0, 0x00, 0x6D, 0x00, 0xBF, 0x0F, 0x20, 0x00, 0x76, 0x00, 0xF9, 0x07, 0xF0, 0x00, 0x77, 0x00, 0x7F, 0x07, 0xB0, 0x00, 0x6A, 0x00, 0x7D, 0x03, 0xF8, 0x00, 0x6B, 0x00, 0x7F, 0x01, 0xFC, 0x00, 0x6B, 0x00, 0xFF, 0x01, 0x9C, 0x00, 0x6B, 0x00, 0xF3, 0x01, 0xFC, 0x00, 0x6C, 0x00, 0xFD, 0x03, 0x18, 0x00, 0x6F, 0x00, 0xFD, 0x07, 0x30, 0x00, 0x6F, 0x00, 0xFD, 0x07, 0x70, 0x00, 0x6D, 0x00, 0xFB, 0x03, 0xF8, 0x00, 0x6D, 0x00, 0xBF, 0x03, 0xF8, 0x00, 0x4F, 0x00, 0xBF, 0x03, 0xF0, 0x00, 0x5E, 0x00, 0xC7, 0x01, 0xCC, 0x00, 0x6B, 0x00, 0xF8, 0x00, 0x12, 0x00, 0x6F, 0x00, 0xFF, 0x00, 0xCE, 0x00, 0x6F, 0x00, 0x7F, 0x00, 0x3E, 0x00, 0x69, 0x00, 0xFC, 0x00, 0xFA, 0x00, 0x66, 0x00, 0x03, 0x01, 0xF4, 0x80, 0x2F, 0x00, 0x76, 0x00, 0xEE, 0x00, 0x5F, 0x00, 0xAF, 0x01, 0xD0, 0x00, 0x67, 0x00, 0xDB, 0x03, 0x18, 0x90, 0x01, 0x00, 0xDC, 0xC7, 0x00, 0xE2, 0x08, 0x00, 0x51, 0x0F, 0x20, 0xF7, 0x00, 0xAE, 0x00, 0xDF, 0x00

; ---------------------------------------------------------------------------------
; Memory Alloc: X - Step 02

ShootingFountainX2:

; Interleaved

DB 0xFF, 0x00, 0x83, 0x00, 0xDF, 0x00, 0xF9, 0x00, 0x01, 0x7C, 0x0F, 0x20, 0xE0, 0x06, 0x00, 0xFE, 0x0F, 0xE0, 0xC0, 0x1D, 0x00, 0xF1, 0x1F, 0xC0, 0x80, 0x3D, 0x00, 0xFF, 0x0F, 0xA0, 0x00, 0x67, 0x00, 0xDE, 0x0F, 0x60, 0x00, 0x5B, 0x00, 0xE1, 0x0F, 0xE0, 0x00, 0x6D, 0x00, 0xBF, 0x0F, 0xA0, 0x00, 0x6E, 0x00, 0xFB, 0x0F, 0x60, 0x00, 0x77, 0x00, 0x7D, 0x07, 0xF0, 0x00, 0x6A, 0x00, 0x7F, 0x07, 0xB0, 0x00, 0x6B, 0x00, 0x7D, 0x07, 0xF0, 0x00, 0x6B, 0x00, 0xFF, 0x07, 0xE0, 0x00, 0x6B, 0x00, 0xFF, 0x03, 0xF8, 0x00, 0x6C, 0x00, 0xFF, 0x03, 0xE8, 0x00, 0x6F, 0x00, 0xFF, 0x03, 0xC8, 0x00, 0x6F, 0x00, 0xFD, 0x07, 0xD0, 0x00, 0x6D, 0x00, 0xFB, 0x03, 0x78, 0x00, 0x6D, 0x00, 0xBF, 0x03, 0xB8, 0x00, 0x4F, 0x00, 0xBF, 0x03, 0xF0, 0x00, 0x5E, 0x00, 0xC7, 0x01, 0xCC, 0x00, 0x6B, 0x00, 0xF8, 0x00, 0x12, 0x00, 0x6F, 0x00, 0xFF, 0x00, 0xCE, 0x00, 0x6F, 0x00, 0x7F, 0x00, 0x3E, 0x00, 0x69, 0x00, 0xFC, 0x00, 0xFA, 0x00, 0x66, 0x00, 0x03, 0x01, 0xF4, 0x80, 0x2F, 0x00, 0x76, 0x00, 0xEE, 0x00, 0x5F, 0x00, 0xAF, 0x01, 0xD0, 0x00, 0x67, 0x00, 0xDB, 0x03, 0x18, 0x90, 0x01, 0x00, 0xDC, 0xC7, 0x00, 0xE2, 0x08, 0x00, 0x51, 0x0F, 0x20, 0xF7, 0x00, 0xAE, 0x00, 0xDF, 0x00

