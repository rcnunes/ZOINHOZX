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
; INCLUDE - RoutineSpriteInstanceUpdate
; =================================================================================

; =============================================================
; GLOBAL DEFINITIONS
; =============================================================

; =============================================================
; Labels: Sprite classes
; -------------------------------------------------------------

SpriteStaticClassID     EQU 0x40
SpriteBackgroundClassID EQU 0x70
SpriteDynamicClassID    EQU 0x80
SpriteCollectClassID    EQU CollectItemBaseID

; =============================================================
; Labels: Static Sprite table of IDs and templates
; -------------------------------------------------------------

SpriteTableStatic:

; -------------------------------------------------------------
StaticSpriteNonLethalID_LOW EQU (BuildingBlockID)
; -------------------------------------------------------------

BuildingBlockID EQU 0x40
DW GardenBuildingBlockSpriteTemplate

GatePilarID EQU 0x41
DW GatePilarSpriteTemplate

GreekPilarBaseID EQU 0x42
DW GreekPilarBaseSpriteTemplate

GreekPilarID EQU 0x43
DW GreekPilarSpriteTemplate

TrunkStumpID EQU 0x44
DW TrunkStumpSpriteTemplate

EggStaticXID EQU 0x45
DW EggXSpriteTemplate

; -------------------------------------------------------------
StaticSpriteNonLethalID_HIGH EQU (EggStaticXID+0x01)
; -------------------------------------------------------------

; -------------------------------------------------------------

; -------------------------------------------------------------
StaticSpriteLethalID_LOW EQU (BuildingBlockHellID)
; -------------------------------------------------------------

BuildingBlockHellID EQU 0x46
DW HellBuildingBlockSpriteTemplate

FleshEatingPlantStaticXID EQU 0x47
DW FleshEatingPlantSpriteTemplate

GreekPilarBaseHellID EQU 0x48
DW GreekPilarBaseHellSpriteTemplate

GreekPilarHellID EQU 0x49
DW GreekPilarHellSpriteTemplate

IronFenceXID EQU 0x4A
DW IronFenceXSpriteTemplate

IronFenceZID EQU 0x4B
DW IronFenceZSpriteTemplate

KillingSkullHellID EQU 0x4C
DW KillingD3v1lSkullSpriteTemplate

KillingSkullID EQU 0x4D
DW KillingSkullSpriteTemplate

PinballMushroomStaticID EQU 0x4E
DW PinballMushroomSpriteTemplate

PoisonMushroomID EQU 0x4F
DW PoisonMushroomSpriteTemplate

RoseID EQU 0x50
DW RoseSpriteTemplate

SpikesHellID EQU 0x51
DW HellSpikesSpriteTemplate

SpikesID EQU 0x52
DW SpikesSpriteTemplate

TombStoneXID EQU 0x53
DW TombStoneXSpriteTemplate

TombStoneZID EQU 0x54
DW TombStoneZSpriteTemplate

TreeMonsterZID EQU 0x55
DW ForestTreeMonsterSpriteTemplate

TreeMonsterXID EQU 0x56
DW ForestTreeMonsterSpriteTemplate

TreeMonsterX1ID EQU 0x57
DW TreeMonsterForrestX1SpriteTemplate

TreeMonsterX2ID EQU 0x58
DW TreeMonsterForrestX2SpriteTemplate

TreeMonsterZ1ID EQU 0x59
DW TreeMonsterForrestZ1SpriteTemplate

TreeMonsterZ2ID EQU 0x5A
DW TreeMonsterForrestZ2SpriteTemplate

WallTorchStaticXID EQU 0x5B
DW WallTorchSpriteTemplate

WallTorchStaticZID EQU 0x5C
DW WallTorchZSpriteTemplate

; -------------------------------------------------------------
StaticSpriteLethalID_HIGH EQU (WallTorchStaticZID+0x01)
; -------------------------------------------------------------

; =============================================================
; Labels: Background Sprite IDs
; -------------------------------------------------------------
BackgroundElementID     EQU 0x70

; =============================================================
; Labels: Dynamic Sprite table of IDs and templates
; -------------------------------------------------------------

SpriteTableDynamic:

; -------------------------------------------------------------
; Dynamic sprite Range 1 - 1:1 update routine defined by vector
; -------------------------------------------------------------
DynamicSpriteRange1ID_LOW EQU (ZoinhoID)
; -------------------------------------------------------------

ZoinhoID   EQU 0x80
DW ZoinhoSpriteTemplate

ThrownAxeID   EQU 0x81
DW AxeThrowSpriteTemplate

ThrownBookID   EQU 0x82
DW ThrownBookSpriteTemplate

PinballMushroomID   EQU 0x83
DW PinballMushroomSpriteTemplate

JackGoatID   EQU 0x84
DW JackGoatSpriteTemplate

; -------------------------------------------------------------
DynamicSpriteLethalID_LOW EQU (PoisonDartXID)
; -------------------------------------------------------------

PoisonDartXID   EQU 0x85
DW PoisonDartXSpriteTemplate

PoisonDartZID   EQU 0x86
DW PoisonDartZSpriteTemplate

PoisonDartZHellID   EQU 0x87
DW TreeMonsterPoisonDartSpriteTemplate

RotatingSawXID   EQU 0x88
DW RotatingSawXSpriteTemplate

RotatingSawZID   EQU 0x89
DW RotatingSawZSpriteTemplate

ShootingFountainXID   EQU 0x8A
DW ShootingFountainXSpriteTemplate

ShootingFountainZID   EQU 0x8B
DW ShootingFountainZSpriteTemplate

TreeMonsterDeadID   EQU 0x8C
DW TreeMonsterDeadSpriteTemplate

D3v1lID   EQU 0x8D
DW D3v1lSpriteTemplate

D3v1lKillID   EQU 0x8E
DW D3v1lKillSpriteTemplate

; -------------------------------------------------------------
DynamicSpriteRange1ID_HIGH EQU (D3v1lKillID+0x01)
; -------------------------------------------------------------

; -------------------------------------------------------------
; Dynamic sprite Range 2 - n:1 update routine GenericEnemyUpdate
; -------------------------------------------------------------
DynamicSpriteRange2ID_LOW EQU (AngryBeeID)
; -------------------------------------------------------------

AngryBeeID   EQU 0x8F
DW AngryBeeSpriteTemplate

InvisibleManID   EQU 0x90
DW InvisibleManSpriteTemplate

ScorpionID   EQU 0x91
DW ScorpionSpriteTemplate

SharkID   EQU 0x92
DW SharkSpriteTemplate

SnakeID   EQU 0x93
DW ForestSnakeSpriteTemplate

SnakeHellID   EQU 0x94
DW SnakeHellSpriteTemplate

SpeedySnailID   EQU 0x95
DW SpeedySnailSpriteTemplate

; -------------------------------------------------------------
DynamicSpriteRange2ID_HIGH EQU (SpeedySnailID+0x01)
; -------------------------------------------------------------

; -------------------------------------------------------------
; Dynamic sprite Range 3 - n:1 update routine FourFramesBackAndForthUpdate
; -------------------------------------------------------------
DynamicSpriteRange3ID_LOW EQU (FleshEatingPlantXID)
; -------------------------------------------------------------

FleshEatingPlantXID   EQU 0x96
DW FleshEatingPlantDynSpriteTemplate

FleshEatingPlantZID   EQU 0x97
DW FleshEatingPlantDynZSpriteTemplate

SkeletonArmXID   EQU 0x98
DW SkeletonArmXSpriteTemplate

SkeletonArmZID   EQU 0x99
DW SkeletonArmZSpriteTemplate

SkeletonArmXHellID   EQU 0x9A
DW HellSkeletonArmXSpriteTemplate

SkeletonArmZHellID   EQU 0x9B
DW HellSkeletonArmZSpriteTemplate

WormXID   EQU 0x9C
DW WormXSpriteTemplate

WormZID   EQU 0x9D
DW WormZSpriteTemplate

; -------------------------------------------------------------
DynamicSpriteRange3ID_HIGH EQU (WormZID+0x01)
; -------------------------------------------------------------

; -------------------------------------------------------------
; Dynamic sprite Range 4 - n:1 update routine TreeMonsterUpdate
; -------------------------------------------------------------
DynamicSpriteRange4ID_LOW EQU (TreeMonsterID_0)
; -------------------------------------------------------------

; -------------------------------------------------------------
TreeMonsterID_LOW EQU (TreeMonsterID_0)
; -------------------------------------------------------------

TreeMonsterID_0   EQU 0x9E
DW TreeMonsterSpriteTemplate

TreeMonsterID_1   EQU 0x9F
DW TreeMonsterSpriteTemplate

TreeMonsterID_2   EQU 0xA0
DW TreeMonsterSpriteTemplate

TreeMonsterID_3   EQU 0xA1
DW TreeMonsterSpriteTemplate

TreeMonsterID_4   EQU 0xA2
DW TreeMonsterSpriteTemplate

; -------------------------------------------------------------
TreeMonsterID_HIGH EQU (TreeMonsterID_4+1)
; -------------------------------------------------------------

; -------------------------------------------------------------
DynamicSpriteRange4ID_HIGH EQU (TreeMonsterID_HIGH)
; -------------------------------------------------------------

; -------------------------------------------------------------
DynamicSpriteLethalID_HIGH EQU (TreeMonsterID_HIGH)
; -------------------------------------------------------------

WallTorchXID   EQU 0xA3
DW WallTorchSpriteTemplate

WallTorchZID   EQU 0xA4
DW WallTorchZSpriteTemplate

WoodenGateXID   EQU 0xA5
DW WoodenGateSpriteTemplate

WoodenGateZID   EQU 0xA6
DW WoodenGateZSpriteTemplate

ZoinhoDeadID   EQU 0xA7
DW ZoinhoDeadSpriteTemplate

; -------------------------------------------------------------
EggXID_LOW EQU (EggXID_0)
; -------------------------------------------------------------

EggXID_0   EQU 0xA8
DW EggXSpriteTemplate

EggXID_1   EQU 0xA9
DW EggXSpriteTemplate

EggXID_2   EQU 0xAA
DW EggXSpriteTemplate

EggXID_3   EQU 0xAB
DW EggXSpriteTemplate

; -------------------------------------------------------------
EggXID_HIGH EQU (EggXID_3+1)
; -------------------------------------------------------------

EggScorpionXID   EQU 0xAC
DW EggXSpriteTemplate

ScorpionPlaceholderID   EQU 0xAD
DW ScorpionSpriteTemplate

BuildingBlockCrackedID   EQU 0xAE
DW GardenBuildingBlockSpriteTemplate


; =============================================================
; Labels: Collect Sprite IDs (Mostly static with some dynamic attributes)
; -------------------------------------------------------------
CollectItemBaseID   EQU 0xC0
; -------------------------------------------------------------

; =============================================================
; Labels: Collect Sprite table of IDs and templates
; -------------------------------------------------------------

SpriteTableCollectAxe:

; -------------------------------------------------------------
AxeID_LOW EQU (AxeID_0)
; -------------------------------------------------------------

AxeID_0   EQU 0xE0
DW AxeSpriteTemplate

AxeID_1   EQU 0xE1
DW AxeSpriteTemplate

AxeID_2   EQU 0xE2
DW AxeSpriteTemplate

AxeID_3   EQU 0xE3
DW AxeSpriteTemplate

AxeID_4   EQU 0xE4
DW AxeSpriteTemplate

AxeID_5   EQU 0xE5
DW AxeSpriteTemplate

AxeID_6   EQU 0xE6
DW AxeSpriteTemplate

AxeID_7   EQU 0xE7
DW AxeSpriteTemplate

; -------------------------------------------------------------
AxeID_HIGH EQU (AxeID_7+1)
; -------------------------------------------------------------

; -------------------------------------------------------------

SpriteTableCollectBook:

; -------------------------------------------------------------
BookID_LOW EQU (BookID_0)
; -------------------------------------------------------------

BookID_0   EQU 0xC0
DW BookSpriteTemplate

BookID_1   EQU 0xC1
DW BookSpriteTemplate

BookID_2   EQU 0xC2
DW BookSpriteTemplate

BookID_3   EQU 0xC3
DW BookSpriteTemplate

BookID_4   EQU 0xC4
DW BookSpriteTemplate

BookID_5   EQU 0xC5
DW BookSpriteTemplate

BookID_6   EQU 0xC6
DW BookSpriteTemplate

BookID_7   EQU 0xC7
DW BookSpriteTemplate

; -------------------------------------------------------------
BookID_HIGH EQU (BookID_7+1)
; -------------------------------------------------------------

; -------------------------------------------------------------

SpriteTableCollectSkull:

; -------------------------------------------------------------
SkullID_LOW EQU (SkullID_0)
; -------------------------------------------------------------

SkullID_0   EQU 0xD0
DW SkullSpriteTemplate

SkullID_1   EQU 0xD1
DW SkullSpriteTemplate

SkullID_2   EQU 0xD2
DW SkullSpriteTemplate

SkullID_3   EQU 0xD3
DW SkullSpriteTemplate

SkullID_4   EQU 0xD4
DW SkullSpriteTemplate

SkullID_5   EQU 0xD5
DW SkullSpriteTemplate

SkullID_6   EQU 0xD6
DW SkullSpriteTemplate

SkullID_7   EQU 0xD7
DW SkullSpriteTemplate

; -------------------------------------------------------------
SkullID_HIGH EQU (SkullID_7+1)
; -------------------------------------------------------------

; =============================================================
; Mem Alloc: Book ID, Book text mapping
; -------------------------------------------------------------
BookTextMappingArray:
DW StrBookTextID_0
DW StrBookTextID_1
DW StrBookTextID_2
DW StrBookTextID_3
DW StrBookTextID_4
DW StrBookTextID_5
DW StrBookTextID_6
DW StrBookTextID_7

; =============================================================
; Routine: Get sprite template from ID
; -------------------------------------------------------------
; ->  A: Sprite ID
; -------------------------------------------------------------
SpriteTemplateGet:

      PUSH HL
      PUSH AF

; -------------------------------------------------------------

; -------------------------------------------------------------

      CP SpriteStaticClassID
      JR C,SpriteTemplateGetStaticSkip

      CP SpriteBackgroundClassID
      JR NC,SpriteTemplateGetStaticSkip

      SUB SpriteStaticClassID

      LD H,0x00
      LD L,A

      ADD HL,HL

      LD DE,SpriteTableStatic

      ADD HL,DE

      LD E,(HL) ; Get Sprite Template
      INC HL
      LD D,(HL)

      JR SpriteTemplateGetEnd

SpriteTemplateGetStaticSkip:

; -------------------------------------------------------------

      CP SpriteDynamicClassID
      JR C,SpriteTemplateGetDynamicSkip

      CP SpriteCollectClassID
      JR NC,SpriteTemplateGetDynamicSkip

      SUB SpriteDynamicClassID

      LD H,0x00
      LD L,A

      ADD HL,HL

      LD DE,SpriteTableDynamic

      ADD HL,DE

      LD E,(HL) ; Get Sprite Template
      INC HL
      LD D,(HL)

      JR SpriteTemplateGetEnd

SpriteTemplateGetDynamicSkip:

; -------------------------------------------------------------

      CP AxeID_LOW
      JR C,SpriteTemplateGetCollectAxeSkip

      CP AxeID_HIGH
      JR NC,SpriteTemplateGetCollectAxeSkip

      SUB AxeID_0

      LD H,0x00
      LD L,A

      ADD HL,HL

      LD DE,SpriteTableCollectAxe

      ADD HL,DE

      LD E,(HL) ; Get Sprite Template
      INC HL
      LD D,(HL)

      JR SpriteTemplateGetEnd

SpriteTemplateGetCollectAxeSkip:

; -------------------------------------------------------------

      CP BookID_LOW
      JR C,SpriteTemplateGetCollectBookSkip

      CP BookID_HIGH
      JR NC,SpriteTemplateGetCollectBookSkip

      SUB BookID_0

      LD H,0x00
      LD L,A

      ADD HL,HL

      LD DE,SpriteTableCollectBook

      ADD HL,DE

      LD E,(HL) ; Get Sprite Template
      INC HL
      LD D,(HL)

      JR SpriteTemplateGetEnd

SpriteTemplateGetCollectBookSkip:

; -------------------------------------------------------------

      CP SkullID_LOW
      JR C,SpriteTemplateGetCollectSkullSkip

      CP SkullID_HIGH
      JR NC,SpriteTemplateGetCollectSkullSkip

      SUB SkullID_0

      LD H,0x00
      LD L,A

      ADD HL,HL

      LD DE,SpriteTableCollectSkull

      ADD HL,DE

      LD E,(HL) ; Get Sprite Template
      INC HL
      LD D,(HL)

      JR SpriteTemplateGetEnd

SpriteTemplateGetCollectSkullSkip:

; -------------------------------------------------------------
SpriteTemplateGetEnd:

      POP AF
      POP HL

      RET

; =============================================================
; Memory Alloc: Range 1 sprites - update routines call vector
; -------------------------------------------------------------

DynamicSpriteRange1CallVector:

DW ZoinhoUpdate
DW ThrownAxeUpdate
DW ThrownBookUpdate
DW PinballMushroomUpdate
DW GenericEnemyUpdate
DW PoisonDartXUpdate
DW PoisonDartZUpdate
DW PoisonDartZUpdate
DW RotatingSawXUpdate
DW RotatingSawZUpdate
DW ShootingFountainXUpdate
DW ShootingFountainZUpdate
DW TreeMonsterDeadUpdate
DW D3v1lUpdate
DW D3v1lKillUpdate

; =============================================================
; Routine: Update routine selector
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
DynamicSpriteUpdate:

      DI

; -------------------------------------------------------------

      PUSH BC
      PUSH HL

; -------------------------------------------------------------

      LD A,(DE) ; Get sprite instance ID

; -------------------------------------------------------------
; Check for dynamic sprites within Range 1 (call vector based)

      CP DynamicSpriteRange1ID_LOW
      JR C,DynamicSpriteUpdateRange1Skip

      CP DynamicSpriteRange1ID_HIGH
      JR NC,DynamicSpriteUpdateRange1Skip

      SUB DynamicSpriteRange1ID_LOW

      LD H,0x00
      LD L,A

      LD BC,DynamicSpriteRange1CallVector

      ADD HL,HL
      ADD HL,BC

      LD C,(HL)
      INC HL
      LD B,(HL)

      PUSH BC
      POP HL

      ; Push the calling return address
      ; to be used by the called routine RET
      LD BC,DynamicSpriteUpdateEnd
      PUSH BC

      ; Call the corresponding update routine (without CALL)
      JP (HL)

DynamicSpriteUpdateRange1Skip:

; -------------------------------------------------------------
; Check for dynamic sprites within Range 2 (call GenericEnemyUpdate)

      CP DynamicSpriteRange2ID_LOW
      JR C,DynamicSpriteUpdateRange2Skip

      CP DynamicSpriteRange2ID_HIGH
      JR NC,DynamicSpriteUpdateRange2Skip

      CALL GenericEnemyUpdate

      JR DynamicSpriteUpdateEnd

DynamicSpriteUpdateRange2Skip:

; -------------------------------------------------------------
; Check for dynamic sprites within Range 3 (call FourFramesBackAndForthUpdate)

      CP DynamicSpriteRange3ID_LOW
      JR C,DynamicSpriteUpdateRange3Skip

      CP DynamicSpriteRange3ID_HIGH
      JR NC,DynamicSpriteUpdateRange3Skip

      CALL FourFramesBackAndForthUpdate

      JR DynamicSpriteUpdateEnd

DynamicSpriteUpdateRange3Skip:

; -------------------------------------------------------------
; Check for dynamic sprites within Range 4 (call TreeMonsterUpdate)

      CP DynamicSpriteRange4ID_LOW
      JR C,DynamicSpriteUpdateRange4Skip

      CP DynamicSpriteRange4ID_HIGH
      JR NC,DynamicSpriteUpdateRange4Skip

      CALL TreeMonsterUpdate

      JR DynamicSpriteUpdateEnd

DynamicSpriteUpdateRange4Skip:

; -------------------------------------------------------------

DynamicSpriteUpdateEnd:

; -------------------------------------------------------------

      POP HL
      POP BC

; -------------------------------------------------------------

      EI

      RET

; =============================================================
; Labels: Zoinho animation parameters
; -------------------------------------------------------------
ZoinhoNrOfFrames EQU 0x03
ZoinhoStepInc    EQU 0x03

; =============================================================
; Memory Alloc: Zoinho jump state flag
; -------------------------------------------------------------
ZoinhoJumpState: DB 0x00

; =============================================================
; Labels: Zoinho jump state
; -------------------------------------------------------------
ZoinhoJumpInitTrue  EQU 0x00
ZoinhoJumpInitFalse EQU 0xFF

; =============================================================
; Memory Alloc: Zoinho dimensions
; -------------------------------------------------------------
DimensionsZoinho: DB 0x18, 0x28, 0x18
DimensionsObstacle:  DB 0x20, 0x20, 0x20

; =============================================================
; Routine: Update Zoinho sprite instance
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
ZoinhoUpdate:

      PUSH BC

; -------------------------------------------------------------
; Update sprite previous posisition attribute

      CALL UpdateSpritePrevPos

; -------------------------------------------------------------
; Check for an update in direction

      CALL UpdateSpriteDirFromInput

      ; Check whether there is an user input
      JR NC,ZoinhoUpdateJumpCheck

; -------------------------------------------------------------

      LD A,(TreeMonsterDeathAnimationCounter)
      CP 0x00
      JR NZ,ZoinhoUpdateBeeperSkip

      LD HL,StepsBeeperTemplate
      CALL PlayBeeperInterleaved

ZoinhoUpdateBeeperSkip:

; -------------------------------------------------------------
; Update step counter

      LD A,ZoinhoNrOfFrames ; Set max stepnumber
      LD (SpriteNoOfMaxStep),A

      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------
; Update ISO coordinate

      ; Store current position in case of rollback
      LD HL,PositionObjectStore
      CALL StorePosition

      ; Update sprite position by given step increment
      LD A,ZoinhoStepInc ; step increment
      CALL UpdateSpriteCurrPos
      CALL TransformSpriteInstance3DToMinimapIndex

      ; Check sprite collision
      LD HL,DimensionsZoinho
      LD BC,DimensionsObstacle
      CALL CollisionCheck

      ; Rollback position in case of collision
      JR NC,ZoinhoUpdateJumpCheck

      CALL RestorePositionObject
      CALL ZoinhoCheckCollision

      CALL PinballActionCollisionCheck

; -------------------------------------------------------------
; Check for an update in jump

ZoinhoUpdateJumpCheck:

      CALL UpdateSpriteJumpFromInput

      ; Check whether there is an user input
      JR NC,ZoinhoUpdateNoJump
      
      LD A,(ZoinhoSinkingCounter)
      CP 0x00
      JR NZ,ZoinhoUpdateNoJump

      ; Store current position in case of rollback
      LD HL,PositionObjectStore
      CALL StorePosition

      ; Update position during jump
      CALL UpdateSpriteCurrPosJump
      CALL TransformSpriteInstance3DToMinimapIndex

      ; Check sprite collision
      LD HL,DimensionsZoinho
      LD BC,DimensionsObstacle
      CALL CollisionCheck

      JR NC,ZoinhoUpdateNoCollisionYet

      ; Rollback position in case of collision
      CALL RestorePositionObject
      CALL ZoinhoCheckCollision

      JR ZoinhoUpdateEnd

ZoinhoUpdateNoCollisionYet:

      LD A,(ZoinhoJumpState)
      CP ZoinhoJumpInitTrue
      JR NZ,ZoinhoUpdateNoSound

      LD HL,JumpBeeperTemplate
      CALL PlayBeeper

      LD A,ZoinhoJumpInitFalse
      LD (ZoinhoJumpState),A

ZoinhoUpdateNoSound:

ZoinhoUpdateNoJump:

; -------------------------------------------------------------
; Update the effect of gravity

      ; Store current position in case of rollback
      LD HL,PositionObjectStore
      CALL StorePosition

      CALL UpdateSpriteGravity
      CALL TransformSpriteInstance3DToMinimapIndex

      ; Check sprite collision
      LD HL,DimensionsZoinho
      LD BC,DimensionsObstacle
      CALL CollisionCheck

      JR NC,ZoinhoUpdateNoLandingYet

      ; Rollback position in case of collision
      CALL RestorePositionObject
      CALL ZoinhoCheckCollision

      XOR A
      LD (SpriteJumpCounter),A

      LD A,ZoinhoJumpInitTrue
      LD (ZoinhoJumpState),A

      CALL LandingCheckEgg
      CALL LandingCheckEggScorpion
      CALL LandingCheckBuildingBlockCracked
      CALL LandingCheckPinballMushroom
      CALL LandingCheckJackGoat

ZoinhoUpdateNoLandingYet:

ZoinhoUpdateEnd:

; -------------------------------------------------------------
; Update Iso display attributes

      ; Transform 3D coordinates to 2D coordinates
      ; Transform 3D coordinates to Minimap index
      CALL TransformSpriteInstanceSpacesCoords

; -------------------------------------------------------------

      POP BC

      RET ; Exit

; =============================================================
; Memory Alloc: No. of max steps
; -------------------------------------------------------------
SpriteNoOfMaxStep: DB 0x00

SpriteStepCountDir: DB 0x00

SpriteStepCountUp   EQU 0x00
SpriteStepCountDown EQU 0xFF

; =============================================================
; Routine: Update sprite instance step
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
SpriteInstanceStepUpdate:

      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      ; Skip to step counter
      EX DE,HL
      LD BC,0x0001*ATTR_SpriteInstanceStepCounter
      ADD HL,BC

; -------------------------------------------------------------

      INC (HL)

; -------------------------------------------------------------

      ; Check step counter
      LD A,(SpriteNoOfMaxStep)
      CP (HL)
      JR NZ,SpriteInstanceStepUpdateEnd

; -------------------------------------------------------------

      ; Reset step counter
      XOR A
      LD (HL),A

; -------------------------------------------------------------

SpriteInstanceStepUpdateEnd:

      POP BC
      POP DE

      RET ; Exit

; =============================================================
; Routine: Update generic enemy sprite
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
GenericEnemyUpdate:

      PUSH DE

; -------------------------------------------------------------
; Update previous coordinates

      CALL UpdateSpritePrevPos

; -------------------------------------------------------------
; Get direction to take

      CALL ChooseDirectionDecision

; -------------------------------------------------------------
; Update ISO coordinate

      LD HL,TempIsoPosition
      CALL StoreIsoPos

      LD A,0x06 ; step increment
      CALL UpdateSpriteCurrPos

      CALL CheckSquareCollision
      JR NC,GenericEnemyUpdateStep

; -------------------------------------------------------------
; Collision detected

      LD A,(CollidedSpriteID)
      CP ZoinhoID
      JR NZ,GenericEnemyUpdateObstacleHit

      ;CALL ZoinhoDies
      CALL ZoinhoCheckCollision

GenericEnemyUpdateObstacleHit:

      CALL RestoreIsoPos

      JR GenericEnemyUpdateStepSkip

; -------------------------------------------------------------
; Update step counter

GenericEnemyUpdateStep:

      LD A,0x02 ; Set max stepnumber to 2
      LD (SpriteNoOfMaxStep),A

      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------
; Update Iso display attributes

      ; Transform 3D coordinates to 2D coordinates
      ; Transform 3D coordinates to Minimap index
      CALL TransformSpriteInstanceSpacesCoords

GenericEnemyUpdateStepSkip:

; -------------------------------------------------------------

      POP DE

      RET ; Exit

; =============================================================
; Memory Alloc: AI Direction Decision Control
; -------------------------------------------------------------
ChooseDirectionStepCounter: DB 0x00
ChooseDirectionCurrent:     DB 0x00

; =============================================================
; Routine: AI Direction Decision
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
ChooseDirectionDecision:

      PUSH DE
      PUSH BC
      PUSH HL
      PUSH AF

; -------------------------------------------------------------

      LD HL,ChooseDirectionStepCounter

      LD A,(HL)
      CP 0x00
      JR NZ,ChooseDirectionDecisionKeepCurrent

; -------------------------------------------------------------

      ; Get a random number
      LD A,(SpeccyScreenFrameCounterAddress)
      LD C,A
      LD A,R
      ADD A,C

      AND 0x03
      LD (ChooseDirectionCurrent),A

      LD A,0x0A
      LD (HL),A

; -------------------------------------------------------------

ChooseDirectionDecisionKeepCurrent:

      DEC (HL)
      LD A,(ChooseDirectionCurrent)

      LD HL,DW_ATTR_SpriteInstanceDirCounter
      ADD HL,DE

      LD (HL),A

; -------------------------------------------------------------

      POP AF
      POP HL
      POP BC
      POP DE

      RET ; Exit

; =============================================================
; Routine: Update sprite current position
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; ->  A: step increment
; -------------------------------------------------------------
UpdateSpriteCurrPos:

      PUSH HL
      PUSH DE
      PUSH BC

; -------------------------------------------------------------
; Preserve step increment

      LD C,A

; -------------------------------------------------------------
; Offset pointer to ISO X coordinate

      LD HL,DW_ATTR_SpriteInstanceIsoPosX
      ADD HL,DE

; -------------------------------------------------------------
; Get sprite direction

      PUSH HL

      LD HL,DW_ATTR_SpriteInstanceDirCounter
      ADD HL,DE

      PUSH HL
      POP DE
      
      POP HL

      LD A,(DE)
; -------------------------------------------------------------

      AND 0x03 ; Mask off jump dir counter

; -------------------------------------------------------------
; Check Front ISO X

      CP SpriteFrontIsoX
      JR NZ,UpdateSpriteCurrPosCheckSpriteBackIsoX

      LD A,(HL)
      ADD A,C

      CP MaxIsoX
      JR C,UpdateSpriteCurrPosEndFalse

      LD A,MaxIsoX

      JR UpdateSpriteCurrPosEndTrue

; -------------------------------------------------------------
; Check Back ISO X

UpdateSpriteCurrPosCheckSpriteBackIsoX:

      CP SpriteBackIsoX
      JR NZ,UpdateSpriteCurrPosCheckSpriteFrontIsoZ

      LD A,(HL)
      SUB C

      CP MaxIsoX
      JR C,UpdateSpriteCurrPosEndFalse

      XOR A

      JR UpdateSpriteCurrPosEndTrue

; -------------------------------------------------------------
; Check Front ISO Z

UpdateSpriteCurrPosCheckSpriteFrontIsoZ:

      CP SpriteFrontIsoZ
      JR NZ,UpdateSpriteCurrPosCheckSpriteBackIsoZ

      INC HL
      INC HL

      LD A,(HL)
      ADD A,C

      CP MaxIsoZ
      JR C,UpdateSpriteCurrPosEndFalse

      LD A,MaxIsoZ

      JR UpdateSpriteCurrPosEndTrue

; -------------------------------------------------------------
; Check Back ISO Z

UpdateSpriteCurrPosCheckSpriteBackIsoZ:

      CP SpriteBackIsoZ
      JR NZ,UpdateSpriteCurrPosEndFalse

      INC HL
      INC HL

      LD A,(HL)
      SUB C

      CP MaxIsoZ  ; Previously deactivated
      JR C,UpdateSpriteCurrPosEndFalse  ; Previously deactivated

      XOR A

; -------------------------------------------------------------

UpdateSpriteCurrPosEndTrue:

      LD (HL),A

; -------------------------------------------------------------

UpdateSpriteCurrPosLimit:

      SCF ; Set carry flag when limit end is reached

      JR UpdateSpriteCurrPosEnd

; -------------------------------------------------------------

UpdateSpriteCurrPosEndFalse:

      LD (HL),A

; -------------------------------------------------------------

UpdateSpriteCurrPosNoLimit:

      XOR A ; Reset carry flag when limit end is not reached

; -------------------------------------------------------------
; Check ending

UpdateSpriteCurrPosEnd:

      POP BC
      POP DE
      POP HL

      RET ; Exit

; =============================================================
; Routine: Update sprite direction from input
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
UpdateSpriteDirFromInput:

      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      PUSH DE
      POP HL

      LD BC,0x0001 * ATTR_SpriteInstanceDirCounter
      ADD HL,BC

; -------------------------------------------------------------

      LD C,A

; -------------------------------------------------------------

      LD A,(GameplayControlStates)
      LD B,A

      AND Button_Left
      JR NZ,UpdateSpriteDirFromInputCheckButtonDown

      LD A,SpriteBackIsoX
      JR UpdateSpriteDirFromInputDone

; -------------------------------------------------------------

UpdateSpriteDirFromInputCheckButtonDown:

      LD A,B
      AND Button_Down
      JR NZ,UpdateSpriteDirFromInputCheckButtonUp

      LD A,SpriteFrontIsoZ
      JR UpdateSpriteDirFromInputDone

; -------------------------------------------------------------

UpdateSpriteDirFromInputCheckButtonUp:

      LD A,B
      AND Button_Up
      JR NZ,UpdateSpriteDirFromInputCheckButtonRight

      LD A,SpriteBackIsoZ
      JR UpdateSpriteDirFromInputDone

; -------------------------------------------------------------

UpdateSpriteDirFromInputCheckButtonRight:

      LD A,B
      AND Button_Right
      JR NZ,UpdateSpriteDirFromInputNoAction

      LD A,SpriteFrontIsoX
      JR UpdateSpriteDirFromInputDone

; -------------------------------------------------------------

UpdateSpriteDirFromInputNoAction:

      XOR A
      JR UpdateSpriteDirFromInputEnd

; -------------------------------------------------------------

UpdateSpriteDirFromInputDone:

      LD (HL),A

; -------------------------------------------------------------

UpdateSpriteDirFromInputAction:

      SCF

; -------------------------------------------------------------

UpdateSpriteDirFromInputEnd:

      LD A,C

      POP BC
      POP HL

      RET ; Exit

; =============================================================
; Routine: Update sprite jump from input
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
UpdateSpriteJumpFromInput:

      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      PUSH DE
      POP HL

      LD BC,0x0001 * ATTR_SpriteInstanceDirCounter
      ADD HL,BC

; -------------------------------------------------------------

      LD C,A

; -------------------------------------------------------------

      LD A,(GameplayControlStates)

; -------------------------------------------------------------

      AND Button_Jump
      JR NZ,UpdateSpriteJumpFromInputNoAction

      LD A,SpriteUpIsoY
      JR UpdateSpriteJumpFromInputDone

; -------------------------------------------------------------

UpdateSpriteJumpFromInputNoAction:

      XOR A
      JR UpdateSpriteJumpFromInputEnd

; -------------------------------------------------------------

UpdateSpriteJumpFromInputDone:

      OR (HL)
      LD (HL),A

; -------------------------------------------------------------

UpdateSpriteJumpFromInputAction:

      SCF

; -------------------------------------------------------------

UpdateSpriteJumpFromInputEnd:

      LD A,C

      POP BC
      POP HL

      RET ; Exit

; =============================================================
; Label: Skeleton arm max step
; -------------------------------------------------------------
SkeletonArmMaxStep EQU 0x04
SkeletonAnimMid    EQU 0x03
SkeletonAnimMax    EQU 0x07

; =============================================================
; Routine: Update four frames sprite with back and forth
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
FourFramesBackAndForthUpdate:

      PUSH DE
      PUSH BC

; -------------------------------------------------------------
; Get animation counter

      PUSH DE
      POP HL
      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceAnimCounter

; -------------------------------------------------------------
; Check whether animation counter is through
; If it is, then check random trigger.

      LD A,(HL)
      CP SkeletonAnimMax
      JR NC,FourFramesBackAndForthUpdateRandomTrigger

; -------------------------------------------------------------
; Halfway animation cycle, skeleton arm rises from grave

      CP SkeletonAnimMid
      JR NC,FourFramesBackAndForthUpdateAnim2ndHalf

      ; Increment animation counter
      INC (HL)

      ; Increment step counter
      M_OffsetPointer HL, ATTR_SpriteInstanceAnimCounter, ATTR_SpriteInstanceStepCounter

      LD A,(HL)
      INC A
      AND 0x03 ; Make sure it does not exceed step 03
      LD (HL),A

      JR FourFramesBackAndForthUpdateEnd

; -------------------------------------------------------------
; Ending animation cycle, skeleton arm retreats back to grave

FourFramesBackAndForthUpdateAnim2ndHalf:

      ; Increment animation counter
      INC (HL)

      ; Decrement step counter
      M_OffsetPointer HL, ATTR_SpriteInstanceAnimCounter, ATTR_SpriteInstanceStepCounter

      LD A,(HL)
      DEC A
      LD (HL),A

      CP SkeletonArmMaxStep
      JR C,FourFramesBackAndForthUpdateEnd

       ; Make sure it does not fall below step 00
      XOR A
      LD (HL),A

      JR FourFramesBackAndForthUpdateEnd

; -------------------------------------------------------------
; Evaluate random trigger for animation cycle

FourFramesBackAndForthUpdateRandomTrigger:

      ; Hide SkeletonArm sprite
      CALL SpriteInstanceDisplayFlagSetFalse

      ; Get random number (0 - 7)
      LD A,R
      AND 0x07
      CP 0x04 ; Random trigger value
      JR NZ,FourFramesBackAndForthUpdateEnd

; -------------------------------------------------------------
; Enable new animation cycle

      ; Initialize animation counter
      XOR A
      LD (HL),A

      ; Initialize step counter
      M_OffsetPointer HL, ATTR_SpriteInstanceAnimCounter, ATTR_SpriteInstanceStepCounter

      XOR A
      LD (HL),A

      ; Display SkeletonArm sprite
      CALL SpriteInstanceDisplayFlagSetTrue

; -------------------------------------------------------------

FourFramesBackAndForthUpdateEnd:

      POP BC
      POP DE

      RET

; =============================================================
; Label: Shooting Fountain max step
; -------------------------------------------------------------
ShootingFountainMaxStep EQU 0x02

; =============================================================
; Routine: Update Shooting Fountain sprite (X axis oriented)
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
ShootingFountainXUpdate:

; -------------------------------------------------------------
; Check whether PoisonDartZ sprite is flying

      CALL PoisonDartXIsVisible
      CALL NC,ShootingFountainUpdate

      RET

; =============================================================
; Routine: Update Shooting Fountain sprite (Z axis oriented)
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
ShootingFountainZUpdate:

; -------------------------------------------------------------
; Check whether PoisonDartZ sprite is flying

      CALL PoisonDartZIsVisible
      CALL NC,ShootingFountainUpdate

      RET

; =============================================================
; Memory Alloc: Immunity wait counter
; -------------------------------------------------------------
ImmunityWait: DB 0x40

; =============================================================
; Routine: Update Shooting Fountain sprite
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
ShootingFountainUpdate:

	  LD HL,ImmunityWait
	  LD A,(HL)
	  CP 0x00
	  JR Z,ShootingFountainUpdateWaitSkip
	  DEC (HL)
	  RET NZ
	  ShootingFountainUpdateWaitSkip:

      PUSH DE
      PUSH BC

; -------------------------------------------------------------
; Check whether or not step counter has cycled through the end

      ; Get current step counter
      PUSH DE
      POP HL
      LD BC,0x0001 * ATTR_SpriteInstanceStepCounter
      ADD HL,BC

      ; Read step counter
      LD A,(HL)
      CP 0x00
      JR Z,ShootingFountainUpdateCycle

; -------------------------------------------------------------
; If animation step counter has already cycled through end,
; then check random trigger for new cycle

      JR ShootingFountainUpdateRandomTrigger

; -------------------------------------------------------------
; Cycle through end step in animation

ShootingFountainUpdateCycle:

      LD A,ShootingFountainMaxStep
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------
; Cycle has begun, then display PoisonDart

      ; Get sprite instance partner pointer
      EX DE,HL
      M_LongOffsetPointerHL ATTR_SpriteInstanceOffset, ATTR_SpriteInstanceRoot
      EX DE,HL

      ; Set sprite instance partner pointer display flag true
      CALL SpriteInstanceDisplayFlagSetTrue

      JR ShootingFountainUpdateEnd

; -------------------------------------------------------------
; Evaluate random trigger for new animation cycle

ShootingFountainUpdateRandomTrigger:

      ; Get random number (0 - F)
      LD A,R
      AND 0x07
      CP 0x04 ; Random trigger value
      JR NZ,ShootingFountainUpdateEnd

; -------------------------------------------------------------
; Enable new animation cycle

      ; Set step counter to zero
      XOR A
      LD (HL),A

; -------------------------------------------------------------

ShootingFountainUpdateEnd:

      POP BC
      POP DE

      RET

; =============================================================
; Routine: Check whether dart (X axis) is visible
; -------------------------------------------------------------
PoisonDartXIsVisible:

      LD A,PoisonDartXID

      CALL PoisonDartIsVisible

      RET

; =============================================================
; Routine: Check whether dart (Z axis) is visible
; -------------------------------------------------------------
PoisonDartZIsVisible:

      LD A,PoisonDartZID

      CALL PoisonDartIsVisible

      RET

; =============================================================
; Routine: Check whether dart is visible
; -------------------------------------------------------------
PoisonDartIsVisible:

      PUSH DE

; -------------------------------------------------------------
; Look for sprite by ID

      CALL DynamicSpriteSearchByID
      JR NC,PoisonDartIsVisibleFalse

; -------------------------------------------------------------
; Check whether or not PoisonDartZ sprite is visible

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag

      LD A,(DE)
      CP SpriteInstanceDisplayFlagTrue
      JR C,PoisonDartIsVisibleFalse

; -------------------------------------------------------------

      SCF ; Check is true

      JR PoisonDartIsVisibleEnd

; -------------------------------------------------------------

PoisonDartIsVisibleFalse:

      XOR A ; Check is false

PoisonDartIsVisibleEnd:

      POP DE

      RET

; =============================================================
; Routine: Hide PoisonDartZ sprite
; -------------------------------------------------------------
PoisonDartsHide:

      PUSH BC
      PUSH DE
      PUSH AF

      LD A,(DynamicStackSize)
      LD B,A

PoisonDartsHideLoop:

      CALL DynamicStackLoopRead

      ; Check if sprite ID is a PoisonDartZ
      LD A,(DE)
      CP PoisonDartZID
      JR Z,PoisonDartsHideTrue

      ; Check if sprite ID is a PoisonDartX
      LD A,(DE)
      CP PoisonDartXID
      JR Z,PoisonDartsHideTrue

      DJNZ PoisonDartsHideLoop

      JR PoisonDartsHideEnd

; -------------------------------------------------------------
; Hide PoisonDart sprite

PoisonDartsHideTrue:

      CALL SpriteInstanceDisplayFlagSetFalse

      DJNZ PoisonDartsHideLoop

; -------------------------------------------------------------

PoisonDartsHideEnd:

      POP AF
      POP DE
      POP BC

      RET

; =============================================================
; Routine: Update PoisonDart sprite (X axis oriented)
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
PoisonDartXUpdate:

      PUSH BC

      LD B,SpriteFrontIsoX

      CALL PoisonDartUpdate

      POP BC

      RET

; =============================================================
; Routine: Update PoisonDart sprite (Z axis oriented)
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
PoisonDartZUpdate:

      PUSH BC

      LD B,SpriteFrontIsoZ

      CALL PoisonDartUpdate

      POP BC

      RET

; =============================================================
; Routine: Update PoisonDart sprite
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; ->  B: Direction
; -------------------------------------------------------------
PoisonDartUpdate:

      PUSH DE

; -------------------------------------------------------------

      PUSH DE

      PUSH DE
      POP HL

      LD DE,DW_ATTR_SpriteInstanceOffset

      ADD HL,DE

      POP DE

      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag

      LD A,(HL)
      CP SpriteInstanceDisplayFlagTrue
      JP Z,PoisonDartUpdateContinue

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag

      LD A,SpriteInstanceDisplayFlagFalse
      LD (DE),A

      JP PoisonDartUpdateEnd

PoisonDartUpdateContinue:

; -------------------------------------------------------------

      CALL UpdateSpritePrevPos

; -------------------------------------------------------------

      PUSH DE
      POP HL

; -------------------------------------------------------------

      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag

      LD A,(HL)
      CP SpriteInstanceDisplayFlagTrue
      JP NZ,PoisonDartUpdateEnd

; -------------------------------------------------------------

      PUSH BC
      LD BC,DW_ATTR_SpriteInstanceDirCounter-0x0001
      ADD HL,BC
      POP BC

      LD A,B
      LD (HL),A

; -------------------------------------------------------------

      LD A,0x08 ; step increment
      CALL UpdateSpriteCurrPos

      JR NC,PoisonDartUpdateKeepDisplaying

; -------------------------------------------------------------
; Dart has reached limit, then hide it and reposition it

      ; Hide PoisonDart
      CALL SpriteInstanceDisplayFlagSetFalse

      ; Get Partner pointer (ShootingFountain / Tree Monster)
      PUSH DE
      POP HL

      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceOffset

      INC HL
      LD A,(HL)
      CP SpriteInstanceDisplayFlagTrue
      JR NZ,PoisonDartUpdateEnd
      DEC HL

; -------------------------------------------------------------

      LD A,B
      CP SpriteFrontIsoX
      JR Z,PoisonDartUpdateX

; -------------------------------------------------------------

PoisonDartUpdateZ:

      ; Get Partner's Iso X coodinate
      PUSH HL

      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX
      LD A,(HL)

      PUSH DE
      POP HL

      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX
      LD (HL),A

      POP HL

; -------------------------------------------------------------

      ; Get Partner's Iso Y coodinate
      PUSH HL

      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY
      LD A,(HL)

      PUSH DE
      POP HL

      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY
      LD (HL),A

      POP HL

; -------------------------------------------------------------

      ; Get Partner's Iso Z coodinate
      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosZ

      LD A,(HL)

      ; Position PoisonDart 10 coordinates ahead of Partner (ShootingFountain)
      ADD A,0x04

      PUSH DE
      POP HL

      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosZ

      LD (HL),A

      JR PoisonDartUpdateKeepDisplaying

PoisonDartUpdateX:

      ; Get Partner's Iso X coodinate
      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      LD A,(HL)

      ; Position PoisonDart 10 coordinates ahead of Partner (ShootingFountain)
      ADD A,0x04

      PUSH DE
      POP HL

      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      LD (HL),A

; -------------------------------------------------------------

PoisonDartUpdateKeepDisplaying:

      CALL TransformSpriteInstanceSpacesCoords

; -------------------------------------------------------------
; Check for collision

      XOR A
      LD (DynIsoDimElemSize),A

      CALL CheckCubicCollision

      LD A,IsoDimElemSize
      LD (DynIsoDimElemSize),A

      LD A,(CollidedSpriteID)
      CP ZoinhoID
      CALL Z,ZoinhoDies

; -------------------------------------------------------------

PoisonDartUpdateEnd:

      POP DE

      RET

; =============================================================
; Routine: Update RotatingSaw sprite (X axis)
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
RotatingSawXUpdate:

      PUSH BC

; -------------------------------------------------------------

      LD B,SpriteFrontIsoX

      CALL RotatingSawUpdate

; -------------------------------------------------------------

      POP BC

      RET

; =============================================================
; Routine: Update RotatingSaw sprite (Z axis)
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
RotatingSawZUpdate:

      PUSH BC

; -------------------------------------------------------------

      LD B,SpriteFrontIsoZ

      CALL RotatingSawUpdate

; -------------------------------------------------------------

      POP BC

      RET

; =============================================================
; Routine: Update RotatingSaw sprite
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
RotatingSawUpdate:

      PUSH DE

; -------------------------------------------------------------

      PUSH DE
      POP HL

; -------------------------------------------------------------

      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag

      LD A,(HL)
      CP SpriteInstanceDisplayFlagTrue
      JR NZ,RotatingSawZUpdateRandomTrigger

; -------------------------------------------------------------

      CALL UpdateSpritePrevPos

; -------------------------------------------------------------

      PUSH BC
      LD BC,DW_ATTR_SpriteInstanceDirCounter-0x0001
      ADD HL,BC
      POP BC

      LD A,B
      LD (HL),A

; -------------------------------------------------------------

      LD A,0x08 ; step increment
      CALL UpdateSpriteCurrPos

      JR NC,RotatingSawZUpdateKeepDisplaying

; -------------------------------------------------------------
; RotatingSaw has reached limit, then hide it and reposition it

      ; Hide RotatingSawZ
      CALL SpriteInstanceDisplayFlagSetFalse

; -------------------------------------------------------------

      LD A,B
      CP SpriteFrontIsoZ
      JR NZ,RotatingSawUpdateXAxis

; -------------------------------------------------------------

RotatingSawUpdateZAxis:

      M_LongOffsetPointerHL ATTR_SpriteInstanceDirCounter, ATTR_SpriteInstanceIsoPosZ

      LD A,0x10
      LD (HL),A

      JR RotatingSawZUpdateEnd

; -------------------------------------------------------------

RotatingSawUpdateXAxis:

      M_LongOffsetPointerHL ATTR_SpriteInstanceDirCounter, ATTR_SpriteInstanceIsoPosX

      LD A,0x10
      LD (HL),A

      JR RotatingSawZUpdateEnd

; -------------------------------------------------------------
; Evaluate random trigger for new animation cycle

RotatingSawZUpdateRandomTrigger:

      ; Get random number (0 - F)
      LD A,R
      AND 0x07
      CP 0x04 ; Random trigger value
      JR NZ,RotatingSawZUpdateEnd

; -------------------------------------------------------------
; Enable new animation cycle

      ; Show RotatingSawZ
      CALL SpriteInstanceDisplayFlagSetTrue

; -------------------------------------------------------------

RotatingSawZUpdateKeepDisplaying:

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

      CALL TransformSpriteInstanceSpacesCoords

; -------------------------------------------------------------
; Check for collision

      XOR A
      LD (DynIsoDimElemSize),A

      CALL CheckCubicCollision

      LD A,IsoDimElemSize
      LD (DynIsoDimElemSize),A

      LD A,(CollidedSpriteID)
      CP ZoinhoID

      CALL Z,ZoinhoDies

; -------------------------------------------------------------

RotatingSawZUpdateEnd:

      POP DE

      RET

; =============================================================
; Label: Gravity pull acceleration step
; -------------------------------------------------------------
UpdateSpriteGravityStep EQU 0x06

; =============================================================
; Routine: Update RotatingSawZ sprite
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
UpdateSpriteGravity:

      PUSH DE
      PUSH AF

; -------------------------------------------------------------

      LD C,A

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY

; -------------------------------------------------------------

      LD A,(DE)
      SUB UpdateSpriteGravityStep

      CP MaxIsoY
      JR C,UpdateSpriteGravityUpdate

      CP 0xF8
      JR NC,UpdateSpriteGravityFloor

      JR UpdateSpriteGravityUpdate

; -------------------------------------------------------------

UpdateSpriteGravityFloor:

      XOR A
      LD (SpriteJumpCounter),A

      LD A,ZoinhoJumpInitTrue
      LD (ZoinhoJumpState),A

; -------------------------------------------------------------

UpdateSpriteGravityUpdate:

      LD (DE),A

; -------------------------------------------------------------

      POP AF
      POP DE

      RET

; =============================================================
; Memory Alloc: Sprite Jump counter
; -------------------------------------------------------------
SpriteJumpCounter: DB 0x00

; =============================================================
; Label: Sprite Jump Counter Limits
; -------------------------------------------------------------
;SpriteJumpCounterTop    EQU 0x0C
SpriteJumpCounterTop    EQU 0x0A

; =============================================================
; Label: Sprite Jump Step value
; -------------------------------------------------------------
SpriteJumpIsoYStep    EQU 0x0A

; =============================================================
; Label: Sprite Jump Iso Y Direction test mask
; -------------------------------------------------------------
SpriteJumpIsoYDirMask EQU 0x04

; =============================================================
; Routine: Update sprite current position jump
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
UpdateSpriteCurrPosJump:

      PUSH DE
      PUSH AF

; -------------------------------------------------------------

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDirCounter

      LD A,(DE)
      AND SpriteJumpIsoYDirMask
      JR Z,UpdateSpriteCurrPosJumpEnd

; -------------------------------------------------------------

      LD A,(SpriteJumpCounter)
      CP SpriteJumpCounterTop
      JR NC,UpdateSpriteCurrPosJumpEnd

; -------------------------------------------------------------

UpdateSpriteCurrPosJumpInc:

      LD A,(SpriteJumpCounter)
      INC A
      LD (SpriteJumpCounter),A

      M_OffsetPointer DE, ATTR_SpriteInstanceDirCounter, ATTR_SpriteInstanceIsoPosY

      LD A,(DE)
      ADD A,SpriteJumpIsoYStep

      CP MaxIsoY
      JR C,UpdateSpriteCurrPosJumpContinue

      LD A,MaxIsoY
      DEC A

UpdateSpriteCurrPosJumpContinue:

      LD (DE),A

; -------------------------------------------------------------

UpdateSpriteCurrPosJumpEnd:

      POP AF
      POP DE

      RET

; =============================================================
; Memory Alloc: Fatal hit flag animation counter
; -------------------------------------------------------------
ZoinhoDeathAnimationCounter:   DB 0x00
TreeMonsterDeathAnimationCounter: DB 0x00

; =============================================================
; Label: Fatal hit animation max number of frames
; -------------------------------------------------------------
ZoinhoDeathAnimationFrameMax   EQU 0x08
TreeMonsterDeathAnimationFrameMax EQU 0x09

; =============================================================
; Routine: Check collision for Zoinho
; -------------------------------------------------------------
ZoinhoCheckCollision:

      PUSH AF

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

; -------------------------------------------------------------
; Check for static sprites

      CP StaticSpriteLethalID_LOW
      JR C,ZoinhoCheckCollisionStaticSpriteCheckSkip

      CP StaticSpriteLethalID_HIGH
      JR NC,ZoinhoCheckCollisionStaticSpriteCheckSkip

      JR ZoinhoCheckCollisionTrue

ZoinhoCheckCollisionStaticSpriteCheckSkip:

; -------------------------------------------------------------
; Check for static sprites

      CP DynamicSpriteLethalID_LOW
      JR C,ZoinhoCheckCollisionDynamicSpriteCheckSkip

      CP DynamicSpriteLethalID_HIGH
      JR NC,ZoinhoCheckCollisionDynamicSpriteCheckSkip

      JR ZoinhoCheckCollisionTrue

ZoinhoCheckCollisionDynamicSpriteCheckSkip:

; -------------------------------------------------------------
; Check for Wall Torch Flip

      CP WallTorchXID
      JR Z,ZoinhoCheckCollisionWallTorch

      CP WallTorchZID
      JR NZ,ZoinhoCheckCollisionWallTorchSkip

ZoinhoCheckCollisionWallTorch:

      CALL ZoinhoFlipsTorch
      
      JR ZoinhoCheckCollisionEnd

ZoinhoCheckCollisionWallTorchSkip:

; -------------------------------------------------------------
; Collect Items collision

      LD (CollectItemID),A

      ; mask off collect item lower significant bits to be
      ; able to compare with base ID_0
      AND 0xF0

; -------------------------------------------------------------

      CP BookID_0
      JR NZ,ZoinhoCheckCollisionBookSkip

      CALL ZoinhoCollectBook

      JR ZoinhoCheckCollisionEnd

ZoinhoCheckCollisionBookSkip:

; -------------------------------------------------------------

      CP SkullID_0
      JR NZ,ZoinhoCheckCollisionSkullSkip

      CALL ZoinhoCollectSkull

      JR ZoinhoCheckCollisionEnd

ZoinhoCheckCollisionSkullSkip:

; -------------------------------------------------------------

      CP AxeID_0
      JR NZ,ZoinhoCheckCollisionEnd

      CALL ZoinhoCollectAxe

      JR ZoinhoCheckCollisionEnd

; -------------------------------------------------------------
; Zoinho dies

ZoinhoCheckCollisionTrue:

      CALL ZoinhoDies

; -------------------------------------------------------------

ZoinhoCheckCollisionEnd:

      POP AF

      RET

; =============================================================
; Routine: "Zoinho Dies" routine
; -------------------------------------------------------------
ZoinhoDies:

      PUSH DE

; -------------------------------------------------------------

      LD A,ZoinhoDeathAnimationFrameMax
      LD (ZoinhoDeathAnimationCounter),A

; -------------------------------------------------------------
; Get Zoinho sprite instance

      LD A,ZoinhoID
      CALL DynamicSpriteSearchByID

; -------------------------------------------------------------
; Convert ID to ZoinhoDead

      LD A,ZoinhoDeadID
      LD (DE),A

; -------------------------------------------------------------

      LD HL,DW_ATTR_SpriteInstanceDirCounter
      ADD HL,DE

      XOR A
      LD (HL),A

; -------------------------------------------------------------
; Replace sprite template with ZoinhoDead

      M_LongOffsetPointerHL ATTR_SpriteInstanceDirCounter, ATTR_SpriteInstanceTemplatePointer

      LD DE,ZoinhoDeadSpriteTemplate

      LD A,D
      LD (HL),A
      INC HL
      LD A,E
      LD (HL),A

; -------------------------------------------------------------
; Set scene status to ending

      LD A,SceneStatusDeath
      LD (SceneStatus),A

; #############################################################
; #  DO NOT DISABLE STENCIL DURING DEATH ANIMATION SEQUENCE   #
; #############################################################
;      LD A,StencilCheckDisabled
;      LD (StencilCheckSwitch),A
; #############################################################

      LD A,(TreeMonsterDeathAnimationCounter)
      CP 0x00
      JR NZ,ZoinhoDiesBeeperSkip

      LD HL,ZoinhoDeadBeeperTemplate
      CALL PlayBeeperInterleavedClear

      LD A,0x03
      LD (BeeperStep),A

ZoinhoDiesBeeperSkip:

; -------------------------------------------------------------

      POP DE

      RET

; =============================================================
; Routine: Death update routine
; -------------------------------------------------------------
ZoinhoDeadUpdate:

      PUSH HL

; -------------------------------------------------------------

      LD A,(ZoinhoDeathAnimationCounter)
      CP 0x00
      JR Z,ZoinhoDeadUpdateStop

      DEC A
      LD (ZoinhoDeathAnimationCounter),A

      ; Set max stepnumber to 2
      LD A,0x03
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

      LD HL,ZoinhoDeadBeeperTemplate
      CALL PlayBeeperInterleaved

      JR ZoinhoDeadUpdateEnd

ZoinhoDeadUpdateStop:

      LD A,SceneStatusGameplay
      LD (SceneStatus),A

; -------------------------------------------------------------

ZoinhoDeadUpdateEnd:

      POP HL

      RET

; =============================================================
; Routine: Zoinho collects a book
; -------------------------------------------------------------
ZoinhoCollectBook:

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    LD HL,PlacementControlBooks
    LD DE,ScoreBooksStr
    LD BC,ScoreBooksPos
    CALL ZoinhoCollectItem

; -------------------------------------------------------------

    CALL DisplayCollectedBook

; -------------------------------------------------------------

    ; Unlock Portal
    CALL UnlockPortal

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

; -------------------------------------------------------------

    RET

; =============================================================
; Routine: Zoinho collects a skull
; -------------------------------------------------------------
; -> A: Skull ID
; -------------------------------------------------------------
ZoinhoCollectSkull:

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    LD HL,PlacementControlSkulls
    LD DE,ScoreSkullsStr
    LD BC,ScoreSkullsPos
    CALL ZoinhoCollectItem

; -------------------------------------------------------------

    LD A,(DE)
    CP "2"
    JR NZ,ZoinhoCollectSkullAddLifeSkip

    LD A,"0"
    LD (DE),A

    LD A,ColourPaletteBrightWhite
    LD DE,ScoreSkullsStr
    LD BC,ScoreSkullsPos
    CALL StrPrint

    LD HL,ScoreLivesStr

    LD A,"9"
    CP (HL)
    JR Z,ZoinhoCollectSkullAddLifeSkip

    INC (HL)

    LD A,ColourPaletteBrightWhite
    LD DE,ScoreLivesStr
    LD BC,ScoreLivesPos
    CALL StrPrint

ZoinhoCollectSkullAddLifeSkip:

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

; -------------------------------------------------------------

    RET

; =============================================================
; Routine: Zoinho collects an Axe
; -------------------------------------------------------------
; -> A: Axe ID
; -------------------------------------------------------------
ZoinhoCollectAxe:

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    LD HL,PlacementControlAxes
    LD DE,ScoreAxesStr
    LD BC,ScoreAxesPos
    CALL ZoinhoCollectItem

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

; -------------------------------------------------------------

    RET

; =============================================================
; Routine: Display collected book
; -------------------------------------------------------------
DisplayCollectedBook:

    PUSH DE
    PUSH BC
    PUSH HL

; -------------------------------------------------------------

    PUSH BC
    PUSH DE

; -------------------------------------------------------------

    LD HL,BookTextMappingArray
    
    LD A,(CollectItemID)

    AND 0x0F
    JR Z,DisplayCollectedBookArray

DisplayCollectedBookArrayLoop:

    INC HL
    INC HL

    DEC A
    JR NZ,DisplayCollectedBookArrayLoop

DisplayCollectedBookArray:

    LD E,(HL)
    INC HL
    LD D,(HL)

; -------------------------------------------------------------

    LD BC,BookText_Position
    CALL ScrollDisplay

; -------------------------------------------------------------

    POP DE
    POP BC

    CALL SceneInit

; -------------------------------------------------------------

    POP HL
    POP BC
    POP DE

    RET

; =============================================================
; Routine: Flip torch
; -------------------------------------------------------------
; -> A: Wall Torch ID
; -------------------------------------------------------------
ZoinhoFlipsTorch:

    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------

    ; Flip torch
    CALL DynamicSpriteSearchByID

    ; Check whether torch is flipped already
    LD HL,0x0001*ATTR_SpriteInstanceStepCounter
    ADD HL,DE
    LD A,(HL)
    CP 0x01
    JR Z,ZoinhoFlipsTorchUpdateSkip

    ; Actually flip torch
    LD A,0x02
    LD (SpriteNoOfMaxStep),A
    CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

    ; Unlock Portal
    CALL UnlockPortal

; -------------------------------------------------------------

ZoinhoFlipsTorchUpdateSkip:

    POP AF
    POP BC
    POP DE

    RET

; =============================================================
; Routine: Unlock local portal
; -------------------------------------------------------------
UnlockPortal:

    ; Check for Locked Portals
    CALL LockedPortalCheck
    JR C,UnlockPortalSkip

; -------------------------------------------------------------

    LD A,WoodenGateXID
    CALL DynamicSpriteSearchByID
    JR NC,UnlockPortalGateXSkip

    CALL SpriteInstanceDisplayFlagSetFalse
    CALL RemoveSpriteFromMinimap

UnlockPortalGateXSkip:

; -------------------------------------------------------------

    LD A,WoodenGateZID
    CALL DynamicSpriteSearchByID
    JR NC,UnlockPortalGateZSkip

    CALL SpriteInstanceDisplayFlagSetFalse
    CALL RemoveSpriteFromMinimap

UnlockPortalGateZSkip:

; -------------------------------------------------------------

    LD A,SpriteInstanceDisplayFlagFalse
    LD HL,(LocalPortalDisplayFlagPointer)
    LD (HL),A

; -------------------------------------------------------------

UnlockPortalSkip:

    RET

; =============================================================
; Routine: Tree Monster Update
; -------------------------------------------------------------
; -> DE: Tree Monster sprite instance pointer
; -------------------------------------------------------------
TreeMonsterUpdate:

	LD HL,ImmunityWait
	LD A,(HL)
	CP 0x00
	JR Z,TreeMonsterWaitSkip
	DEC (HL)
	RET NZ
	TreeMonsterWaitSkip:

; -------------------------------------------------------------

    PUSH DE

; -------------------------------------------------------------

    LD A,0x02
    LD (SpriteNoOfMaxStep),A
    CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

    PUSH DE
    POP HL
    M_LongOffsetPointerHL ATTR_SpriteInstanceOffset, ATTR_SpriteInstanceRoot

    INC HL
    LD A,(HL)
    CP SpriteInstanceDisplayFlagTrue
    JR Z,TreeMonsterUpdateEnd

    LD A,(SpeccyScreenFrameCounterAddress)
    LD D,A
    LD A,R
    ADD A,D
    CP 0x08 ; Random trigger value
    JR NC,TreeMonsterUpdateEnd

    LD A,SpriteInstanceDisplayFlagTrue
    LD (HL),A

; -------------------------------------------------------------

TreeMonsterUpdateEnd:

    POP DE

    RET

; =============================================================
; Routine: D3v1l Update
; -------------------------------------------------------------
; -> DE: Tree Monster sprite instance pointer
; -------------------------------------------------------------
D3v1lUpdate:

    LD A,0x02
    LD (SpriteNoOfMaxStep),A
    CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

    RET

; =============================================================
; Memory Alloc: Axe Direction
; -------------------------------------------------------------
ThrownDirPointer: DW 0x0000

; =============================================================
; Routine: Axe Update
; -------------------------------------------------------------
; -> DE: Axe sprite instance pointer
; -------------------------------------------------------------
ThrownAxeUpdate:

    PUSH BC
    PUSH DE

; -------------------------------------------------------------

    LD HL,TempIsoPosition
    CALL StoreIsoPos

; -------------------------------------------------------------

    LD A,(ScoreAxesStr)
    CP "0"
    JR NZ,ThrownAxeUpdateScoreCheckEnd

    INC DE
    LD A,SpriteInstanceDisplayFlagFalse
    LD (DE),A

    JP ThrownAxeUpdateEnd

ThrownAxeUpdateScoreCheckEnd:

; -------------------------------------------------------------

    INC DE
    LD A,(DE)
    CP SpriteInstanceDisplayFlagFalse
    JP Z,ThrownAxeUpdateDisplayFalse

; -------------------------------------------------------------

    DEC DE

    LD HL,0x0001*ATTR_SpriteInstanceDirCounter
    ADD HL,DE
    LD A,SpriteBackIsoZ
    LD (HL),A

    LD (ThrownDirPointer),HL

    CALL UpdateSpritePrevPos

    LD A,0x04
    LD (SpriteNoOfMaxStep),A
    CALL SpriteInstanceStepUpdate

    LD A,0x08
    CALL UpdateSpriteCurrPos
    CALL TransformSpriteInstanceSpacesCoords

    LD HL,0x0001*ATTR_SpriteInstanceIsoPosZ
    ADD HL,DE
    LD A,(HL)
    CP 0x00
    JR NZ,ThrownAxeUpdateCollisionCheck

    LD A,0x70
    LD (HL),A

    CALL SpriteInstanceDisplayFlagSetFalse

    JP ThrownAxeUpdateEnd

; -------------------------------------------------------------

ThrownAxeUpdateCollisionCheck:

    LD HL,DimensionsObstacle
    LD BC,DimensionsObstacle
    CALL CollisionCheck
    JP NC,ThrownAxeUpdateEnd

    LD HL,(CollidedSpriteInstancePointer)
    LD A,(HL)

    CP TreeMonsterID_LOW
    JR C,ThrownAxeUpdateCollisionCheckElseDart

    CP TreeMonsterID_HIGH
    JR NC,ThrownAxeUpdateCollisionCheckElseDart

    PUSH HL

    CALL SpriteInstanceDisplayFlagSetFalse

    POP DE

    CALL TreeMonsterDead

    JP ThrownAxeUpdateEnd

; -------------------------------------------------------------

ThrownAxeUpdateCollisionCheckElseDart:

    CP PoisonDartZID
    JR NZ,ThrownAxeUpdateCollisionCheckElseZoinho

    PUSH HL
    POP DE

    LD HL,ScoreAxesStr
    INC (HL)

    JP ThrownAxeUpdateEnd

; -------------------------------------------------------------

ThrownAxeUpdateCollisionCheckElseZoinho:

    CP ZoinhoID
    JR NZ,ThrownAxeUpdateCollisionCheckElse

    PUSH HL
    POP DE

    LD HL,ScoreAxesStr
    INC (HL)

    JR ThrownAxeUpdateEnd

; -------------------------------------------------------------

ThrownAxeUpdateCollisionCheckElse:

    PUSH DE
    POP HL
    INC HL
    INC HL

    XOR A

    LD (HL),A
    INC HL
    LD (HL),A
    INC HL
    LD (HL),A

    CALL SpriteInstanceDisplayFlagSetFalse
    CALL TransformSpriteInstanceSpacesCoords

    JR ThrownAxeUpdateEnd

; -------------------------------------------------------------

ThrownAxeUpdateDisplayFalse:

    LD A,(GameplayControlStates)
    AND Button_Fire
    JR NZ,ThrownAxeUpdateEnd

    LD A,ZoinhoID
    CALL DynamicSpriteSearchByID

    ; Mask off jump direction flag in case of a mid-jump throw
    LD A,SpriteUpIsoY
    XOR 0xFF
    LD C,A

    LD HL,0x0001*ATTR_SpriteInstanceDirCounter
    ADD HL,DE
    LD A,(HL)
    AND C

    CP SpriteBackIsoZ
    JR NZ,ThrownAxeUpdateEnd

; -------------------------------------------------------------

    LD HL,ActionBeeperTemplate
    CALL PlayBeeper

    PUSH DE
    POP HL
    INC HL
    INC HL

    POP DE
    PUSH DE
    PUSH DE

    INC DE
    INC DE

    LD A,(HL)
    LD (DE),A
    INC HL
    INC DE

    LD A,(HL)
    LD (DE),A
    INC HL
    INC DE

    LD A,(HL)
    SUB 0x10
    LD (DE),A

; -------------------------------------------------------------

    POP DE

; -------------------------------------------------------------

    LD A,(ScoreAxesStr)
    DEC A
    LD (ScoreAxesStr),A

    PUSH DE

    LD A,ColourPaletteBrightWhite
    LD DE,ScoreAxesStr
    LD BC,ScoreAxesPos
    CALL StrPrint

    POP DE

; -------------------------------------------------------------

    CALL TransformSpriteInstanceSpacesCoords

    INC DE

    LD A,SpriteInstanceDisplayFlagTrue
    LD (DE),A

; -------------------------------------------------------------

ThrownAxeUpdateEnd:

    LD HL,(ThrownDirPointer)
    LD A,SpriteFrontIsoZ
    LD (HL),A

    POP DE
    POP BC

    RET

; =============================================================
; Mem Alloc: Tree Monster Dummy Scoreboard
; -------------------------------------------------------------


; =============================================================
; Routine: Tree Monster Kill
; -------------------------------------------------------------
; -> DE: Tree Monster sprite instance pointer
; -------------------------------------------------------------
TreeMonsterDead:

    PUSH DE

; -------------------------------------------------------------

    EX DE,HL

    LD DE,DW_ATTR_SpriteInstanceOffset
    XOR A
    SBC HL,DE

    EX DE,HL

    CALL SpriteInstanceDisplayFlagSetFalse
    CALL RemoveSpriteFromMinimap

    POP DE
    PUSH DE

; -------------------------------------------------------------

    LD A,(DE)
    SUB TreeMonsterID_0

    INC A

    LD B,A

    LD A,0x01

    RRC A

TreeMonsterDeadDefinePlacementLoop:

    RLC A

    DJNZ TreeMonsterDeadDefinePlacementLoop

    XOR 0xFF

    LD B,A

    LD A,(PlacementControlTreeMonsters)

    AND B

    LD (PlacementControlTreeMonsters),A

    CP %11100000
    JR NZ,TreeMonsterDeadEnd

    ; Unlock Portal
    CALL UnlockPortal

; -------------------------------------------------------------

TreeMonsterDeadEnd:

    POP DE

    CALL TreeMonsterDies

    RET

; =============================================================
; Routine: Hide TreeMonter sprite
; -------------------------------------------------------------
TreeMonstersHide:

      PUSH BC
      PUSH DE
      PUSH AF

      LD A,(DynamicStackSize)
      LD B,A

TreeMonstersHideLoop:

      CALL DynamicStackLoopRead

      ; Check if sprite ID is a TreeMonster
      LD A,(DE)

      CP TreeMonsterID_LOW
      JR C,TreeMonstersPlacementCheckContinue
      CP TreeMonsterID_HIGH
      JR NC,TreeMonstersPlacementCheckContinue

      SUB TreeMonsterID_0
      INC A
      LD C,A

      LD A,0x01

      RRC A

TreeMonstersPlacementCheckLoop:

      RLC A

      DEC C
      JR NZ,TreeMonstersPlacementCheckLoop

      LD C,A

      LD A,(PlacementControlTreeMonsters)

      AND C
      CP 0x00
      JR NZ,TreeMonstersPlacementCheckContinue

      CALL SpriteInstanceDisplayFlagSetFalse

TreeMonstersPlacementCheckContinue:

      DJNZ TreeMonstersHideLoop

; -------------------------------------------------------------

      POP AF
      POP DE
      POP BC

      RET

; =============================================================
; Routine: "TreeMonster Dies" routine
; -------------------------------------------------------------
; -> DE: Tree Monster sprite instance pointer
; -------------------------------------------------------------
TreeMonsterDies:

      PUSH DE

; -------------------------------------------------------------

      LD A,TreeMonsterDeathAnimationFrameMax
      LD (TreeMonsterDeathAnimationCounter),A

; -------------------------------------------------------------
; Convert ID to ZoinhoDead

      LD A,TreeMonsterDeadID
      LD (DE),A

; -------------------------------------------------------------
; Replace sprite template with ZoinhoDead

      EX DE,HL
      M_LongOffsetPointerHL ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceTemplatePointer

      LD DE,TreeMonsterDeadSpriteTemplate

      LD A,D
      LD (HL),A
      INC HL
      LD A,E
      LD (HL),A

; -------------------------------------------------------------

      POP DE

      RET

; =============================================================
; Routine: TreeMonster Death update routine
; -------------------------------------------------------------
; -> DE: Tree Monster sprite instance pointer
; -------------------------------------------------------------
TreeMonsterDeadUpdate:

      PUSH DE

; -------------------------------------------------------------

      LD A,(TreeMonsterDeathAnimationCounter)
      CP 0x00
      JR Z,TreeMonsterDeadUpdateStop

      DEC A
      LD (TreeMonsterDeathAnimationCounter),A

      ; Set max stepnumber to 2
      LD A,0x03
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

      LD HL,EnemyDeadBeeperTemplate
      CALL PlayBeeperInterleaved

      JR TreeMonsterDeadUpdateEnd

TreeMonsterDeadUpdateStop:

    CALL PlayBeeperInterleavedClear

    CALL SpriteInstanceDisplayFlagSetFalse
    CALL RemoveSpriteFromMinimap

; -------------------------------------------------------------

TreeMonsterDeadUpdateEnd:

      POP DE

      RET

; =============================================================
; Routine: ThrownBook Update
; -------------------------------------------------------------
; -> DE: ThrownBook sprite instance pointer
; -------------------------------------------------------------
ThrownBookUpdate:

    PUSH BC
    PUSH DE

; -------------------------------------------------------------

    LD HL,TempIsoPosition
    CALL StoreIsoPos

; -------------------------------------------------------------

    LD A,(ScoreBooksStr)
    CP "0"
    JR NZ,ThrownBookUpdateScoreCheckEnd

    INC DE
    LD A,SpriteInstanceDisplayFlagFalse
    LD (DE),A

    JP ThrownBookUpdateEnd

ThrownBookUpdateScoreCheckEnd:

; -------------------------------------------------------------

    INC DE
    LD A,(DE)
    CP SpriteInstanceDisplayFlagFalse
    JP Z,ThrownBookUpdateDisplayFalse

; -------------------------------------------------------------

    DEC DE

    LD HL,0x0001*ATTR_SpriteInstanceDirCounter
    ADD HL,DE
    LD A,SpriteBackIsoZ
    LD (HL),A
    
    LD (ThrownDirPointer),HL

    CALL UpdateSpritePrevPos

    LD A,0x01
    LD (SpriteNoOfMaxStep),A
    CALL SpriteInstanceStepUpdate

    LD A,0x08
    CALL UpdateSpriteCurrPos
    CALL TransformSpriteInstanceSpacesCoords

    LD HL,0x0001*ATTR_SpriteInstanceIsoPosZ
    ADD HL,DE
    LD A,(HL)
    CP 0x00
    JR NZ,ThrownBookUpdateCollisionCheck

    LD A,0x70
    LD (HL),A

    CALL SpriteInstanceDisplayFlagSetFalse

    JP ThrownBookUpdateEnd

; -------------------------------------------------------------

ThrownBookUpdateCollisionCheck:

    LD HL,DimensionsObstacle
    LD BC,DimensionsObstacle
    CALL CollisionCheck
    JP NC,ThrownBookUpdateEnd

    LD HL,(CollidedSpriteInstancePointer)
    LD A,(HL)
    CP D3v1lID
    JR NZ,ThrownBookUpdateCollisionCheckElseZoinho

    PUSH HL

    CALL SpriteInstanceDisplayFlagSetFalse

    POP DE

    CALL D3v1lIsHit

    JP ThrownBookUpdateEnd

; -------------------------------------------------------------

ThrownBookUpdateCollisionCheckElseZoinho:

    CP ZoinhoID
    JR NZ,ThrownBookUpdateCollisionCheckElse

    PUSH HL
    POP DE

    LD HL,ScoreBooksStr
    INC (HL)

    JR ThrownBookUpdateEnd

; -------------------------------------------------------------

ThrownBookUpdateCollisionCheckElse:

    PUSH DE
    POP HL
    INC HL
    INC HL

    XOR A

    LD (HL),A
    INC HL
    LD (HL),A
    INC HL
    LD (HL),A

    CALL SpriteInstanceDisplayFlagSetFalse
    CALL TransformSpriteInstanceSpacesCoords

    JR ThrownBookUpdateEnd

; -------------------------------------------------------------

ThrownBookUpdateDisplayFalse:

    LD A,(GameplayControlStates)
    AND Button_Fire
    JR NZ,ThrownBookUpdateEnd

    LD A,ZoinhoID
    CALL DynamicSpriteSearchByID

    ; Mask off jump direction flag in case of a mid-jump throw
    LD A,SpriteUpIsoY
    XOR 0xFF
    LD C,A

    LD HL,0x0001*ATTR_SpriteInstanceDirCounter
    ADD HL,DE
    LD A,(HL)
    AND C

    CP SpriteBackIsoZ
    JR NZ,ThrownBookUpdateEnd

; -------------------------------------------------------------
; ThrownBook start action

    LD HL,ActionBeeperTemplate
    CALL PlayBeeper

    ; Get initial position (X,Y,Z)
    PUSH DE
    POP HL
    INC HL
    INC HL

    POP DE
    PUSH DE
    PUSH DE

    INC DE
    INC DE

    LD A,(HL)
    LD (DE),A
    INC HL
    INC DE

    LD A,(HL)
    LD (DE),A
    INC HL
    INC DE

    LD A,(HL)
    SUB 0x10
    LD (DE),A

; -------------------------------------------------------------

    POP DE

; -------------------------------------------------------------

    ; Update Book counter
    LD A,(ScoreBooksStr)
    DEC A
    LD (ScoreBooksStr),A

    PUSH DE

    LD A,ColourPaletteBrightWhite
    LD DE,ScoreBooksStr
    LD BC,ScoreBooksPos
    CALL StrPrint

    POP DE

; -------------------------------------------------------------

    ; Update ThrownBook in ISO projections
    CALL TransformSpriteInstanceSpacesCoords

    INC DE

    LD A,SpriteInstanceDisplayFlagTrue
    LD (DE),A

; -------------------------------------------------------------

ThrownBookUpdateEnd:

    LD HL,(ThrownDirPointer)
    LD A,SpriteFrontIsoZ
    LD (HL),A

    POP DE
    POP BC

    RET

; =============================================================
; Routine: D3v1l is hit
; -------------------------------------------------------------
D3v1lIsHit:

    PUSH DE

; -------------------------------------------------------------

    LD DE,(CollidedSpriteInstancePointer)

    LD A,D3v1lKillID
    LD (DE),A

    LD HL,DW_ATTR_SpriteInstanceTemplatePointer
    ADD HL,DE

    LD DE,D3v1lKillSpriteTemplate

    LD (HL),D
    INC HL
    LD (HL),E

    LD A,0x09
    LD (D3v1lKillAnimationCounter),A

; -------------------------------------------------------------

    POP DE

    RET

; =============================================================
; Label: D3v1l hit number of required hits
; -------------------------------------------------------------
D3v1lKillsRequired EQU 0x06

; =============================================================
; Memory Alloc: D3v1l hit animation counter
; -------------------------------------------------------------
D3v1lKillAnimationCounter: DB 0x00
D3v1lKillCounter:          DB D3v1lKillsRequired

; =============================================================
; Routine: D3v1l hit update routine
; -------------------------------------------------------------
; -> DE: D3v1l hit sprite instance pointer
; -------------------------------------------------------------
D3v1lKillUpdate:

      PUSH DE

; -------------------------------------------------------------

      LD A,(D3v1lKillAnimationCounter)
      CP 0x00
      JR Z,D3v1lKillUpdateStop

      DEC A
      LD (D3v1lKillAnimationCounter),A

      ; Set max stepnumber to 3
      LD A,0x03
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

      LD HL,EnemyDeadBeeperTemplate
      CALL PlayBeeperInterleaved

      JR D3v1lKillUpdateEnd

D3v1lKillUpdateStop:

    ;LD HL,StepsBeeperTemplate
    CALL PlayBeeperInterleavedClear

    PUSH DE
    POP HL

    PUSH DE

    LD A,D3v1lID
    LD (HL),A

    LD DE,DW_ATTR_SpriteInstanceTemplatePointer
    ADD HL,DE

    LD DE,D3v1lSpriteTemplate

    LD (HL),D
    INC HL
    LD (HL),E

    POP DE

    LD A,(D3v1lKillCounter)
    DEC A
    LD (D3v1lKillCounter),A
    CP 0x00
    JR NZ,D3v1lKillUpdateEnd

    CALL SpriteInstanceDisplayFlagSetFalse
    CALL RemoveSpriteFromMinimap

    CALL EndingSceneDisplay

    LD A,SceneStatusEnd
    LD (SceneStatus),A

    CALL SceneInit

; -------------------------------------------------------------

D3v1lKillUpdateEnd:

      POP DE

      RET

; =============================================================
; Routine: Egg Landing Check
; -------------------------------------------------------------
LandingCheckEgg:

      PUSH DE
      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

      CP EggXID_0
      JR C,LandingCheckEggEnd

      CP EggXID_HIGH
      JR NC,LandingCheckEggEnd

; -------------------------------------------------------------

      CALL DynamicSpriteSearchByID
      JR NC,LandingCheckEggEnd

; -------------------------------------------------------------

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

      LD HL,ActionBeeperTemplate
      CALL PlayBeeper

; -------------------------------------------------------------

      LD HL,DW_ATTR_SpriteInstanceStepCounter
      ADD HL,DE

      LD A,(HL)
      CP 0x00
      JR NZ,LandingCheckEggNotCrackedYet

; -------------------------------------------------------------

      CALL SpriteInstanceDisplayFlagSetFalse
      CALL RemoveSpriteFromMinimap

      PUSH DE

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      XOR A
      LD (DE),A
      INC DE
      LD (DE),A
      INC DE
      LD (DE),A

      POP DE

      CALL TransformSpriteInstanceSpacesCoords

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)
      SUB EggXID_0
      ADD A,SkullID_0

      CALL StaticSpriteSearchByID
      CALL MoveSpriteToMinimap

LandingCheckEggNotCrackedYet:

; -------------------------------------------------------------

      LD DE,(ZoinhoInstancePointer)

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY

      LD A,(DE)
      ADD A,0x18

      CP 0x60
      JR C,LandingCheckEggNoClip

      LD A,0x60

LandingCheckEggNoClip:

      LD (DE),A

; -------------------------------------------------------------

LandingCheckEggEnd:

      POP BC
      POP HL
      POP DE

      RET

; =============================================================
; Routine: EggScorpion Landing Check
; -------------------------------------------------------------
LandingCheckEggScorpion:

      PUSH DE
      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

      CP EggScorpionXID
      JR NZ,LandingCheckEggScorpionEnd

; -------------------------------------------------------------

      LD DE,(CollidedSpriteInstancePointer)

; -------------------------------------------------------------

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

      LD HL,ActionBeeperTemplate
      CALL PlayBeeper

; -------------------------------------------------------------

      LD HL,DW_ATTR_SpriteInstanceStepCounter
      ADD HL,DE

      LD A,(HL)
      CP 0x00
      JR NZ,LandingCheckEggScorpionNotCrackedYet

; -------------------------------------------------------------

      CALL SpriteInstanceDisplayFlagSetFalse
      CALL RemoveSpriteFromMinimap

; -------------------------------------------------------------

      PUSH DE

      EX DE,HL

      LD DE,DW_ATTR_SpriteInstanceOffset

      XOR A
      SBC HL,DE

      EX DE,HL

      LD A,ScorpionID
      LD (DE),A

      CALL SpriteInstanceDisplayFlagSetTrue
      CALL MoveSpriteToMinimap

      POP HL
      PUSH HL

      PUSH DE

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      LDI
      LDI
      LDI

      POP DE

      CALL TransformSpriteInstanceSpacesCoords

      POP DE

; -------------------------------------------------------------

      PUSH DE

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      XOR A
      LD (DE),A
      INC DE
      LD (DE),A
      INC DE
      LD (DE),A

      POP DE

      CALL TransformSpriteInstanceSpacesCoords

; -------------------------------------------------------------

LandingCheckEggScorpionNotCrackedYet:

      LD DE,(ZoinhoInstancePointer)

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY

      LD A,(DE)
      ADD A,0x18

      CP 0x60
      JR C,LandingCheckEggScorpionNoClip

      LD A,0x60

LandingCheckEggScorpionNoClip:

      LD (DE),A

; -------------------------------------------------------------

LandingCheckEggScorpionEnd:

      POP BC
      POP HL
      POP DE

      RET

; =============================================================
; Routine: BuildingBlockCracked Landing Check
; -------------------------------------------------------------
LandingCheckBuildingBlockCracked:

      PUSH DE
      PUSH HL

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

      CP BuildingBlockCrackedID
      JR NZ,LandingCheckBuildingBlockCrackedEnd

; -------------------------------------------------------------

      LD DE,(CollidedSpriteInstancePointer)

; -------------------------------------------------------------

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

      LD HL,ActionBeeperTemplate
      CALL PlayBeeper

; -------------------------------------------------------------

      LD HL,DW_ATTR_SpriteInstanceStepCounter
      ADD HL,DE

      LD A,(HL)
      CP 0x00
      JR NZ,LandingCheckBuildingBlockCrackedNotCrackedYet

; -------------------------------------------------------------

      CALL SpriteInstanceDisplayFlagSetFalse
      CALL RemoveSpriteFromMinimap
      
      PUSH DE

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      XOR A
      LD (DE),A
      INC DE
      LD (DE),A
      INC DE
      LD (DE),A

      POP DE

      CALL TransformSpriteInstanceSpacesCoords

; -------------------------------------------------------------

LandingCheckBuildingBlockCrackedNotCrackedYet:

      LD DE,(ZoinhoInstancePointer)

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY

      LD A,(DE)
      ADD A,0x18

      CP 0x60
      JR C,LandingCheckBuildingBlockCrackedNoClip

      LD A,0x60

LandingCheckBuildingBlockCrackedNoClip:

      LD (DE),A

; -------------------------------------------------------------

LandingCheckBuildingBlockCrackedEnd:

      POP HL
      POP DE

      RET

; =============================================================
; Routine: PinballMushroom Landing Check
; -------------------------------------------------------------
LandingCheckPinballMushroom:

      PUSH DE
      PUSH HL

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

      CP PinballMushroomID
      JR NZ,LandingCheckPinballMushroomEnd

; -------------------------------------------------------------

      LD DE,(CollidedSpriteInstancePointer)

; -------------------------------------------------------------

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

      LD HL,ActionBeeperTemplate
      CALL PlayBeeper

; -------------------------------------------------------------

      LD DE,(ZoinhoInstancePointer)

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY

      LD A,(DE)
      ADD A,0x18

      CP 0x60
      JR C,LandingCheckPinballMushroomNoClip

      LD A,0x60

LandingCheckPinballMushroomNoClip:

      LD (DE),A

; -------------------------------------------------------------

LandingCheckPinballMushroomEnd:

      POP HL
      POP DE

      RET

; =============================================================
; Routine: JackGoat Landing Check
; -------------------------------------------------------------
LandingCheckJackGoat:

      PUSH DE
      PUSH HL

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

      CP JackGoatID
      JR NZ,LandingCheckJackGoatEnd

; -------------------------------------------------------------

      LD DE,(CollidedSpriteInstancePointer)

; -------------------------------------------------------------

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

      LD HL,ActionBeeperTemplate
      CALL PlayBeeper

; -------------------------------------------------------------

      LD DE,(ZoinhoInstancePointer)

      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosY

      LD A,(DE)
      ADD A,0x18

      CP 0x60
      JR C,LandingCheckJackGoatNoClip

      LD A,0x60

LandingCheckJackGoatNoClip:

      LD (DE),A

; -------------------------------------------------------------

      XOR A
      LD (CollidedSpriteID),A

; -------------------------------------------------------------

LandingCheckJackGoatEnd:

      POP HL
      POP DE

      RET

; =============================================================
; Routine: PinballMushroom Update
; -------------------------------------------------------------
PinballMushroomUpdate:

      PUSH DE
      PUSH HL

; -------------------------------------------------------------

      LD HL,DW_ATTR_SpriteInstanceStepCounter
      ADD HL,DE

      LD A,(HL)
      CP 0x00
      JR Z,PinballMushroomUpdateEnd

; -------------------------------------------------------------

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

PinballMushroomUpdateEnd:

      POP HL
      POP DE

      RET

; =============================================================
; Routine: Pinball Action Collision Check
; -------------------------------------------------------------
PinballActionCollisionCheck:

      PUSH DE
      PUSH HL

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

      CP JackGoatID
      JR Z,PinballActionCollisionCheckDoIt

      CP PinballMushroomID
      JP NZ,PinballActionCollisionCheckEnd

; -------------------------------------------------------------

      LD DE,(CollidedSpriteInstancePointer)

; -------------------------------------------------------------

      LD A,0x02
      LD (SpriteNoOfMaxStep),A
      CALL SpriteInstanceStepUpdate

; -------------------------------------------------------------

PinballActionCollisionCheckDoIt:

      LD HL,ActionBeeperTemplate
      CALL PlayBeeper

; -------------------------------------------------------------

      LD DE,(ZoinhoInstancePointer)

; -------------------------------------------------------------

      LD HL,PositionObjectStore
      CALL StorePosition

; -------------------------------------------------------------

      LD HL,DW_ATTR_SpriteInstanceDirCounter
      ADD HL,DE

      LD A,(HL)

      LD HL,DW_ATTR_SpriteInstanceIsoPosY
      ADD HL,DE

; -------------------------------------------------------------

      EX AF,AF'

      LD A,(HL)
      ADD A,0x18
      LD (HL),A

      DEC HL

      EX AF,AF'

; -------------------------------------------------------------

      CP SpriteFrontIsoX
      JR NZ,PinballActionCollisionCheckNotFrontIsoX

      LD A,(HL)
      SUB 0x10

      JR NC,PinballActionCollisionCheckFrontIsoXClipSkip

      XOR A

PinballActionCollisionCheckFrontIsoXClipSkip:

      LD (HL),A

      JR PinballActionCollisionCheckUpdateZoinho

PinballActionCollisionCheckNotFrontIsoX:

; -------------------------------------------------------------

      CP SpriteBackIsoX
      JR NZ,PinballActionCollisionCheckNotBackIsoX

      LD A,(HL)
      ADD A,0x10

      CP 0x60
      JR C,PinballActionCollisionCheckBackIsoXClipSkip

      LD A,0x60

PinballActionCollisionCheckBackIsoXClipSkip:

      LD (HL),A

      JR PinballActionCollisionCheckUpdateZoinho

PinballActionCollisionCheckNotBackIsoX:

; -------------------------------------------------------------

      INC HL
      INC HL ; Move to Z coordinate

      CP SpriteFrontIsoZ
      JR NZ,PinballActionCollisionCheckNotFrontIsoZ

      LD A,(HL)
      SUB 0x10

      JR NC,PinballActionCollisionCheckFrontIsoZClipSkip

      XOR A

PinballActionCollisionCheckFrontIsoZClipSkip:

      LD (HL),A

      JR PinballActionCollisionCheckUpdateZoinho

PinballActionCollisionCheckNotFrontIsoZ:

; -------------------------------------------------------------

      CP SpriteBackIsoZ
      JR NZ,PinballActionCollisionCheckNotBackIsoZ

      LD A,(HL)
      ADD A,0x10

      CP 0x60
      JR C,PinballActionCollisionCheckBackIsoZClipSkip

      LD A,0x60

PinballActionCollisionCheckBackIsoZClipSkip:

      LD (HL),A

      JR PinballActionCollisionCheckUpdateZoinho

PinballActionCollisionCheckNotBackIsoZ:

; -------------------------------------------------------------

PinballActionCollisionCheckUpdateZoinho:

      XOR A
      LD (CollidedSpriteID),A
      
      LD DE,(ZoinhoInstancePointer)

      CALL TransformSpriteInstanceSpacesCoords

      LD HL,DimensionsZoinho
      LD BC,DimensionsObstacle
      CALL CollisionCheck

      JR NC,PinballActionCollisionCheckEnd

      CALL ZoinhoCollisionReevaluation

; -------------------------------------------------------------

PinballActionCollisionCheckEnd:

      POP HL
      POP DE

      RET


; =============================================================
; Routine: Collision re-evaluation
; -------------------------------------------------------------
ZoinhoCollisionReevaluation:

      PUSH DE
      PUSH BC
      PUSH HL

; -------------------------------------------------------------

      LD A,(CollidedSpriteID)

      CP JackGoatID
      JR Z,ZoinhoCollisionReevaluationEnd

; -------------------------------------------------------------

      LD DE,(CollidedSpriteInstancePointer)

      LD HL,DW_ATTR_SpriteInstanceIsoPosX
      ADD HL,DE

      PUSH HL
      POP DE

      LD HL,PositionObjectStore

; -------------------------------------------------------------

      EX DE,HL

      CALL ZoinhoCollisionReevaluationIteration
      INC DE
      INC HL
      CALL ZoinhoCollisionReevaluationIteration

; -------------------------------------------------------------

      LD DE,(ZoinhoInstancePointer)

      CALL RestorePositionObject

      CALL ZoinhoCheckCollision

; -------------------------------------------------------------

ZoinhoCollisionReevaluationEnd:

      POP HL
      POP BC
      POP DE

      RET

; =============================================================
; Routine: Collision re-evaluation iteration
; -------------------------------------------------------------
ZoinhoCollisionReevaluationIteration:

      LD A,(DE)
      LD B,(HL)

      CP B
      JR NC,ZoinhoCollisionReevaluationIterationGT

; -------------------------------------------------------------

      LD A,B
      SUB 0x10

      JR NC,ZoinhoCollisionReevaluationIterationEnd
      
      XOR A

      JR ZoinhoCollisionReevaluationIterationEnd

; -------------------------------------------------------------

ZoinhoCollisionReevaluationIterationGT:

      LD A,B
      ADD A,0x10
      
      CP 0x60
      JR NC,ZoinhoCollisionReevaluationIterationEnd

      LD A,0x60

; -------------------------------------------------------------

ZoinhoCollisionReevaluationIterationEnd:

      LD (DE),A

; -------------------------------------------------------------

      INC DE
      INC HL

      RET