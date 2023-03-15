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
; INCLUDE - RoutineEngineCollision
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; -------------------------------------------------------------
; Memory Alloc: Store Positions
PositionObjectStore: DB 0x00, 0x00, 0x00

; -------------------------------------------------------------
; Memory Alloc: Check Positions
CheckPositionObject:     DB 0x00, 0x00, 0x00
CheckPositionObjectHigh: DB 0x00, 0x00, 0x00

CheckPositionObstacle:     DB 0x00, 0x00, 0x00
CheckPositionObstacleHigh: DB 0x00, 0x00, 0x00

; -------------------------------------------------------------
; Memory Alloc: Check Dimensions
CheckDimensionsObject:   DB 0x00, 0x00, 0x00
CheckDimensionsObstacle: DB 0x00, 0x00, 0x00

; -------------------------------------------------------------
; Memory Alloc: Check Minimap Indices Array (Check Volume)
CheckMMIdxArray: DB 0x00, 0x04, 0x20, 0x24, 0x01, 0x05, 0x21, 0x25

; -------------------------------------------------------------
; Memory Alloc: Check Minimap Indices
CheckMMIdxObject:   DW 0x0000
CheckMMIdxObstacle: DW 0x0000

; -------------------------------------------------------------
; Memory Alloc: Collided sprite ID
CollidedSpriteID: DB 0x00
CollidedSpriteInstancePointer: DW 0x0000

; -------------------------------------------------------------
; Memory Alloc: Collision dimension counter
CollisionDimensionCounter: DB 0x00

; =============================================================
; Routine: Calculate position high limits
; -------------------------------------------------------------
; -> HL: Check Position Mem Alloc
; -> BC: Check Dimension Mem Alloc
; -> DE: Check Position High Mem Alloc
; -------------------------------------------------------------
CalcPositionHigh:

   LD A,(BC)
   ADD A,(HL)
   LD (DE),A

   INC HL
   INC BC
   INC DE

   LD A,(BC)
   ADD A,(HL)
   LD (DE),A

   INC HL
   INC BC
   INC DE

   LD A,(BC)
   ADD A,(HL)
   LD (DE),A

   INC HL
   INC BC
   INC DE

; -------------------------------------------------------------

   RET

; =============================================================
; Routine: Store object position
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -> HL: Position Mem Alloc
; -------------------------------------------------------------
StorePosition:

   PUSH DE
   PUSH HL

; -------------------------------------------------------------

   PUSH HL

   LD HL,0x0001*ATTR_SpriteInstanceIsoPosX
   ADD HL,DE

   POP DE

   LDI
   LDI
   LDI

; -------------------------------------------------------------

   POP HL
   POP DE

   RET

; =============================================================
; Routine: Restore object position
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
RestorePositionObject:

   PUSH DE

; -------------------------------------------------------------

   LD HL,0x0001*ATTR_SpriteInstanceIsoPosX
   ADD HL,DE

   LD DE,PositionObjectStore

   EX DE,HL

   LDI
   LDI
   LDI

; -------------------------------------------------------------

   POP DE

   RET

; =============================================================
; Routine: Collision Check
; -------------------------------------------------------------
; -> DE: Object sprite instance pointer
; -> HL: Object dimensions pointer
; -> BC: Obstacle dimensions pointer
; -------------------------------------------------------------
CollisionCheck:

   PUSH DE

; -------------------------------------------------------------

   PUSH BC

   ; Store object dimensions
   LD DE,CheckDimensionsObject
   LDI
   LDI
   LDI

   ; Store obstacle dimensions
   POP HL
   LD DE,CheckDimensionsObstacle
   LDI
   LDI
   LDI

; -------------------------------------------------------------

   POP DE
   PUSH DE

   ; Store object position
   LD HL,CheckPositionObject
   CALL StorePosition

; -------------------------------------------------------------

   ; Calculate object position high limits
   LD HL,CheckPositionObject
   LD BC,CheckDimensionsObject
   LD DE,CheckPositionObjectHigh

   CALL CalcPositionHigh

; -------------------------------------------------------------

   POP DE
   PUSH DE

   ; Get current proposed object minimap index (this will be the check origin)
   LD HL,0x0001*ATTR_SpriteInstanceMinimapIndex
   ADD HL,DE

   LD A,(HL)

; -------------------------------------------------------------
; =============================================================

       ; Minimap collision check volume loop
       LD HL,CheckMMIdxArray

       LD B,0x08 ; Minimap array size

CollisionCheckVolumeLoop:

       PUSH BC ; Store arry index counter
       PUSH AF ; Store minimap index base

       ADD A,(HL) ; Add minimap index offset
       JR C,CollisionCheckDimensionSkip ; If index exceeds 255, it is out of range

       INC HL ; Increment minimap offset array index

       PUSH HL ; Store minimap offset array index

       CALL MinimapStackGetSpriteFromIndex

; -------------------------------------------------------------

       ; Clear collision dimension counter
       XOR A
       LD (CollisionDimensionCounter),A

; -------------------------------------------------------------

       ; Check whether minimap position is filled with a valid sprite
       LD A,D
       ADD A,E
       JR Z,CollisionCheckDimensionContinue

; -------------------------------------------------------------
; =============================================================

       ; Store sprite instance ID
       LD A,(DE)
       LD (CollidedSpriteID),A
       LD(CollidedSpriteInstancePointer),DE

; -------------------------------------------------------------

       ; Store obstacle position for later check
       LD HL,CheckPositionObstacle
       CALL StorePosition

; -------------------------------------------------------------

       ; Calculate obstacle position high limits
       LD BC,CheckDimensionsObstacle
       LD DE,CheckPositionObstacleHigh
       CALL CalcPositionHigh

; -------------------------------------------------------------
; =============================================================

       ; Collision check dimension loop
       LD HL,CheckPositionObject
       LD DE,CheckPositionObstacle

       ; We have 3 dimensions to check
       LD B,0x03

CollisionCheckDimensionLoop:

           PUSH BC
           PUSH HL
           PUSH DE

; -------------------------------------------------------------

           LD B,(HL)
           INC HL
           INC HL
           INC HL
           LD C,(HL)

           LD A,(DE)
           ADD A,0x08 ; Hardcoded offset adjustment

; -------------------------------------------------------------

           CP B
           JR C,CollisionCheckObstacleHigh

           CP C
           JR C,CollisionCheckObstacleHigh

           JR CollisionCheckPassed

; -------------------------------------------------------------

CollisionCheckObstacleHigh:

           INC DE
           INC DE
           INC DE

           LD A,(DE)
           ADD A,0x08 ; Hardcoded offset adjustment

; -------------------------------------------------------------

           CP B
           JR NC,CollisionCheckDetected

           CP C
           JR NC,CollisionCheckDetected

           JR CollisionCheckPassed

; -------------------------------------------------------------

CollisionCheckDetected:

           LD A,(CollisionDimensionCounter)
           INC A
           LD (CollisionDimensionCounter),A

; -------------------------------------------------------------

CollisionCheckPassed:

           POP DE
           POP HL

           INC HL
           INC DE

           ; Iterate through each of the 3 dimensions
           POP BC
           DJNZ CollisionCheckDimensionLoop

; -------------------------------------------------------------

       ; Evaluate whether a collision was detected
       CP 0x03 ; It takes all 3 dimensions to be hit
       JR NZ,CollisionCheckDimensionContinue

; -------------------------------------------------------------

       ; Collision detected
       POP HL
       POP AF
       POP BC

       ; Set carry flag (collision is detected)
       SCF

       JR CollisionCheckEnd

; -------------------------------------------------------------

CollisionCheckDimensionSkip:

       ; Minimap check array loop
       POP AF ; Restore object's minimap index
       POP BC ; Restore minimap check array index

       ; Iterate through next minimap volume index
       DJNZ CollisionCheckVolumeLoop

; -------------------------------------------------------------

       ; Reset carry flag (no collision is detected)
       XOR A
       JR CollisionCheckEnd

; -------------------------------------------------------------

CollisionCheckDimensionContinue:

       ; Minimap check array loop
       POP HL ; Restore minimap check array pointer
       POP AF ; Restore object's minimap index
       POP BC ; Restore minimap check array index

       ; Iterate through next minimap volume index
       DJNZ CollisionCheckVolumeLoop

       ; Reset carry flag (no collision is detected)
       XOR A

; =============================================================
; -------------------------------------------------------------

CollisionCheckEnd:

   POP DE

   RET



; #############################################################
; OLD VERSION
; #############################################################

; -------------------------------------------------------------
; Memory Alloc: Temporary Position Iso position and Minimap index
TempIsoPosition: DB 0x00, 0x00, 0x00

; -------------------------------------------------------------
; Memory Alloc: Check Position Iso position and Minimap index
CheckIsoPosition:  DB 0x00, 0x00, 0x00
CheckMinimapIndex: DB 0x00

; =============================================================
; ROUTINE DEFINITIONS
; =============================================================

; =============================================================
; Routine: Store Iso position
; -------------------------------------------------------------
; -> DE: Sprite instance pointer at Iso X attribute
; -------------------------------------------------------------
StoreIsoPos:

      PUSH HL
      PUSH DE
      PUSH BC

; -------------------------------------------------------------
; Copy  sprite instance position

      EX DE,HL

      ; Skip to Minimap index
      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      LDI
      LDI
      LDI

; -------------------------------------------------------------

      POP BC
      POP DE
      POP HL

      RET ; Exit

; =============================================================
; Routine: Restore Iso position
; -------------------------------------------------------------
; -> DE: Sprite instance pointer at Iso X attribute
; -------------------------------------------------------------
RestoreIsoPos:

      PUSH HL
      PUSH DE
      PUSH BC
      PUSH AF

; -------------------------------------------------------------
; Copy  sprite instance position

      ; Skip to Minimap index
      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      LDI
      LDI
      LDI

; -------------------------------------------------------------

      POP AF
      POP BC
      POP DE
      POP HL

      RET ; Exit

; =============================================================
; Routine: Check Position Collision
; -------------------------------------------------------------
; -> DE: Sprite instance pointer at Iso X attribute
; -------------------------------------------------------------
CheckPosCollision:

      PUSH DE
      PUSH HL
      PUSH BC

; -------------------------------------------------------------
; Clear collieded sprite ID

      XOR A
      LD (CollidedSpriteID),A

; -------------------------------------------------------------
; Get minimap index to be checked

      LD DE,CheckIsoPosition

      ; Offset pointer back to reuse sprite instance based sub-routine
      M_OffsetPointer DE, ATTR_SpriteInstanceIsoPosX, ATTR_SpriteInstanceRoot

      CALL TransformSpriteInstance3DToMinimapIndex

; -------------------------------------------------------------

      ; Skip to Minimap index
      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceMinimapIndex

; -------------------------------------------------------------
; Check whether index is empty, if not there is a collision

      LD A,(DE) ; Minimap index

      LD BC,MinimapStackBottom

      LD H,0x00
      LD L,A

      ADD HL,HL ; Index is multiplied by 2 to convert to pointer
      ADD HL,BC

      LD A,(HL)
      INC HL
      OR (HL)

      CP 0x00
      JR Z,CheckPosCollisionFalse

; -------------------------------------------------------------
; There is a collision

      ; Store collided sprite ID
      LD D,(HL)
      DEC HL
      LD E,(HL)
      LD A,(DE)
      LD (CollidedSpriteID),A

      SCF ; Set Carry Flag

      JR CheckPosCollisionEnd

; -------------------------------------------------------------
; There is NOT a collision

CheckPosCollisionFalse:

      OR A ; Reset Carry Flag

; -------------------------------------------------------------

CheckPosCollisionEnd:

      POP BC
      POP HL
      POP DE

      RET ; Exit

; -------------------------------------------------------------
; Label: Iso dimension element size
;IsoDimElemSize EQU 0x04
IsoDimElemSize EQU 0x04

; -------------------------------------------------------------
; Memory Alloc: Dynamic Iso dimension element size
DynIsoDimElemSize: DW IsoDimElemSize

; =============================================================
; Routine: Check Square Collision
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
CheckSquareCollision:

      PUSH DE
      PUSH HL
      PUSH BC

; -------------------------------------------------------------
; Copy  sprite instance position

      LD HL,CheckIsoPosition
      CALL StoreIsoPos

; -------------------------------------------------------------

      CALL CheckSquareCollisionCore

; -------------------------------------------------------------

      POP BC
      POP HL
      POP DE

      RET

; =============================================================
; Routine: Check Square Collision Core
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
; =============================================================
; DOES NOT PRESERVE REGISTERS!!!
; =============================================================
CheckSquareCollisionCore:

; -------------------------------------------------------------
; Check position origin

      CALL CheckPosCollision
      JR C,CheckSquareCollisionEnd

; -------------------------------------------------------------
; Check position X offset

      LD HL,CheckIsoPosition

;      LD A,IsoDimElemSize
      LD A,(DynIsoDimElemSize)
      ADD A,(HL)

      CP MaxIsoX
      JR C,CheckSquareCollisionUpdateIsoX

      LD A,MaxIsoX

CheckSquareCollisionUpdateIsoX:

      LD (HL),A

      CALL CheckPosCollision
      JR C,CheckSquareCollisionEnd

; -------------------------------------------------------------
; Restore X

;      LD A,(HL)
;      SUB IsoDimElemSize
;      LD (HL),A

      LD A,(DynIsoDimElemSize)
      SUB (HL)
      XOR 0xFF
      LD (HL),A

; -------------------------------------------------------------
; Check position Z offset

      LD HL,CheckIsoPosition
      INC HL
      INC HL

;      LD A,IsoDimElemSize
      LD A,(DynIsoDimElemSize)
      ADD A,(HL)

      CP MaxIsoZ
      JR C,CheckSquareCollisionUpdateIsoZ

      LD A,MaxIsoZ

CheckSquareCollisionUpdateIsoZ:

      LD (HL),A

      CALL CheckPosCollision
      JR C,CheckSquareCollisionEnd

; -------------------------------------------------------------
; Check position XZ offset

      LD HL,CheckIsoPosition

;      LD A,IsoDimElemSize
      LD A,(DynIsoDimElemSize)
      ADD A,(HL)

      CP MaxIsoX
      JR C,CheckSquareCollisionUpdateIsoXZ

      LD A,MaxIsoX

CheckSquareCollisionUpdateIsoXZ:

      LD (HL),A

      CALL CheckPosCollision
      JR C,CheckSquareCollisionEnd

; -------------------------------------------------------------
; Check position collision false

      OR A ; Reset carry

; -------------------------------------------------------------

CheckSquareCollisionEnd:

      RET ; Exit

; =============================================================
; Routine: Check Cubic Collision
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
CheckCubicCollision:

      PUSH DE
      PUSH HL
      PUSH BC

; -------------------------------------------------------------
; Copy  sprite instance position

      LD HL,CheckIsoPosition
      CALL StoreIsoPos

; -------------------------------------------------------------

      INC HL

;      LD A,(HL)
;      SUB 0x08 ;IsoDimElemSize

      LD A,(DynIsoDimElemSize)
      SUB (HL)
      XOR 0xFF

      CP 0xF8
      JR C,CheckCubicCollisionUpdateIsoY

      XOR A

CheckCubicCollisionUpdateIsoY:

      LD (HL),A

; -------------------------------------------------------------

      CALL CheckSquareCollisionCore

; -------------------------------------------------------------

      POP BC
      POP HL
      POP DE

      RET

