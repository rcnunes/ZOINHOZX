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
; INCLUDE - SnakeSpriteData_I01
; =================================================================================

; =================================================================================
; SPRITE - (1,2,3,4) - 16 x 24 pixels (= 2 x 3 attributes)
; =================================================================================

; ---------------------------------------------------------------------------------
; Memory Alloc: Snake sprite data

SnakeSpriteData:

; ---------------------------------------------------------------------------------
; Memory Alloc: Snake

; Interleaved

SnakeSpriteDataXF1:

DB 0xFC, 0x00, 0x1F, 0x00, 0xF8, 0x03, 0x0F, 0xE0, 0xF0, 0x07, 0x07, 0xF0, 0xE0, 0x0E, 0x03, 0x48, 0xE0, 0x0B, 0x03, 0x58, 0xE0, 0x0D, 0x07, 0xF0, 0xE0, 0x0E, 0x0F, 0xA0, 0xF0, 0x05, 0x07, 0x10, 0xF0, 0x06, 0x0F, 0xE0, 0xF0, 0x07, 0x1F, 0x00, 0xD8, 0x03, 0x1F, 0xC0, 0x88, 0x22, 0x0F, 0x20, 0x98, 0x03, 0x0F, 0xE0, 0x18, 0x43, 0x07, 0x10, 0x88, 0x23, 0x07, 0xF0, 0x0C, 0x61, 0x03, 0x88, 0x04, 0x41, 0x01, 0xFC, 0x00, 0x79, 0x01, 0x84, 0x80, 0x1D, 0x01, 0xFC, 0xC0, 0x1B, 0x01, 0x84, 0xC0, 0x1F, 0x01, 0xFC, 0xE0, 0x0E, 0x03, 0x08, 0xC0, 0x13, 0x07, 0xF0, 0xE0, 0x05, 0x0F, 0x40

SnakeSpriteDataXF2:

DB 0xFF, 0x00, 0x07, 0x00, 0xFE, 0x00, 0x03, 0xF8, 0xFC, 0x01, 0x01, 0xFC, 0xF8, 0x03, 0x00, 0x92, 0xF8, 0x02, 0x00, 0xD6, 0xF8, 0x03, 0x01, 0x7C, 0xF8, 0x03, 0x03, 0x28, 0xFC, 0x01, 0x07, 0x80, 0xFC, 0x01, 0x07, 0x40, 0xFE, 0x00, 0x03, 0xB8, 0xBE, 0x00, 0x07, 0xC0, 0x1F, 0x40, 0x03, 0x78, 0xAF, 0x00, 0x03, 0x78, 0xC7, 0x10, 0x01, 0x64, 0xE3, 0x08, 0x01, 0x7C, 0xE1, 0x0C, 0x01, 0x64, 0xE1, 0x04, 0x00, 0x7E, 0xC0, 0x1C, 0x00, 0xE2, 0xC0, 0x18, 0x00, 0xFE, 0xC0, 0x1E, 0x00, 0xC2, 0xE0, 0x0F, 0x00, 0xFE, 0xC0, 0x17, 0x01, 0x04, 0xE0, 0x05, 0x03, 0xF8, 0xF8, 0x02, 0x07, 0xA0

SnakeSpriteDataXB1:

DB 0xFC, 0x00, 0x1F, 0x00, 0xF0, 0x03, 0x0F, 0xE0, 0xE0, 0x0F, 0x07, 0xF0, 0xC0, 0x1F, 0x03, 0xF8, 0xC0, 0x1D, 0x07, 0x50, 0xC0, 0x1E, 0x03, 0xE8, 0xE0, 0x0F, 0x03, 0xF8, 0xF0, 0x07, 0x07, 0xF0, 0xF8, 0x03, 0x0F, 0xA0, 0xF8, 0x03, 0x1F, 0xC0, 0xF8, 0x03, 0x1D, 0x40, 0xF0, 0x07, 0x38, 0x82, 0xF0, 0x06, 0x3D, 0x80, 0xE0, 0x0F, 0x38, 0x82, 0xE0, 0x0E, 0x31, 0x84, 0xC0, 0x1B, 0x70, 0x06, 0x80, 0x3F, 0x20, 0x82, 0x80, 0x3C, 0x00, 0x1E, 0x80, 0x3B, 0x01, 0xF8, 0x80, 0x3E, 0x03, 0xD8, 0xC0, 0x1F, 0x03, 0xF8, 0xE0, 0x0F, 0x07, 0xF0, 0xC0, 0x17, 0x0F, 0xC0, 0xE0, 0x0A, 0x0F, 0xA0

SnakeSpriteDataXB2:

DB 0xF0, 0x00, 0x7F, 0x00, 0xC0, 0x0F, 0x3F, 0x80, 0x80, 0x3F, 0x1F, 0xC0, 0x00, 0x7F, 0x0F, 0xE0, 0x00, 0x6A, 0x0F, 0xA0, 0x00, 0x77, 0x0F, 0x60, 0x80, 0x3F, 0x0F, 0xE0, 0xC0, 0x1F, 0x1F, 0xC0, 0xE0, 0x0E, 0x3F, 0x80, 0xF0, 0x07, 0x7F, 0x00, 0xF0, 0x05, 0x7B, 0x00, 0xF0, 0x07, 0x31, 0x84, 0xF0, 0x06, 0x2B, 0x80, 0xE0, 0x0F, 0x07, 0x90, 0xE0, 0x0E, 0x23, 0x88, 0xC0, 0x1B, 0x43, 0x18, 0xC0, 0x1F, 0x43, 0x10, 0xC0, 0x1C, 0x41, 0x1C, 0xC0, 0x1B, 0x00, 0x8E, 0xC0, 0x1E, 0x00, 0xFA, 0xE0, 0x0F, 0x00, 0xDE, 0xF0, 0x07, 0x01, 0xFC, 0xE0, 0x0B, 0x03, 0xF0, 0xF0, 0x02, 0x0F, 0xA0

