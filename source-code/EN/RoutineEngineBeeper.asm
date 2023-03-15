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
; INCLUDE - RoutineEngineSound
; =================================================================================

; =============================================================
; Label: Speccy ROM Beeper routine address
; -------------------------------------------------------------
SpeccyROMBeeper EQU 0x03B5

; =============================================================
; Routine: PlayBeeper
; -------------------------------------------------------------
; -> HL: Beeper Template pointer
; -------------------------------------------------------------
PlayBeeper:

      PUSH HL
      PUSH DE
      PUSH BC
      PUSH AF

; -------------------------------------------------------------

      ; Get number of pairs (duration, pitch)
      LD A,(HL)
      INC HL

; -------------------------------------------------------------

PlayBeeperLoop:

      ; Get Duration
      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL

      ; Get Pitch
      LD C,(HL)
      INC HL
      LD B,(HL)
      INC HL

; -------------------------------------------------------------

      PUSH HL

      PUSH BC
      POP HL

      PUSH AF

      ; Call Speccy ROM Beeper routine
      CALL SpeccyROMBeeper

      POP AF

      POP HL

; -------------------------------------------------------------

      ; Check for next pair
      DEC A
      JR NZ,PlayBeeperLoop

; -------------------------------------------------------------

      POP AF
      POP BC
      POP DE
      POP HL

      RET

; =============================================================
; Memory Alloc: Beeper counters
; -------------------------------------------------------------
BeeperCounter: DB 0x00
BeeperPointer: DB 0x00
BeeperStep:    DB 0x01

; =============================================================
; Routine: PlayBeeperInterleavedClear
; -------------------------------------------------------------
PlayBeeperInterleavedClear:

      XOR A

      LD (BeeperCounter),A
      LD (BeeperPointer),A

      INC A
      LD (BeeperStep),A

; -------------------------------------------------------------

      RET

; =============================================================
; Routine: PlayBeeperInterleaved
; -------------------------------------------------------------
; -> HL: Beeper Template pointer
; -------------------------------------------------------------
PlayBeeperInterleaved:

      PUSH HL
      PUSH DE
      PUSH BC
      PUSH AF

; -------------------------------------------------------------

      EI

; -------------------------------------------------------------

      LD A,(BeeperCounter)

      CP 0x00
      JR Z,PlayBeeperInterleavedResetCounter

      INC HL

      LD A,(BeeperPointer)

      EX DE,HL

      LD H,0x00
      LD L,A

      ADD HL,HL
      ADD HL,HL

      ADD HL,DE

      JR PlayBeeperInterleavedContinue

PlayBeeperInterleavedResetCounter:

      ; Get number of pairs (duration, pitch)
      LD A,(HL)
      INC HL

      LD (BeeperCounter),A

      XOR A
      LD (BeeperPointer),A

PlayBeeperInterleavedContinue:

      LD A,(BeeperStep)

; -------------------------------------------------------------

PlayBeeperInterleavedLoop:

      ; Get Duration
      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL

      ; Get Pitch
      LD C,(HL)
      INC HL
      LD B,(HL)
      INC HL

; -------------------------------------------------------------

      PUSH HL

      PUSH BC
      POP HL

      PUSH AF

      ; Call Speccy ROM Beeper routine
      CALL SpeccyROMBeeper

      POP AF

; -------------------------------------------------------------

      LD HL,BeeperCounter

      DEC (HL)
      JR NZ,PlayBeeperInterleavedGoOn

      XOR A
      LD (BeeperCounter),A
      LD (BeeperPointer),A

      POP HL

      JR PlayBeeperInterleavedEnd

PlayBeeperInterleavedGoOn:

      LD HL,BeeperPointer
      INC (HL)

; -------------------------------------------------------------

      POP HL

; -------------------------------------------------------------

      ; Check for next pair
      DEC A
      JR NZ,PlayBeeperInterleavedLoop

; -------------------------------------------------------------

PlayBeeperInterleavedEnd

; -------------------------------------------------------------

      DI

      POP AF
      POP BC
      POP DE
      POP HL

      RET
