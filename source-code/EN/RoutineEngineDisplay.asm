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
; Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)
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
; INCLUDE - RoutineEngineDisplay
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

;--------------------------------------------------------------
; Speccy screen memory base addresses and offsets

SpeccyScreenSize              EQU 0x1B00 ; Speccy screen size in bytes
SpeccyScreenPixelLines        EQU 0xC0   ; Speccy screen pixel lines
SpeccyScreenAttributesOffset  EQU 0x1800 ; Speccy screen offset to attributes
SpeccyScreenAttributesLines   EQU 0x18   ; Speccy screen attributes lines
SpeccyScreenAttributesAddress EQU 0x5800 ; Speccy screen attributes address
SpeccyScreenAddressLineOffset EQU 0x0020 ; Speccy screen address line offset

SpeccyScreenFrameCounterAddress EQU 0x5C78 ; Speccy screen frame counter address

; -------------------------------------------------------------
; Memory Alloc: Old junk still used somewhere else

LineCounter:   DB 00

StackPointer:    DW 0x0000
StackPointerAux: DW 0x0000

BufferScreenCurrentAddress: DW 0x0000

; =============================================================
; Routine: Screen buffer swap
;--------------------------------------------------------------
SwapScreenBuffer:

      ; Wait for next screen frame refresh interrupt
      EI
      HALT
      DI

;--------------------------------------------------------------

      ; Preserve Stack Pointer
      DI
      LD (StackPointer),SP

;--------------------------------------------------------------

      ; Copy buffer to Speccy screen (unrolled LDIs)
      LD SP,SpeccyLineMappingAddress

      LD HL,BufferScreenAddress

      LD A,SpeccyScreenPixelLines ; Number of lines to be copied (192 lines)

;--------------------------------------------------------------

CopyBufferLineLoop:

      POP DE ; Get next Speccy screen destination address

      LDI ; 32 unrolled LDIs (entire Speccy screen line, 32 bytes)
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI

      ; Evaluate loop
      DEC A
      JR NZ,CopyBufferLineLoop

;--------------------------------------------------------------

      ; Restore Stack Pointer
      LD SP,(StackPointer)
      EI

;--------------------------------------------------------------

      RET

; =============================================================
; Routine: Clear screen buffer
;--------------------------------------------------------------
ScreenBufferClear:

      ; Preserve registers
      PUSH BC
      PUSH HL
      PUSH AF

;--------------------------------------------------------------

      ; Preserve Stack Pointer
      DI
      LD (StackPointer),SP

;--------------------------------------------------------------

      LD HL,BufferScreenAddress
      LD BC,SpeccyScreenSize
      ADD HL,BC

      LD SP,HL

      LD HL,0x0000

      ; 192 screen lines + 24 attribute lines
      LD A,SpeccyScreenPixelLines+SpeccyScreenAttributesLines

;--------------------------------------------------------------
; Clear entire line

ClearScreenLineLoop:

      PUSH HL
      PUSH HL
      PUSH HL
      PUSH HL

      PUSH HL
      PUSH HL
      PUSH HL
      PUSH HL

      PUSH HL
      PUSH HL
      PUSH HL
      PUSH HL

      PUSH HL
      PUSH HL
      PUSH HL
      PUSH HL

      ; Evaluate loop
      DEC A
      JP NZ,ClearScreenLineLoop

;--------------------------------------------------------------

      ; Restore Stack Pointer
      LD SP,(StackPointer)
      EI

;--------------------------------------------------------------

      ; Restore registers
      POP AF
      POP HL
      POP BC

      ; Exit subroutine
      RET

; -------------------------------------------------------------
; Memory Alloc: Precalculated Speccy screen hires line mapping addresses (all 192 of them)
SpeccyLineMappingAddress:

      DW 0x4000
      DW 0x4100
      DW 0x4200
      DW 0x4300
      DW 0x4400
      DW 0x4500
      DW 0x4600
      DW 0x4700
      DW 0x4020
      DW 0x4120
      DW 0x4220
      DW 0x4320
      DW 0x4420
      DW 0x4520
      DW 0x4620
      DW 0x4720
      DW 0x4040
      DW 0x4140
      DW 0x4240
      DW 0x4340
      DW 0x4440
      DW 0x4540
      DW 0x4640
      DW 0x4740
      DW 0x4060
      DW 0x4160
      DW 0x4260
      DW 0x4360
      DW 0x4460
      DW 0x4560
      DW 0x4660
      DW 0x4760
      DW 0x4080
      DW 0x4180
      DW 0x4280
      DW 0x4380
      DW 0x4480
      DW 0x4580
      DW 0x4680
      DW 0x4780
      DW 0x40A0
      DW 0x41A0
      DW 0x42A0
      DW 0x43A0
      DW 0x44A0
      DW 0x45A0
      DW 0x46A0
      DW 0x47A0
      DW 0x40C0
      DW 0x41C0
      DW 0x42C0
      DW 0x43C0
      DW 0x44C0
      DW 0x45C0
      DW 0x46C0
      DW 0x47C0
      DW 0x40E0
      DW 0x41E0
      DW 0x42E0
      DW 0x43E0
      DW 0x44E0
      DW 0x45E0
      DW 0x46E0
      DW 0x47E0
      DW 0x4800
      DW 0x4900
      DW 0x4A00
      DW 0x4B00
      DW 0x4C00
      DW 0x4D00
      DW 0x4E00
      DW 0x4F00
      DW 0x4820
      DW 0x4920
      DW 0x4A20
      DW 0x4B20
      DW 0x4C20
      DW 0x4D20
      DW 0x4E20
      DW 0x4F20
      DW 0x4840
      DW 0x4940
      DW 0x4A40
      DW 0x4B40
      DW 0x4C40
      DW 0x4D40
      DW 0x4E40
      DW 0x4F40
      DW 0x4860
      DW 0x4960
      DW 0x4A60
      DW 0x4B60
      DW 0x4C60
      DW 0x4D60
      DW 0x4E60
      DW 0x4F60
      DW 0x4880
      DW 0x4980
      DW 0x4A80
      DW 0x4B80
      DW 0x4C80
      DW 0x4D80
      DW 0x4E80
      DW 0x4F80
      DW 0x48A0
      DW 0x49A0
      DW 0x4AA0
      DW 0x4BA0
      DW 0x4CA0
      DW 0x4DA0
      DW 0x4EA0
      DW 0x4FA0
      DW 0x48C0
      DW 0x49C0
      DW 0x4AC0
      DW 0x4BC0
      DW 0x4CC0
      DW 0x4DC0
      DW 0x4EC0
      DW 0x4FC0
      DW 0x48E0
      DW 0x49E0
      DW 0x4AE0
      DW 0x4BE0
      DW 0x4CE0
      DW 0x4DE0
      DW 0x4EE0
      DW 0x4FE0
      DW 0x5000
      DW 0x5100
      DW 0x5200
      DW 0x5300
      DW 0x5400
      DW 0x5500
      DW 0x5600
      DW 0x5700
      DW 0x5020
      DW 0x5120
      DW 0x5220
      DW 0x5320
      DW 0x5420
      DW 0x5520
      DW 0x5620
      DW 0x5720
      DW 0x5040
      DW 0x5140
      DW 0x5240
      DW 0x5340
      DW 0x5440
      DW 0x5540
      DW 0x5640
      DW 0x5740
      DW 0x5060
      DW 0x5160
      DW 0x5260
      DW 0x5360
      DW 0x5460
      DW 0x5560
      DW 0x5660
      DW 0x5760
      DW 0x5080
      DW 0x5180
      DW 0x5280
      DW 0x5380
      DW 0x5480
      DW 0x5580
      DW 0x5680
      DW 0x5780
      DW 0x50A0
      DW 0x51A0
      DW 0x52A0
      DW 0x53A0
      DW 0x54A0
      DW 0x55A0
      DW 0x56A0
      DW 0x57A0
      DW 0x50C0
      DW 0x51C0
      DW 0x52C0
      DW 0x53C0
      DW 0x54C0
      DW 0x55C0
      DW 0x56C0
      DW 0x57C0
      DW 0x50E0
      DW 0x51E0
      DW 0x52E0
      DW 0x53E0
      DW 0x54E0
      DW 0x55E0
      DW 0x56E0
      DW 0x57E0

; =============================================================
; Routine: Screen buffer colour attributes swap
;--------------------------------------------------------------
SwapScreenBufferColourAttributes:

;--------------------------------------------------------------

      DI

; -------------------------------------------------------------

      ; Set up colour attribute initial address in buffer screen
      LD HL,BufferScreenAddress
      LD BC,SpeccyScreenAttributesOffset
      ADD HL,BC

      LD DE,SpeccyScreenAttributesAddress

; -------------------------------------------------------------

      LD A,SpeccyScreenAttributesLines

SwapScreenBufferColourAttributeLoop:

      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI

      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI

      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI

      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI
      LDI

      DEC A
      JR NZ,SwapScreenBufferColourAttributeLoop

;--------------------------------------------------------------

      EI

;--------------------------------------------------------------

      RET ; Exit

; =============================================================
; Labels: Speccy ROM Border routine address
;--------------------------------------------------------------
SpeccyROMBorderRoutine EQU 0x229B

; =============================================================
; Routine: Speccy Screen border set to black
;--------------------------------------------------------------
SpeccyBorderSetToBlack:

      XOR A
      CALL SpeccyROMBorderRoutine

;--------------------------------------------------------------

      RET

; =============================================================
; Routine: Screen buffer swap all (pixels & attributes)
;--------------------------------------------------------------
SwapScreenBufferAll:

      CALL SwapScreenBuffer
      CALL SwapScreenBufferColourAttributes

;--------------------------------------------------------------

      RET