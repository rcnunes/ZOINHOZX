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
; INCLUDE - TemplateBeeper
; =================================================================================

; =================================================================================
; Memory Alloc: Greensleeves beeper template
GreenSleevesBeeperTemplate:

; =================================================================================

      DB 0x4B ; Beeper size (in pairs)

; ---------------------------------------------------------------------------------
; Beeper pairs (duration, pitch)

DW 0x0058, 0x05B3
DW 0x00D1, 0x04C6
DW 0x0075, 0x043E
DW 0x0107, 0x03C4
DW 0x002E, 0x038C
DW 0x002B, 0x03C4
DW 0x00EB, 0x043E
DW 0x0062, 0x0511
DW 0x009C, 0x066A
DW 0x001D, 0x05B3
DW 0x0020, 0x0511
DW 0x00D1, 0x04C6
DW 0x0058, 0x05B3
DW 0x00B0, 0x05B3
DW 0x001B, 0x060C
DW 0x001D, 0x05B3
DW 0x00C5, 0x0511
DW 0x0053, 0x060C
DW 0x0084, 0x07A6
DW 0x0058, 0x05B3
DW 0x00D1, 0x04C6
DW 0x0075, 0x043E
DW 0x0107, 0x03C4
DW 0x002E, 0x038C
DW 0x002B, 0x03C4
DW 0x00EB, 0x043E
DW 0x0062, 0x0511
DW 0x009C, 0x066A
DW 0x001D, 0x05B3
DW 0x0020, 0x0511
DW 0x0068, 0x04C6
DW 0x0062, 0x0511
DW 0x0058, 0x05B3
DW 0x0053, 0x060C
DW 0x004A, 0x06CD
DW 0x0053, 0x060C
DW 0x00B0, 0x05B3
DW 0x2293, 0x0000
DW 0x0139, 0x0326
DW 0x009C, 0x0326
DW 0x009C, 0x0326
DW 0x0094, 0x0357
DW 0x0083, 0x03C4
DW 0x00EB, 0x043E
DW 0x0062, 0x0511
DW 0x004E, 0x066A
DW 0x0058, 0x05B3
DW 0x0062, 0x0511
DW 0x00D1, 0x04C6
DW 0x0058, 0x05B3
DW 0x0058, 0x05B3
DW 0x0053, 0x060C
DW 0x0058, 0x05B3
DW 0x00C5, 0x0511
DW 0x0053, 0x060C
DW 0x0084, 0x07A6
DW 0x2293, 0x0000
DW 0x0139, 0x0326
DW 0x009C, 0x0326
DW 0x009C, 0x0326
DW 0x0094, 0x0357
DW 0x0083, 0x03C4
DW 0x00EB, 0x043E
DW 0x0062, 0x0511
DW 0x004E, 0x066A
DW 0x0058, 0x05B3
DW 0x0062, 0x0511
DW 0x0068, 0x04C6
DW 0x0062, 0x0511
DW 0x0058, 0x05B3
DW 0x0053, 0x060C
DW 0x004A, 0x06CD
DW 0x0053, 0x060C
DW 0x0125, 0x05B3
DW 0x2293, 0x0000

; =================================================================================
; Memory Alloc: Greensleeves beeper template
ZoinhoDeadBeeperTemplate:

; =================================================================================

      DB 0x10 ; Beeper size (in pairs)

; ---------------------------------------------------------------------------------
; Beeper pairs (duration, pitch)

DW 0x001A, 0x0128
DW 0x0070, 0x002F
DW 0x00A5, 0x0016
DW 0x00F1, 0x0006
DW 0x000B, 0x02F2
DW 0x0010, 0x01F3
DW 0x004A, 0x0058
DW 0x00CD, 0x000C
DW 0x0008, 0x03B3
DW 0x0008, 0x03E1
DW 0x0013, 0x019F
DW 0x00DC, 0x0009
DW 0x0019, 0x013D
DW 0x002C, 0x00A7
DW 0x000E, 0x023B
DW 0x000C, 0x0299


; =================================================================================
; Memory Alloc: Steps beeper template
StepsBeeperTemplate:

; =================================================================================

      DB 0x02 ; Beeper size (in pairs)

; ---------------------------------------------------------------------------------
; Beeper pairs (duration, pitch)

DW 0x0006, 0x0128
DW 0x001C, 0x002F

; =================================================================================
; Memory Alloc: Jump beeper template
JumpBeeperTemplate:

; =================================================================================

      DB 0x04 ; Beeper size (in pairs)

; ---------------------------------------------------------------------------------
; Beeper pairs (duration, pitch)

DW 0x0004, 0x01F0
DW 0x0004, 0x019D
DW 0x0005, 0x0156
DW 0x0006, 0x011B

; =================================================================================
; Memory Alloc: Portal beeper template
ActionBeeperTemplate:

; =================================================================================

      DB 0x07 ; Beeper size (in pairs)

; ---------------------------------------------------------------------------------
; Beeper pairs (duration, pitch)

DW 0x000B, 0x009C
DW 0x0009, 0x00BF
DW 0x0008, 0x00E9
DW 0x0006, 0x011B
DW 0x0005, 0x0156
DW 0x0004, 0x019D
DW 0x0004, 0x01F0

; =================================================================================
; Memory Alloc: Enemy beeper template
EnemyDeadBeeperTemplate:

; =================================================================================

      DB 0x13 ; Beeper size (in pairs)

; ---------------------------------------------------------------------------------
; Beeper pairs (duration, pitch)

DW 0x0015, 0x03C4
DW 0x0014, 0x03FF
DW 0x0013, 0x043E
DW 0x0012, 0x0480
DW 0x0011, 0x04C6
DW 0x0010, 0x0511
DW 0x000F, 0x0560
DW 0x000E, 0x05B3
DW 0x000D, 0x060C
DW 0x000D, 0x066A
DW 0x000C, 0x06CD
DW 0x000B, 0x0736
DW 0x000B, 0x07A6
DW 0x000A, 0x081C
DW 0x0009, 0x0899
DW 0x0009, 0x091E
DW 0x0008, 0x09AA
DW 0x0008, 0x0A3F
DW 0x0007, 0x0ADD

; =================================================================================
; Memory Alloc: Chopin - Nocturne Opus 55 No. 1 - beeper template
ChopinNocturneOpus55No1BeeperTemplate:

; =================================================================================

      DB 0x4C ; Beeper size (in pairs)

; ---------------------------------------------------------------------------------
; Beeper pairs (duration, pitch)

DW 0x00A4, 0x0279
DW 0x00DC, 0x07A6
DW 0x0105, 0x0326
DW 0x00A4, 0x0279
DW 0x00DB, 0x01D3
DW 0x003D, 0x06CD
DW 0x0125, 0x02CB
DW 0x0125, 0x0210
DW 0x015D, 0x0254
DW 0x01B7, 0x01D3
DW 0x0105, 0x066A
DW 0x0149, 0x0279
DW 0x009B, 0x02A1
DW 0x00A4, 0x0279
DW 0x00AE, 0x0254
DW 0x0052, 0x0A3F
DW 0x00F7, 0x0279
DW 0x00A4, 0x0511
DW 0x009B, 0x03FF
DW 0x007B, 0x0357
DW 0x00C3, 0x0210
DW 0x00DC, 0x07A6
DW 0x0105, 0x0326
DW 0x00F7, 0x0279
DW 0x00DB, 0x01D3
DW 0x007B, 0x06CD
DW 0x0125, 0x0210
DW 0x0061, 0x043E
DW 0x0092, 0x02CB
DW 0x00AE, 0x0254
DW 0x00C3, 0x0210
DW 0x00AE, 0x0254
DW 0x0105, 0x066A
DW 0x0149, 0x0279
DW 0x0092, 0x043E
DW 0x007B, 0x0357
DW 0x004E, 0x0326
DW 0x0061, 0x0210
DW 0x0052, 0x0279
DW 0x0057, 0x0254
DW 0x0052, 0x0A3F
DW 0x00F7, 0x0279
DW 0x00A4, 0x0511
DW 0x009B, 0x03FF
DW 0x007B, 0x0357
DW 0x00DC, 0x07A6
DW 0x0105, 0x0326
DW 0x00F7, 0x0279
DW 0x00DB, 0x01D3
DW 0x007B, 0x06CD
DW 0x00DC, 0x02CB
DW 0x00C3, 0x0210
DW 0x00AE, 0x0254
DW 0x0105, 0x066A
DW 0x0149, 0x0279
DW 0x0062, 0x066A
DW 0x0062, 0x0279
DW 0x0092, 0x05B3
DW 0x00A4, 0x03C4
DW 0x0092, 0x02CB
DW 0x0045, 0x02F7
DW 0x0049, 0x02CB
DW 0x00A4, 0x0279
DW 0x00AE, 0x0254
DW 0x00DC, 0x07A6
DW 0x00DB, 0x03C4
DW 0x00C4, 0x0326
DW 0x0052, 0x0A3F
DW 0x007B, 0x0511
DW 0x0067, 0x03FF
DW 0x0056, 0x0326
DW 0x007B, 0x0357
DW 0x006D, 0x03C4
DW 0x014A, 0x07A6
DW 0x0149, 0x0511
DW 0x00DB, 0x03C4
