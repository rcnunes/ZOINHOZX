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
; INCLUDE - TemplateScene
; =================================================================================

; #################################################################################
; PORTAL LOCKS DEFINITIONS
; #################################################################################

; #################################################################################
; Memory Alloc: Portal Locks
PortalLocks:

; ---------------------------------------------------------------------------------
PortalLocksCount: DB 0x0C

; #################################################################################
; Mem Alloc: Portal Locks Array
PortalLocksArray:

DW IsoSceneTemplateFleshEatingPlantsPortal ; Scene pointer
DW IsoSceneTemplateHoppingFlowers    ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateBreatherBeforeSharkTrap ; Scene pointer
DW IsoSceneTemplateHallOfTorchs    ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateToSharkTrap ; Scene pointer
DW IsoSceneTemplateSharkTank_1    ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateD3v1lFinalScene ; Scene pointer
DW IsoSceneTemplateTreeMonsterBattle    ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateBossAntichamber ; Scene pointer
DW IsoSceneTemplateTreeMonsterBattle    ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateExitFromTheDarkForest ; Scene pointer
DW IsoSceneTemplateBookOfTheDarkForest     ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateLockedExitFromTheDarkForest ; Scene pointer
DW IsoSceneTemplateLeavingTheDarkForest     ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateCrossFire ; Scene pointer
DW IsoSceneTemplateTreasureRoom ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateTheFloorIsMoving ; Scene pointer
DW IsoSceneTemplateRoseGardenOfWorms ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateTipToeingOnEggs ; Scene pointer
DW IsoSceneTemplateWallOfTorches ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateStairwayToDeath ; Scene pointer
DW IsoSceneTemplateBreatherToBoss ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

DW IsoSceneTemplateTurnToBoss ; Scene pointer
DW IsoSceneTemplateBreatherToBoss ; Scene pointer
DB SpriteInstanceDisplayFlagTrue     ; Lock state

; #################################################################################
; GAME SCENE DEFINITIONS
; #################################################################################

; #################################################################################
; Memory Alloc: Scene: D3v1l Final Scene
IsoSceneTemplateD3v1lFinalScene:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid ; PortalFrontLeft
      DW NextScenePointerVoid ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0A ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BookID_7
      DB 0x40, 0x10, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockHellID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesHellID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB SpikesHellID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB SpikesHellID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB SpikesHellID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB KillingSkullHellID
      DB 0x10, 0x00, 0x10 ; X,Y,Z

      DB KillingSkullHellID
      DB 0x10, 0x00, 0x60 ; X,Y,Z

      DB KillingSkullHellID
      DB 0x60, 0x00, 0x10 ; X,Y,Z

      DB KillingSkullHellID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x09 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB D3v1lID
      DB 0x40, 0x18, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkeletonArmXHellID
      DB 0x28, 0x00, 0x10 ; X,Y,Z

      DB SkeletonArmXHellID
      DB 0x48, 0x00, 0x10 ; X,Y,Z

      DB SkeletonArmXHellID
      DB 0x18, 0x00, 0x40 ; X,Y,Z

      DB SkeletonArmZHellID
      DB 0x68, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SnakeHellID
      DB 0x10, 0x00, 0x40 ; X,Y,Z

      DB SnakeHellID
      DB 0x50, 0x00, 0x10 ; X,Y,Z

      DB SnakeHellID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ThrownBookID
      DB 0x70, 0x00, 0x70 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Tree Monsters Scene
IsoSceneTemplateTreeMonsterBattle:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid ;IsoSceneTemplateBossAntichamber           ; PortalFrontLeft
      DW IsoSceneTemplateD3v1lFinalScene           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0A ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockHellID
      DB 0x10, 0x00, 0x10 ; X,Y,Z

      DB SpikesHellID
      DB 0x10, 0x10, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseHellID
      DB 0x20, 0x00, 0x10 ; X,Y,Z

      DB GreekPilarHellID
      DB 0x20, 0x10, 0x10 ; X,Y,Z

      DB KillingSkullHellID
      DB 0x20, 0x20, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseHellID
      DB 0x60, 0x00, 0x10 ; X,Y,Z

      DB GreekPilarHellID
      DB 0x60, 0x10, 0x10 ; X,Y,Z

      DB KillingSkullHellID
      DB 0x60, 0x20, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockHellID
      DB 0x70, 0x00, 0x10 ; X,Y,Z

      DB SpikesHellID
      DB 0x70, 0x10, 0x10 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x0B ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB TreeMonsterID_0
      DB 0x20, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB TreeMonsterID_1
      DB 0x40, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x60, 0x00, 0x30 ; X,Y,Z

      DB TreeMonsterID_2
      DB 0x60, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB TreeMonsterID_3
      DB 0x30, 0x00, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB TreeMonsterID_4
      DB 0x50, 0x00, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ThrownAxeID
      DB 0x70, 0x00, 0x70 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: EasterEgg
IsoSceneTemplateEasterEgg:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateBossAntichamber           ; PortalFrontRight
      DW NextScenePointerVoid ; IsoSceneTemplateBreather_3 ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x02 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkullID_3
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB EggXID_3
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Boss Antichamber
IsoSceneTemplateBossAntichamber:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateSharksMoat           ; PortalFrontRight
      DW IsoSceneTemplateEasterEgg  ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateTreeMonsterBattle           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x02 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BookID_6
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB InvisibleManID
      DB 0x30, 0x00, 0x30 ; X,Y,Z


; #################################################################################
; Memory Alloc: Scene: WormsCemetry
IsoSceneTemplateWormsCemetry:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateIntoTheDarkForest           ; PortalFrontRight
      DW IsoSceneTemplatePushingDaisiesEast ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TombStoneZID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB AxeID_3
      DB 0x40, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB TombStoneZID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

      DB TombStoneZID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x05 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x10, 0x00, 0x70 ; X,Y,Z

      DB ScorpionID
      DB 0x70, 0x00, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkeletonArmZID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkeletonArmZID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB SkeletonArmZID
      DB 0x50, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: SkullsTable
IsoSceneTemplateSkullsTable:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplatePushingDaisiesEast           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x11 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x10, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x10, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x10, 0x40 ; X,Y,Z

;      DB SpikesID
;      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB SkullID_7
      DB 0x40, 0x20, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x10, 0x50 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x50 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x10, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x30, 0x20, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x20, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x20, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x20, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: PushingDaisiesEast
IsoSceneTemplatePushingDaisiesEast:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateWormsCemetry           ; PortalFrontRight
      DW IsoSceneTemplateSkullsTable ; PortalBackLeft
      DW IsoSceneTemplateFenceHurdles           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x05 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TombStoneXID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TombStoneXID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB TombStoneXID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB TombStoneXID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB TombStoneXID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x07 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x10, 0x00, 0x60 ; X,Y,Z

      DB ScorpionID
      DB 0x60, 0x00, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkeletonArmXID
      DB 0x30, 0x00, 0x20 ; X,Y,Z

      DB SkeletonArmXID
      DB 0x30, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkeletonArmXID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkeletonArmXID
      DB 0x70, 0x00, 0x20 ; X,Y,Z

      DB SkeletonArmXID
      DB 0x70, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: FenceHurdles
IsoSceneTemplateFenceHurdles:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateMushroomFields           ; PortalFrontLeft
      DW IsoSceneTemplatePushingDaisiesEast           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x14 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x00, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x00, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x10, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x10, 0x10, 0x40 ; X,Y,Z

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x20, 0x20, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x30, 0x20, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x20, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB IronFenceZID
      DB 0x00, 0x20, 0x48 ; X,Y,Z

      DB IronFenceZID
      DB 0x10, 0x20, 0x48 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x50, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x70, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x70, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB IronFenceZID
      DB 0x60, 0x20, 0x48 ; X,Y,Z

      DB IronFenceZID
      DB 0x70, 0x20, 0x48 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantZID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB FleshEatingPlantZID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TipToeingOnEggs
IsoSceneTemplateTipToeingOnEggs:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateWallOfTorches          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x03 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB EggStaticXID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB EggStaticXID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB EggStaticXID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x0C ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: WallOfTorches
IsoSceneTemplateWallOfTorches:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplatePinballMachineTop           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateTipToeingOnEggs           ; PortalFrontLeft
      DW NextScenePointerVoid          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x04 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchStaticXID
      DB 0x00, 0x20, 0x50 ; X,Y,Z

      DB WallTorchStaticXID
      DB 0x00, 0x20, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB WallTorchStaticZID
      DB 0x50, 0x20, 0x00 ; X,Y,Z

      DB WallTorchStaticZID
      DB 0x70, 0x20, 0x00 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchXID
      DB 0x00, 0x20, 0x30 ; X,Y,Z

      DB WallTorchZID
      DB 0x30, 0x20, 0x00 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: SharksMoat
IsoSceneTemplateSharksMoat:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateFleshEatingPlantsAndDarts           ; PortalFrontRight
      DW IsoSceneTemplateBossAntichamber ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x01 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID ; Dummy static object that is overridden by a dynamic one -- the engine expects at least one static object.
      DB 0x20, 0x00, 0x20 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SharkID ; This overrides the static object which then disapears from the scene -- a weird workaround indeed.
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB SharkID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB SharkID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: FleshEatingPlantsAndDarts
IsoSceneTemplateFleshEatingPlantsAndDarts:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateFieldOfWormsAndScorpions           ; PortalFrontRight
      DW IsoSceneTemplateSharksMoat ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0D ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x10, 0x20 ; X,Y,Z

      DB KillingSkullID
      DB 0x40, 0x20, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x10, 0x50 ; X,Y,Z

      DB KillingSkullID
      DB 0x40, 0x20, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x00 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x10, 0x00 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x00, 0x70 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x10, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x10, 0x00, 0x10 ; X,Y,Z

      DB BuildingBlockID
      DB 0x10, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x60, 0x00, 0x00 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x0C ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantXID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantXID
      DB 0x40, 0x00, 0x10 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x20, 0x10, 0x10 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x10, 0x10, 0x10 ; X,Y,Z

      DB PoisonDartXID
      DB 0x20, 0x10, 0x60 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x10, 0x10, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x60, 0x10, 0x10 ; X,Y,Z

      DB ShootingFountainZID
      DB 0x60, 0x10, 0x00 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: FieldOfWormsAndScorpions
IsoSceneTemplateFieldOfWormsAndScorpions:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateFleshEatingPlantsAndDarts ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateBreatherToBoss           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x05 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x0C ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WormZID
      DB 0x08, 0x00, 0x08 ; X,Y,Z

      DB WormZID
      DB 0x08, 0x00, 0x70 ; X,Y,Z

      DB WormZID
      DB 0x70, 0x00, 0x08 ; X,Y,Z

      DB WormZID
      DB 0x70, 0x00, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB WormZID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB WormZID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

      DB WormXID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB WormXID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: StairwayToDeath
IsoSceneTemplateStairwayToDeath:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateBreatherToBoss           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0C ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x10, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x10, 0x10, 0x40 ; X,Y,Z

      DB BookID_5
      DB 0x10, 0x30, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x10, 0x00, 0x50 ; X,Y,Z

      DB BuildingBlockID
      DB 0x10, 0x10, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x10, 0x00, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x10, 0x10, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x09 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockCrackedID
      DB 0x10, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockCrackedID
      DB 0x10, 0x00, 0x20 ; X,Y,Z

      DB BuildingBlockCrackedID
      DB 0x10, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantXID
      DB 0x10, 0x28, 0x30 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x10, 0x28, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SnakeID
      DB 0x30, 0x00, 0x10 ; X,Y,Z

      DB SnakeID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB SnakeID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB SnakeID
      DB 0x30, 0x00, 0x68 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: WallFlowers
IsoSceneTemplateWallFlowers:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateBreatherToBoss           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0F ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x40, 0x00, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x10, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x20, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SkullID_2
      DB 0x40, 0x30, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x30, 0x00, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x30, 0x10, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x50, 0x00, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x50, 0x10, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB RoseID
      DB 0x30, 0x00, 0x20 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB RoseID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x06 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantZID
      DB 0x30, 0x20, 0x10 ; X,Y,Z

      DB FleshEatingPlantZID
      DB 0x50, 0x20, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: BreatherToBoss
IsoSceneTemplateBreatherToBoss:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateTurnToBoss           ; PortalFrontRight
      DW IsoSceneTemplateStairwayToDeath ; PortalBackLeft
      DW IsoSceneTemplateFieldOfWormsAndScorpions           ; PortalFrontLeft
      DW IsoSceneTemplateWallFlowers           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x04 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x20, 0x40 ; X,Y,Z

      DB WallTorchStaticXID
      DB 0x50, 0x20, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchZID
      DB 0x40, 0x20, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB InvisibleManID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB InvisibleManID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TurnToBoss
IsoSceneTemplateTurnToBoss:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateBreatherToBoss ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplatePortalToBoss          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0C ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x20, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x10, 0x10 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x20, 0x10 ; X,Y,Z

      DB WallTorchStaticZID
      DB 0x60, 0x20, 0x20 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x05 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchZID
      DB 0x20, 0x20, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SnakeID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB SnakeID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB SnakeID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB SnakeID
      DB 0x60, 0x00, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: PortalToBoss
IsoSceneTemplatePortalToBoss:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateTurnToBoss           ; PortalFrontLeft
      DW IsoSceneTemplateTheFloorIsMovingAndDartsAreRaining          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0C ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB IronFenceZID
      DB 0x10, 0x00, 0x40 ; X,Y,Z

      DB IronFenceZID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x30, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x30, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x20, 0x40 ; X,Y,Z

      DB AxeID_7
      DB 0x40, 0x30, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x50, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB IronFenceZID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

      DB IronFenceZID
      DB 0x70, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x05 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantZID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB JackGoatID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB JackGoatID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB JackGoatID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB JackGoatID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: MoreEggs
IsoSceneTemplateMoreEggs:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateTheFloorIsMovingAndDartsAreRaining ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB EggStaticXID
      DB 0x20, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB EggStaticXID
      DB 0x20, 0x10, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB EggStaticXID
      DB 0x60, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB SkullID_1
      DB 0x60, 0x10, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB EggXID_1
      DB 0x60, 0x10, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TheFloorIsMovingAndDartsAreRaining
IsoSceneTemplateTheFloorIsMovingAndDartsAreRaining:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateMoreEggs           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplatePortalToBoss           ; PortalFrontLeft
      DW IsoSceneTemplateTheRunOfGoats          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x00, 0x00, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x00, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x00, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x00, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x00, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x00, 0x10, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x0A ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x08, 0x20, 0x18 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x20, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x08, 0x20, 0x38 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x08, 0x20, 0x58 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x20, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x00, 0x00, 0x30 ; X,Y,Z

      DB ScorpionID
      DB 0x00, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------
; #################################################################################
; Memory Alloc: Scene: TheRunOfGoats
IsoSceneTemplateTheRunOfGoats:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateTheFloorIsMovingAndDartsAreRaining           ; PortalFrontLeft
      DW IsoSceneTemplateEnterTheGoats          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x07 ; Static sprites counter

; ---------------------------------------------------------------------------------

;      DB GreekPilarBaseID
;      DB 0x20, 0x00, 0x20 ; X,Y,Z

;      DB GreekPilarID
;      DB 0x20, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

;      DB GreekPilarID
;      DB 0x20, 0x10, 0x60 ; X,Y,Z

;      DB GreekPilarID
;      DB 0x20, 0x20, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

;      DB GreekPilarID
;      DB 0x60, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

;      DB GreekPilarID
;      DB 0x60, 0x10, 0x60 ; X,Y,Z

;      DB GreekPilarID
;      DB 0x60, 0x20, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x20, 0x40 ; X,Y,Z

      DB AxeID_6
      DB 0x40, 0x30, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB JackGoatID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB JackGoatID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB JackGoatID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB JackGoatID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: EnterTheGoats
IsoSceneTemplateEnterTheGoats:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateTheRunOfGoats           ; PortalFrontLeft
      DW IsoSceneTemplatePassageAhead          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x01 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB JackGoatID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB JackGoatID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB JackGoatID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB JackGoatID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: PassageAhead
IsoSceneTemplatePassageAhead:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplatePinballMachineTop ; PortalBackLeft
      DW IsoSceneTemplateEnterTheGoats           ; PortalFrontLeft
      DW NextScenePointerVoid          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x04 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB RoseID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PinballMushroomID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: PinballMachineTop
IsoSceneTemplatePinballMachineTop:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplatePassageAhead           ; PortalFrontRight
      DW IsoSceneTemplateWallOfTorches ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplatePinballMachine          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB AxeID_5
      DB 0x40, 0x30, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PinballMushroomID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB PinballMushroomID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB PinballMushroomID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB PinballMushroomID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: PinballMachine
IsoSceneTemplatePinballMachine:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplatePinballMachineTop           ; PortalFrontLeft
      DW IsoSceneTemplateTheStoneTable          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x03 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonMushroomID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB PoisonMushroomID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB PoisonMushroomID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x08 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PinballMushroomID
      DB 0x10, 0x00, 0x20 ; X,Y,Z

      DB PinballMushroomID
      DB 0x30, 0x00, 0x20 ; X,Y,Z

      DB PinballMushroomID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

      DB PinballMushroomID
      DB 0x70, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PinballMushroomID
      DB 0x10, 0x00, 0x60 ; X,Y,Z

      DB PinballMushroomID
      DB 0x30, 0x00, 0x60 ; X,Y,Z

      DB PinballMushroomID
      DB 0x50, 0x00, 0x60 ; X,Y,Z

      DB PinballMushroomID
      DB 0x70, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TheStoneTable
IsoSceneTemplateTheStoneTable:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplatePinballMachine           ; PortalFrontLeft
      DW IsoSceneTemplateSwarmOfBees          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0D ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x10, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x10, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x10, 0x40 ; X,Y,Z

      DB SkullID_5
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x10, 0x50 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x50 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x10, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockCrackedID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: SwarmOfBees
IsoSceneTemplateSwarmOfBees:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateTheStoneTable           ; PortalFrontLeft
      DW IsoSceneTemplateMushroomsAndColumns           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x30 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB AngryBeeID
      DB 0x10, 0x18, 0x60 ; X,Y,Z

      DB AngryBeeID
      DB 0x60, 0x18, 0x10 ; X,Y,Z

      DB AngryBeeID
      DB 0x60, 0x18, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: MushroomsAndColumns
IsoSceneTemplateMushroomsAndColumns:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateSwarmOfBees           ; PortalFrontLeft
      DW IsoSceneTemplateRoseGardenOfWorms           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0B ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x10, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonMushroomID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB PoisonMushroomID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB PoisonMushroomID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SpeedySnailID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB SpeedySnailID
      DB 0x60, 0x00, 0x28 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TheFloorIsMoving
IsoSceneTemplateTheFloorIsMoving:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateRoseGardenOfWorms           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x10, 0x00, 0x10 ; X,Y,Z

      DB SpikesID
      DB 0x10, 0x00, 0x70 ; X,Y,Z

      DB SpikesID
      DB 0x70, 0x00, 0x10 ; X,Y,Z

      DB SpikesID
      DB 0x70, 0x00, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB AxeID_4
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB ScorpionID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB ScorpionID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB ScorpionID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: RoseGardenOfWorms
IsoSceneTemplateRoseGardenOfWorms:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateTheFloorIsMoving ; PortalBackLeft
      DW IsoSceneTemplateMushroomsAndColumns           ; PortalFrontLeft
      DW IsoSceneTemplateCrossFire           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0D ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x20, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x20, 0x20, 0x20 ; X,Y,Z

      DB WallTorchStaticZID
      DB 0x20, 0x20, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x20, 0x20 ; X,Y,Z

      DB WallTorchStaticZID
      DB 0x60, 0x20, 0x30 ; X,Y,Z

      DB WallTorchStaticXID
      DB 0x70, 0x20, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB RoseID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchXID
      DB 0x30, 0x20, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB WormZID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB WormXID
      DB 0x70, 0x00, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: CrossFire
IsoSceneTemplateCrossFire:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateTreasureRoom           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateRoseGardenOfWorms           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TrunkStumpID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB TrunkStumpID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x00, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x00, 0x10, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x08, 0x20, 0x40 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB RotatingSawZID
      DB 0x40, 0x00, 0x10 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TreasureRoom
IsoSceneTemplateTreasureRoom:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateScorpionsNest           ; PortalFrontRight
      DW IsoSceneTemplateCrossFire ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x05 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BookID_4
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockCrackedID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TrunkStumps
IsoSceneTemplateScorpionsNest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateDeepIntoTheDarkForest           ; PortalFrontRight
      DW IsoSceneTemplateTreasureRoom ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateBreather_3           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x05 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TrunkStumpID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB TrunkStumpID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB TrunkStumpID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

;      DB EggStaticXID
;      DB 0x30, 0x00, 0x30 ; X,Y,Z

;      DB EggStaticXID
;      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB SkullID_0
      DB 0x60, 0x00, 0x40 ; X,Y,Z

;      DB EggStaticXID
;      DB 0x50, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x07 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB EggXID_0
      DB 0x60, 0x00, 0x40 ; X,Y,Z

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

      DB ScorpionPlaceholderID
      DB 0x00, 0x00, 0x00 ; X,Y,Z

      DB EggScorpionXID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: GreekColumns
IsoSceneTemplateGreekColumns:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateBreather_3 ; PortalBackLeft
      DW IsoSceneTemplateDeepIntoTheDarkForest           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x10, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB InvisibleManID
      DB 0x40, 0x00, 0x40 ; X,Y,Z


; #################################################################################
; Memory Alloc: Scene: Breather 3
IsoSceneTemplateBreather_3:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateGreekColumns           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateScorpionsNest           ; PortalFrontLeft
      DW IsoSceneTemplateThisCanBeTough           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x01 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB InvisibleManID
      DB 0x30, 0x00, 0x30 ; X,Y,Z


; #################################################################################
; Memory Alloc: Scene: This Can Be Tough
IsoSceneTemplateThisCanBeTough:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateBreather_3           ; PortalFrontLeft
      DW IsoSceneTemplateSharkTank_2           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x10, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB AxeID_1
      DB 0x50, 0x20, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------
; ShootingFountain pedestal

      DB BuildingBlockID
      DB 0x10, 0x00, 0x30 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x20, 0x18, 0x30 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x10, 0x18, 0x30 ; X,Y,Z


; #################################################################################
; Memory Alloc: Scene: Shark Tank 2
IsoSceneTemplateSharkTank_2:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateThisCanBeTough           ; PortalFrontLeft
      DW IsoSceneTemplateFleshEatingCrop           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x10, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x10, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x70, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x70, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB IronFenceZID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

;      DB IronFenceZID
      DB BuildingBlockID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

;      DB IronFenceZID
;      DB 0x40, 0x00, 0x40 ; X,Y,Z

;      DB IronFenceZID
      DB BuildingBlockID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB IronFenceZID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SharkID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB SharkID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Flesh Eating Crop
IsoSceneTemplateFleshEatingCrop:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateSharkTank_2           ; PortalFrontLeft
      DW IsoSceneTemplateToSharkTrap           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x07 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantStaticXID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB FleshEatingPlantStaticXID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB FleshEatingPlantStaticXID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantStaticXID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantStaticXID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB FleshEatingPlantStaticXID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

      DB FleshEatingPlantStaticXID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB RotatingSawXID
      DB 0x00, 0x00, 0x30 ; X,Y,Z

      DB RotatingSawXID
      DB 0x00, 0x00, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: To Shark Trap
IsoSceneTemplateToSharkTrap:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateBreatherBeforeSharkTrap ; PortalBackLeft
      DW IsoSceneTemplateFleshEatingCrop           ; PortalFrontLeft
      DW IsoSceneTemplateSharkTank_1           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x02 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BookID_2
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SpeedySnailID
      DB 0x10, 0x00, 0x10 ; X,Y,Z

      DB SpeedySnailID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Breather 1
IsoSceneTemplateBreatherBeforeSharkTrap:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateToSharkTrap           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateHallOfTorchs           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x01 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB InvisibleManID
      DB 0x30, 0x00, 0x30 ; X,Y,Z



; #################################################################################
; Memory Alloc: Scene: Hollow of torchs
IsoSceneTemplateHallOfTorchs:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateStairwayToSpikes ; PortalBackLeft
      DW IsoSceneTemplateBreatherBeforeSharkTrap           ; PortalFrontLeft
      DW IsoSceneTemplateLeavingTheDarkForest           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0E ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x20, 0x20 ; X,Y,Z

      DB WallTorchStaticZID
      DB 0x60, 0x20, 0x30 ; X,Y,Z

      DB WallTorchStaticXID
      DB 0x70, 0x20, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB BuildingBlockID
      DB 0x20, 0x10, 0x60 ; X,Y,Z

      DB BuildingBlockID
      DB 0x20, 0x20, 0x60 ; X,Y,Z

      DB WallTorchStaticXID
      DB 0x30, 0x20, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x10, 0x60 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x20, 0x60 ; X,Y,Z

      DB WallTorchStaticZID
      DB 0x60, 0x20, 0x70 ; X,Y,Z

      DB WallTorchStaticXID
      DB 0x70, 0x20, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchZID
      DB 0x20, 0x20, 0x70 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Stairway to spikes
IsoSceneTemplateStairwayToSpikes:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateHallOfTorchs           ; PortalFrontRight
      DW IsoSceneTemplateWatchOutForBees ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0A ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x30, 0x10, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x50, 0x28, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x00, 0x20 ; X,Y,Z

      DB PoisonDartXID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Watch out for bees
IsoSceneTemplateWatchOutForBees:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateStairwayToSpikes           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateHoppingFlowers           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB RoseID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x30 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB AngryBeeID
      DB 0x30, 0x18, 0x30 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Hopping flowers
IsoSceneTemplateHoppingFlowers:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateFleshEatingPlantsPortal ; PortalBackLeft
      DW IsoSceneTemplateWatchOutForBees           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x09 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x28, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BookID_1
      DB 0x60, 0x38, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x30, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x60, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB InvisibleManID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Leaving The Dark Forest
IsoSceneTemplateLeavingTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid
      DW NextScenePointerVoid  ; PortalBackLeft
      DW IsoSceneTemplateHallOfTorchs           ; PortalFrontLeft
      DW IsoSceneTemplateLockedExitFromTheDarkForest           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x05 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB TreeMonsterZ2ID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterX2ID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Book In The Dark Forest
IsoSceneTemplateLockedExitFromTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid
      DW NextScenePointerVoid  ; PortalBackLeft
      DW IsoSceneTemplateLeavingTheDarkForest           ; PortalFrontLeft
      DW IsoSceneTemplateExitFromTheDarkForest           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x04 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x20, 0x40 ; X,Y,Z

      DB WallTorchStaticXID
      DB 0x50, 0x20, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchZID
      DB 0x40, 0x20, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Book In The Dark Forest
IsoSceneTemplateExitFromTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid
      DW NextScenePointerVoid  ; PortalBackLeft
      DW IsoSceneTemplateLockedExitFromTheDarkForest           ; PortalFrontLeft
      DW IsoSceneTemplateBookOfTheDarkForest           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB GreekPilarID
      DB 0x20, 0x10, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x10, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB GreekPilarID
      DB 0x60, 0x10, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SpeedySnailID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Book In The Dark Forest
IsoSceneTemplateBookOfTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid
      DW IsoSceneTemplateTreeMonstersInTheDarkForest  ; PortalBackLeft
      DW IsoSceneTemplateExitFromTheDarkForest           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x07 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BookID_3
      DB 0x40, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB RoseID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB RoseID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB RoseID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x28, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x28 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: TreeMonsters In The Dark Forest
IsoSceneTemplateTreeMonstersInTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateBookOfTheDarkForest
      DW IsoSceneTemplateCanOfWormsInTheDarkForest  ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x07 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TreeMonsterZ2ID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB TreeMonsterX2ID
      DB 0x50, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x08, 0x00, 0x70 ; X,Y,Z

      DB SpikesID
      DB 0x70, 0x00, 0x70 ; X,Y,Z

      DB SpikesID
      DB 0x70, 0x00, 0x08 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x07 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantXID
      DB 0x10, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterID_1
      DB 0x20, 0x00, 0x10 ; X,Y,Z

      DB PoisonDartZID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterID_1
      DB 0x40, 0x00, 0x10 ; X,Y,Z

      DB PoisonDartZID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterID_1
      DB 0x60, 0x00, 0x10 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Can Of Worms In The Dark Forest
IsoSceneTemplateCanOfWormsInTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateTreeMonstersInTheDarkForest
      DW IsoSceneTemplateDeepIntoTheDarkForest  ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0A ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TreeMonsterX1ID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterZ2ID
      DB 0x38, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterX2ID
      DB 0x48, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterZ2ID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x70, 0x00, 0x70 ; X,Y,Z

      DB SpikesID
      DB 0x70, 0x00, 0x10 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB AxeID_2
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WormZID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB WormXID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB WormZID
      DB 0x20, 0x00, 0x70 ; X,Y,Z

      DB WormZID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Deep Into The Dark Forest
IsoSceneTemplateDeepIntoTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateCanOfWormsInTheDarkForest
      DW NextScenePointerVoid  ; PortalBackLeft
      DW IsoSceneTemplateIntoTheDarkForest           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x07 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TreeMonsterX2ID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB TreeMonsterZ2ID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x70, 0x00, 0x70 ; X,Y,Z

      DB TreeMonsterX2ID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x10, 0x00, 0x50 ; X,Y,Z

      DB TreeMonsterZ2ID
      DB 0x10, 0x00, 0x20 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB ScorpionID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB ScorpionID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Into The Dark Forest
IsoSceneTemplateIntoTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid
      DW IsoSceneTemplateWormsCemetry  ; PortalBackLeft
      DW IsoSceneTemplateEnterTheDarkForest           ; PortalFrontLeft
      DW IsoSceneTemplateDeepIntoTheDarkForest           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x04 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TreeMonsterZ1ID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB TreeMonsterID_1
      DB 0x40, 0x00, 0x20 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Enter The Dark Forest
IsoSceneTemplateEnterTheDarkForest:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid
      DW NextScenePointerVoid  ; PortalBackLeft
      DW IsoSceneTemplateFleshEatingPlantsPortal           ; PortalFrontLeft
      DW IsoSceneTemplateIntoTheDarkForest          ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TreeMonsterZ1ID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterX2ID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB TreeMonsterZ2ID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB TreeMonsterX1ID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB TreeMonsterZ1ID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SnakeID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB SnakeID
      DB 0x10, 0x00, 0x30 ; X,Y,Z

      DB SnakeID
      DB 0x60, 0x00, 0x30 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Flesh eating plants with portal gate
IsoSceneTemplateFleshEatingPlantsPortal:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateHoppingFlowers
      DW IsoSceneTemplateSawOffYourFeet ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateEnterTheDarkForest           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0C ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x40, 0x20, 0x40 ; X,Y,Z

      DB WallTorchStaticZID
      DB 0x40, 0x20, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x10, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x10, 0x60 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB WallTorchXID
      DB 0x50, 0x20, 0x40 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

      DB FleshEatingPlantXID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Shark Tank 1
IsoSceneTemplateSharkTank_1:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateTipToeing           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x01 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SharkID
      DB 0x00, 0x00, 0x20 ; X,Y,Z

      DB SharkID
      DB 0x50, 0x00, 0x50 ; X,Y,Z


; #################################################################################
; Memory Alloc: Scene: Tip Toeing
IsoSceneTemplateTipToeing:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateSharkTank_1           ; PortalFrontLeft
      DW IsoSceneTemplateInYourFace           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0C ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x70, 0x00, 0x30 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x00, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x10, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB RotatingSawXID
      DB 0x00, 0x00, 0x20 ; X,Y,Z

      DB RotatingSawXID
      DB 0x00, 0x00, 0x40 ; X,Y,Z

      DB RotatingSawXID
      DB 0x00, 0x00, 0x60 ; X,Y,Z


; #################################################################################
; Memory Alloc: Scene: In Your Face
IsoSceneTemplateInYourFace:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateBreatherBeforeInYourFace           ; PortalFrontRight
      DW NextScenePointerVoid ; PortalBackLeft
      DW IsoSceneTemplateTipToeing           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x06 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x60, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x06 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartXID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x00, 0x40 ; X,Y,Z

      DB PoisonDartXID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x00, 0x60 ; X,Y,Z

      DB PoisonDartXID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x00, 0x00, 0x20 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Breather One
IsoSceneTemplateBreatherBeforeInYourFace:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckDisabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid           ; PortalFrontRight
      DW IsoSceneTemplateInYourFace ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW IsoSceneTemplateFleshEatingPlantGarden           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x02 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB AxeID_0
      DB 0x40, 0x10, 0x40 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB RotatingSawZID
      DB 0x20, 0x00, 0x00 ; X,Y,Z

      DB RotatingSawZID
      DB 0x60, 0x00, 0x00 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Saw Off Your Feet
IsoSceneTemplateSawOffYourFeet:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateFleshEatingPlantsPortal           ; PortalFrontRight
      DW IsoSceneTemplateMushroomFields ; PortalBackLeft
      DW NextScenePointerVoid           ; PortalFrontLeft
      DW NextScenePointerVoid           ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x0E ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x20, 0x00, 0x10 ; X,Y,Z

      DB TrunkStumpID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB TrunkStumpID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x00, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x40, 0x00, 0x10 ; X,Y,Z

      DB TrunkStumpID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB KillingSkullID
      DB 0x40, 0x10, 0x20 ; X,Y,Z

      DB TrunkStumpID
      DB 0x40, 0x00, 0x60 ; X,Y,Z

      DB KillingSkullID
      DB 0x40, 0x10, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x40, 0x00, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x60, 0x00, 0x10 ; X,Y,Z

      DB TrunkStumpID
      DB 0x60, 0x00, 0x20 ; X,Y,Z

      DB TrunkStumpID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x60, 0x00, 0x70 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB RotatingSawZID
      DB 0x30, 0x00, 0x00 ; X,Y,Z

      DB RotatingSawZID
      DB 0x50, 0x00, 0x00 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Mushroom Fields
IsoSceneTemplateMushroomFields:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateSawOffYourFeet ; PortalFrontRight
      DW IsoSceneTemplateSpittingDarts    ; PortalBackLeft
      DW NextScenePointerVoid              ; PortalFrontLeft
      DW IsoSceneTemplateFenceHurdles              ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x07 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB GreekPilarBaseID
      DB 0x40, 0x00, 0x40 ; X,Y,Z

      DB GreekPilarID
      DB 0x40, 0x10, 0x40 ; X,Y,Z

      DB SkullID_4
      DB 0x40, 0x20, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonMushroomID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB PoisonMushroomID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB PoisonMushroomID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB PoisonMushroomID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x02 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SpeedySnailID
      DB 0x10, 0x00, 0x10 ; X,Y,Z

      DB SpeedySnailID
      DB 0x60, 0x00, 0x60 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Drizzling Darts
IsoSceneTemplateSpittingDarts:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateMushroomFields       ; PortalFrontRight
      DW IsoSceneTemplatePushingDaisies       ; PortalBackLeft
      DW NextScenePointerVoid      ; PortalFrontLeft
      DW NextScenePointerVoid       ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x09 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB SpikesID
      DB 0x30, 0x00, 0x10 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x00, 0x20 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x60 ; X,Y,Z

      DB SpikesID
      DB 0x50, 0x00, 0x70 ; X,Y,Z

; =================================================================================
; Dynamic sprites

   DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB PoisonDartZID
      DB 0x40, 0x00, 0x20 ; X,Y,Z

      DB ShootingFountainZID
      DB 0x40, 0x00, 0x00 ; X,Y,Z

      DB PoisonDartZID
      DB 0x18, 0x00, 0x20 ; X,Y,Z

      DB ShootingFountainZID
      DB 0x18, 0x00, 0x00 ; X,Y,Z

      DB PoisonDartXID
      DB 0x20, 0x00, 0x70 ; X,Y,Z

      DB ShootingFountainXID
      DB 0x05, 0x00, 0x70 ; X,Y,Z

; #################################################################################
; Memory Alloc: Scene: Pushing Daisies
IsoSceneTemplatePushingDaisies:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplateSpittingDarts       ; PortalFrontRight
      DW IsoSceneTemplateCemetryEntry       ; PortalBackLeft
      DW NextScenePointerVoid      ; PortalFrontLeft
      DW NextScenePointerVoid       ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TombStoneZID
      DB 0x30, 0x00, 0x10 ; X,Y,Z

      DB TombStoneZID
      DB 0x30, 0x00, 0x30 ; X,Y,Z

      DB TombStoneZID
      DB 0x30, 0x00, 0x50 ; X,Y,Z

      DB TombStoneZID
      DB 0x30, 0x00, 0x70 ; X,Y,Z

      DB TombStoneZID
      DB 0x50, 0x00, 0x10 ; X,Y,Z

      DB TombStoneZID
      DB 0x50, 0x00, 0x30 ; X,Y,Z

      DB TombStoneZID
      DB 0x50, 0x00, 0x50 ; X,Y,Z

      DB TombStoneZID
      DB 0x50, 0x00, 0x70 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x04 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SkeletonArmZID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB SkeletonArmZID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

      DB SkeletonArmZID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

      DB SkeletonArmZID
      DB 0x50, 0x00, 0x60 ; X,Y,Z

; ---------------------------------------------------------------------------------

; #################################################################################
; Memory Alloc: Cemetry Entry scene template
IsoSceneTemplateCemetryEntry:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW IsoSceneTemplatePushingDaisies       ; PortalFrontRight
      DW NextScenePointerVoid       ; PortalBackLeft
      DW IsoSceneTemplateFleshEatingPlantGarden      ; PortalFrontLeft
      DW NextScenePointerVoid       ; PortalBackRight

; =================================================================================
; Static sprites

      DB 0x08 ; Static sprites counter

; ---------------------------------------------------------------------------------

      DB TrunkStumpID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarBaseID
      DB 0x50, 0x00, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x50, 0x10, 0x20 ; X,Y,Z

      DB GreekPilarID
      DB 0x50, 0x20, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BookID_0
      DB 0x50, 0x30, 0x20 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB TombStoneXID
      DB 0x10, 0x00, 0x30 ; X,Y,Z

      DB TombStoneZID
      DB 0x20, 0x00, 0x50 ; X,Y,Z

      DB TombStoneZID
      DB 0x30, 0x00, 0x10 ; X,Y,Z

; =================================================================================
; Dynamic sprites

      DB 0x03 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------

      DB SkeletonArmZID
      DB 0x20, 0x00, 0x30 ; X,Y,Z

      DB SkeletonArmXID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB SkeletonArmXID
      DB 0x30, 0x00, 0x20 ; X,Y,Z

; #################################################################################
; Memory Alloc: FleshEating Plant Garden scene template -- the first finished scene :)
IsoSceneTemplateFleshEatingPlantGarden:

; ---------------------------------------------------------------------------------
; Stencil check switch state

      DB StencilCheckEnabled

; ---------------------------------------------------------------------------------
; Scene Portals

      DW NextScenePointerVoid  ; PortalFrontRight
      DW NextScenePointerVoid  ; PortalBackLeft
      DW IsoSceneTemplateBreatherBeforeInYourFace  ; PortalFrontLeft
      DW IsoSceneTemplateCemetryEntry ; PortalBackRight

; =================================================================================
; Static Sprites Definition

      DB 0x0B ; Static sprites counter

; ---------------------------------------------------------------------------------
; Static sprites

      DB SkullID_6
      DB 0x70, 0x00, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB BuildingBlockID
      DB 0x20, 0x00, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x20, 0x10, 0x20 ; X,Y,Z

      DB BuildingBlockID
      DB 0x20, 0x00, 0x40 ; X,Y,Z

      DB BuildingBlockID
      DB 0x30, 0x00, 0x40 ; X,Y,Z

      DB SpikesID
      DB 0x20, 0x10, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB IronFenceXID
      DB 0x20, 0x00, 0x60 ; X,Y,Z

      DB IronFenceXID
      DB 0x20, 0x00, 0x70 ; X,Y,Z

; ---------------------------------------------------------------------------------

      DB FleshEatingPlantStaticXID
      DB 0x50, 0x00, 0x60 ; X,Y,Z

      DB FleshEatingPlantStaticXID
      DB 0x50, 0x00, 0x50; X,Y,Z

      DB FleshEatingPlantStaticXID
      DB 0x50, 0x00, 0x40 ; X,Y,Z

; ---------------------------------------------------------------------------------

; =================================================================================
; Dynamic Sprites Definition

      DB 0x01 ; Dynamic sprites counter

; ---------------------------------------------------------------------------------
; Dynamic sprites

      DB InvisibleManID
      DB 0x60, 0x00, 0x40 ; X,Y,Z

