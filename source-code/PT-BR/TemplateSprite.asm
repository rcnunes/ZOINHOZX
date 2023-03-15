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
; INCLUDE - TemplateSprite
; =================================================================================

; -------------------------------------------------------------
; Offset values to sprite template attributes

ATTR_SpriteTemplateRoot           EQU 0x0000

ATTR_SpriteTemplateDimCol         EQU 0x0000
ATTR_SpriteTemplateDimLin         EQU 0x0001
ATTR_SpriteTemplateNrSteps        EQU 0x0002
ATTR_SpriteTemplateVerticalFlip   EQU 0x0003
ATTR_SpriteTemplateColorAttrIndex EQU 0x0004
ATTR_SpriteTemplatePosColOffset   EQU 0x0005
ATTR_SpriteTemplatePosLinOffset   EQU 0x0006
ATTR_SpriteTemplateData           EQU 0x0007

; #################################################################################
; FULLY INSTANCIABLE SPRITE TEMPLATES
; #################################################################################

; =================================================================================
; Memory Alloc: Zoinho (Sprite Template)
ZoinhoSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x20
      ; Number of steps
      DB 0x03
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightYellow
      ; Sprite position offset
      DB 0xF8, 0x04
      ; Sprite's pixel data
      DW ZoinhoSpriteData

; =================================================================================
; Memory Alloc: TombStoneX (Sprite Template)
TombStoneXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightCyan
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW TombStoneXSpriteData

; =================================================================================
; Memory Alloc: TombStoneZ (Sprite Template)
TombStoneZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightCyan
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW TombStoneXSpriteData

; =================================================================================
; Memory Alloc: ZoinhoDead (Sprite Template)
ZoinhoDeadSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x20
      ; Number of steps
      DB 0x04
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x00
      ; Sprite's pixel data
      DW SkeletonCollapseSpriteData

; =================================================================================
; Memory Alloc: FleshEatingPlant (Sprite Template)
FleshEatingPlantSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW FleshEatingPlantSpriteData

; =================================================================================
; Memory Alloc: FleshEatingPlantZ (Sprite Template)
FleshEatingPlantZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW FleshEatingPlantSpriteData

; =================================================================================
; Memory Alloc: FleshEatingPlantDyn (Sprite Template)
FleshEatingPlantDynSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW FleshEatingPlantXF1

; =================================================================================
; Memory Alloc: FleshEatingPlantDyn Z (Sprite Template)
FleshEatingPlantDynZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW FleshEatingPlantXF1

; =================================================================================
; Memory Alloc: WoodenGate (Sprite Template)
WoodenGateXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW WoodenGateSpriteDataXF

; =================================================================================
; Memory Alloc: WoodenGate (Sprite Template)
WoodenGateZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW WoodenGateSpriteDataXF

; =================================================================================
; Memory Alloc: GardenBuildingBlock (Sprite Template)
GardenBuildingBlockSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 4 bytes wide and 32 lines high
      DB 0x03, 0x20
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x00
      ; Sprite's pixel data
      DW GardenBuildingBlockSpriteData

; =================================================================================
; Memory Alloc: HellBuildingBlock (Sprite Template)
HellBuildingBlockSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 4 bytes wide and 32 lines high
      DB 0x03, 0x20
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0xF8, 0x00
      ; Sprite's pixel data
      DW GardenBuildingBlockSpriteData

; =================================================================================
; Memory Alloc: IronFence (Sprite Template)
IronFenceXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0x00, 0x00
      ; Sprite's pixel data
      DW IronFenceXSpriteData

; =================================================================================
; Memory Alloc: IronFence (Sprite Template)
IronFenceZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0x00, 0x00
      ; Sprite's pixel data
      DW IronFenceXSpriteData

; =================================================================================
; Memory Alloc: Mushroom (Sprite Template)
;MushroomSpriteTemplate:
PinballMushroomSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightCyan
      ; Sprite position offset
      DB 0xF8, 0x04
      ; Sprite's pixel data
      DW MushroomSpriteData

; =================================================================================
; Memory Alloc: Poison Mushroom (Sprite Template)
PoisonMushroomSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0xF8, 0x04
      ; Sprite's pixel data
      DW MushroomSpriteData

; =================================================================================
; Memory Alloc: SpeedySnail (Sprite Template)
SpeedySnailSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0xF4, 0x10
      ; Sprite's pixel data
      DW SpeedySnailSpriteData

; =================================================================================
; Memory Alloc: Shark (Sprite Template)
SharkSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkCyan
      ; Sprite position offset
      DB 0xF8, 0x10
      ; Sprite's pixel data
      DW SharkSpriteData

; =================================================================================
; Memory Alloc: InvisibleMan (Sprite Template)
InvisibleManSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 16 lines high
      DB 0x03, 0x10
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF4, 0x18
      ; Sprite's pixel data
      DW InvisibleManSpriteData

; =================================================================================
; Memory Alloc: ShootingFountainX (Sprite Template)
ShootingFountainXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x20
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0xF8, 0x04
      ; Sprite's pixel data
      DW ShootingFountainXSpriteData

; =================================================================================
; Memory Alloc: ShootingFountainZ (Sprite Template)
ShootingFountainZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 32 lines high
      DB 0x03, 0x20
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
;      DB 0xF4, 0x04
      DB 0xF8, 0x04
      ; Sprite's pixel data
      DW ShootingFountainXSpriteData

; =================================================================================
; Memory Alloc: SkeletonArm X (Sprite Template)
SkeletonArmXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x04
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      ;DW SkeletonArmSpriteData
      DW SkeletonArmSpriteData

; =================================================================================
; Memory Alloc: SkeletonArm Z (Sprite Template)
SkeletonArmZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x04
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      ;DW SkeletonArmSpriteData
      DW SkeletonArmSpriteData

; =================================================================================
; Memory Alloc: SkeletonArm X (Sprite Template)
HellSkeletonArmXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x04
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      ;DW SkeletonArmSpriteData
      DW SkeletonArmSpriteData

; =================================================================================
; Memory Alloc: SkeletonArm Z (Sprite Template)
HellSkeletonArmZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x04
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      ;DW SkeletonArmSpriteData
      DW SkeletonArmSpriteData

; =================================================================================
; Memory Alloc: PoisonDartX (Sprite Template)
PoisonDartXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
;      DB 0x00, 0x0C
      DB 0x00, 0x0F
      ; Sprite's pixel data
      DW PoisonDartXSpriteData

; =================================================================================
; Memory Alloc: PoisonDartZ (Sprite Template)
PoisonDartZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
;      DB 0xF8, 0x0C
      DB 0xF8, 0x0F
      ; Sprite's pixel data
      DW PoisonDartXSpriteData

; =================================================================================
; Memory Alloc: Tree Monster Poison Dart (Sprite Template)
TreeMonsterPoisonDartSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW PoisonDartXSpriteData

; =================================================================================
; Memory Alloc: Rose (Sprite Template)
RoseSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW RoseSpriteData

; =================================================================================
; Memory Alloc: Book (Sprite Template)
BookSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteRainbow
      ; Sprite position offset
      DB 0x00, 0x09
      ; Sprite's pixel data
      DW BookSpriteData

; =================================================================================
; Memory Alloc: ThrownBook (Sprite Template)
ThrownBookSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x01
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0x00, 0x00
      ; Sprite's pixel data
      DW ThrownBookSpriteData

; =================================================================================
; Memory Alloc: Skull (Sprite Template)
SkullSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteRainbow
      ; Sprite position offset
      DB 0xFC, 0x08
      ; Sprite's pixel data
      DW SkullSpriteData

; =================================================================================
; Memory Alloc: Killing Skull (Sprite Template)
KillingSkullSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xFC, 0x08
      ; Sprite's pixel data
      DW SkullSpriteData

; =================================================================================
; Memory Alloc: Killing D3v1l Skull (Sprite Template)
KillingD3v1lSkullSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0xFC, 0x08
      ; Sprite's pixel data
      DW SkullSpriteData

; =================================================================================
; Memory Alloc: Axe (Sprite Template)
AxeSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteRainbow
      ; Sprite position offset
      ;DB 0xF8, 0x08
      DB 0x00, 0x08
      ; Sprite's pixel data
      DW AxeSpriteData

; =================================================================================
; Memory Alloc: Axe Throw (Sprite Template)
AxeThrowSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Number of steps
;      DB 0x04
      DB 0x04
      ; Sprite vertical flip
      DB 0x00 ;SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkCyan
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW AxeSpriteData

; =================================================================================
; Memory Alloc: Spikes (Sprite Template)
SpikesSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xFC, 0x04
      ; Sprite's pixel data
      DW SpikesSpriteData

; =================================================================================
; Memory Alloc: Hell Spikes (Sprite Template)
HellSpikesSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0xFC, 0x04
      ; Sprite's pixel data
      DW SpikesSpriteData

; =================================================================================
; Memory Alloc: RotatingSaw (Z axis) (Sprite Template)
RotatingSawZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 16 lines high
      DB 0x03, 0x10
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW RotatingSawSpriteData

; =================================================================================
; Memory Alloc: RotatingSaw (X axis) (Sprite Template)
RotatingSawXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 16 lines high
      DB 0x03, 0x10
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0xF0, 0x08
      ; Sprite's pixel data
      DW RotatingSawSpriteData

; =================================================================================
; Memory Alloc: Background IronFence (Sprite Template)
BackgroundIronFenceXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF0, 0x08
      ; Sprite's pixel data
      DW IronFenceXSpriteDataUnmasked

; =================================================================================
; Memory Alloc: Background IronFence (Sprite Template)
BackgroundIronFenceZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW IronFenceXSpriteDataUnmasked

; =================================================================================
; Memory Alloc: Background IronFence (Sprite Template)
BackgroundWallThornsXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite position offset
      DB 0xF0, 0x08
      ; Sprite's pixel data
      DW WallThornsSpriteDataUnmasked

; =================================================================================
; Memory Alloc: Background IronFence (Sprite Template)
BackgroundWallThornsZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkGreen
      ; Sprite position offset
      DB 0x00, 0x08
      ; Sprite's pixel data
      DW WallThornsSpriteDataUnmasked

; =================================================================================
; Memory Alloc: Hell Background IronFence (Sprite Template)
HellBackgroundWallThornsXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0xF0, 0x08
      ; Sprite's pixel data
      DW WallThornsSpriteDataUnmasked

; =================================================================================
; Memory Alloc: Hell Background IronFence (Sprite Template)
HellBackgroundWallThornsZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0x00, 0x08
      ; Sprite's pixel data
      DW WallThornsSpriteDataUnmasked

; =================================================================================
; Memory Alloc: TrunkStump (Sprite Template)
TrunkStumpSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW TrunkStumpSpriteData

; =================================================================================
; Memory Alloc: GatePilarBase (Sprite Template)
GatePilarSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW GatePilarSpriteData

; =================================================================================
; Memory Alloc: GreekPilarBase (Sprite Template)
GreekPilarBaseSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW GreekPilarBaseSpriteData

; =================================================================================
; Memory Alloc: GreekPilar (Sprite Template)
GreekPilarSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW GreekPilarSpriteData

; =================================================================================
; Memory Alloc: GreekPilarBaseHell (Sprite Template)
GreekPilarBaseHellSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW GreekPilarBaseSpriteData

; =================================================================================
; Memory Alloc: GreekPilarHell (Sprite Template)
GreekPilarHellSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkMagenta
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW GreekPilarSpriteData

; =================================================================================
; Memory Alloc: Wall Torch (Sprite Template)
WallTorchSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x00
      ; Sprite's pixel data
      DW WallTorchSpriteData

; =================================================================================
; Memory Alloc: Wall Torch - Z (Sprite Template)
WallTorchZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x00
      ; Sprite's pixel data
      DW WallTorchSpriteData

; =================================================================================
; Memory Alloc: Angry Bee (Sprite Template)
AngryBeeSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkYellow
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      DW AngryBeeSpriteData

; =================================================================================
; Memory Alloc: Tree Monster Forrest "Z1" (Sprite Template)
TreeMonsterForrestZ1SpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW TreeMonsterSpriteData

; =================================================================================
; Memory Alloc: Tree Monster Forrest "X1" (Sprite Template)
TreeMonsterForrestX1SpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW TreeMonsterSpriteData

; =================================================================================
; Memory Alloc: Tree Monster Forrest "Z2" (Sprite Template)
TreeMonsterForrestZ2SpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW TreeMonsterDeadSpriteDataX1

; =================================================================================
; Memory Alloc: Tree Monster Forrest "X2" (Sprite Template)
TreeMonsterForrestX2SpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW TreeMonsterDeadSpriteDataX1

; =================================================================================
; Memory Alloc: Forest Tree Monster (Sprite Template)
ForestTreeMonsterSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x00
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW TreeMonsterSpriteData

; =================================================================================
; Memory Alloc: Tree Monster (Sprite Template)
TreeMonsterSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW TreeMonsterSpriteData

; =================================================================================
; Memory Alloc: Tree Monster Dead (Sprite Template)
TreeMonsterDeadSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x03
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW TreeMonsterDeadSpriteData

; =================================================================================
; Memory Alloc: D3v1l (Sprite Template)
D3v1lSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW D3v1lSpriteData

; =================================================================================
; Memory Alloc: D3v1l Kill (Sprite Template)
D3v1lKillSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x28
      ; Number of steps
      DB 0x03
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteRainbow
      ; Sprite position offset
      DB 0xF8, 0xFA
      ; Sprite's pixel data
      DW D3v1lKillSpriteData

; =================================================================================
; Memory Alloc: D3v1l (Sprite Template)
SnakeHellSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 24 lines high
      DB 0x02, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite position offset
      DB 0x00, 0x08
      ; Sprite's pixel data
      DW SnakeSpriteData

; =================================================================================
; Memory Alloc: Forest D3v1l (Sprite Template)
ForestSnakeSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 24 lines high
      DB 0x02, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0x00, 0x08
      ; Sprite's pixel data
      DW SnakeSpriteData

; =================================================================================
; Memory Alloc: Scorpion (Sprite Template)
ScorpionSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 24 lines high
      DB 0x03, 0x10
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite position offset
      DB 0xF8, 0x10
      ; Sprite's pixel data
      DW ScorpionSpriteData

; =================================================================================
; Memory Alloc: Worm X (Sprite Template)
WormXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x04
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      ;DW SkeletonArmSpriteData
      DW WormSpriteData

; =================================================================================
; Memory Alloc: Worm Z (Sprite Template)
WormZSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x04
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite position offset
      DB 0xF8, 0x08
      ; Sprite's pixel data
      ;DW SkeletonArmSpriteData
      DW WormSpriteData

; =================================================================================
; Memory Alloc: Egg X (Sprite Template)
EggXSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 16 lines high
      DB 0x03, 0x10
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipFalse
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x10
      ; Sprite's pixel data
      ;DW SkeletonArmSpriteData
      DW EggSpriteData

; =================================================================================
; Memory Alloc: JackGoat (Sprite Template)
JackGoatSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 24 lines high
      DB 0x03, 0x18
      ; Number of steps
      DB 0x02
      ; Sprite vertical flip
      DB 0x00
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite position offset
      DB 0xF8, 0x10
      ; Sprite's pixel data
      DW JackGoatSpriteData

; #################################################################################
; SIMPLE SPRITE TEMPLATES
; #################################################################################

; -------------------------------------------------------------
; Offset values to sprite template attributes

ATTR_SimpleSpriteTemplateRoot           EQU 0x0000

ATTR_SimpleSpriteTemplateDimCol         EQU 0x0000
ATTR_SimpleSpriteTemplateDimLin         EQU 0x0001
ATTR_SimpleSpriteTemplateColorAttrIndex EQU 0x0002
ATTR_SimpleSpriteTemplateDefaultDir     EQU 0x0003
ATTR_SimpleSpriteTemplateData           EQU 0x0004

; =================================================================================
; Memory Alloc: BasicFrameElement (Sprite Template)
BasicFrameElementSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkGreen
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW BasicFrameElementSpriteData

; =================================================================================
; Memory Alloc: FishBoneFrameElement (Sprite Template)
FishBoneFrameElementSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FishBoneFrameElementSpriteData

; =================================================================================
; Memory Alloc: SkullFrameElement (Sprite Template)
SkullFrameElementSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW SkullFrameElementSpriteData

; =================================================================================
; Memory Alloc: OutterFrameElement (Sprite Template)
OutterFrameElementSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW OutterFrameElementSpriteData

; =================================================================================
; Memory Alloc: BasicFrameElement (Sprite Template)
BasicFrameElementZSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkGreen
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW BasicFrameElementSpriteData

; =================================================================================
; Memory Alloc: FishBoneFrameElement (Sprite Template)
FishBoneFrameElementZSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FishBoneFrameElementSpriteData

; =================================================================================
; Memory Alloc: SkullFrameElement (Sprite Template)
SkullFrameElementZSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW SkullFrameElementSpriteData

; =================================================================================
; Memory Alloc: OutterFrameElement (Sprite Template)
OutterFrameElementZSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x02, 0x20
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightGreen
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW OutterFrameElementSpriteData

; =================================================================================
; Memory Alloc: Bright Highlight (Sprite Template)
BrightHighlightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x01, 0x01
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW 0x0000 ; No sprite data

; =================================================================================
; Memory Alloc: Dark Highlight (Sprite Template)
DarkHighlightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x01, 0x01
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW 0x0000 ; No sprite data

; #################################################################################
; FRAME SCORE BOARD - SIMPLE SPRITE TEMPLATES
; #################################################################################

; =================================================================================
; Memory Alloc: Rose (Sprite Template)
FrameSkullSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FrameSkullSpriteData

; =================================================================================
; Memory Alloc: Mushroom (Sprite Template)
FrameBookSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightMagenta
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      ;DW FrameMushroomSpriteData
      DW FrameBookSpriteData

; =================================================================================
; Memory Alloc: Skull (Sprite Template)
FrameSkullMenuSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 3 bytes wide and 40 lines high
      DB 0x02, 0x10
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW SkullSpriteDataUnmasked

; =================================================================================
; Memory Alloc: Heart (Sprite Template)
FrameHeartSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightRed
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FrameHeartSpriteData

; =================================================================================
; Memory Alloc: Heart Broken (Sprite Template)
FrameHeartBrokenSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x0F
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FrameHeartBrokenSpriteData
      ;DW FrameHeartBrokenSpriteData

; =================================================================================
; Memory Alloc: Axe (Sprite Template)
FrameAxeSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB ColourPaletteDarkWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FrameAxeSpriteData

; #################################################################################
; FRAME SCORE BOARD - PIPE FRAME - SIMPLE SPRITE TEMPLATES
; #################################################################################

; =================================================================================
; Label: Pipe Color

FramePipeColor EQU ColourPaletteDarkCyan

; =================================================================================
; Memory Alloc: Pipe Corner Top (Sprite Template)
FramePipeElbowTopLeftSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeElbowTopSpriteData

; =================================================================================
; Memory Alloc: Pipe Corner Top Right (Sprite Template)
FramePipeElbowTopRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeElbowTopSpriteData

; =================================================================================
; Memory Alloc: Pipe Corner Right (Sprite Template)
FramePipeElbowRightLeftSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeElbowRightSpriteData

; =================================================================================
; Memory Alloc: Pipe Corner Right Right (Sprite Template)
FramePipeElbowRightRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 16 lines high
      DB 0x02, 0x10
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeElbowRightSpriteData

; =================================================================================
; Memory Alloc: Pipe Bottom Left (Sprite Template)
FramePipeBottomLeftSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeBottomLeftSpriteData

; =================================================================================
; Memory Alloc: Pipe Bottom Right (Sprite Template)
FramePipeBottomRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeBottomLeftSpriteData

; =================================================================================
; Memory Alloc: Pipe Vertical (Sprite Template)
FramePipeVerticalSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeVerticalSpriteData

; =================================================================================
; Memory Alloc: Pipe Vertical Right(Sprite Template)
FramePipeVerticalRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeVerticalSpriteData

; =================================================================================
; Memory Alloc: Pipe Horizontal (Sprite Template)
FramePipeHorizontalSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeHorizontalSpriteData

; =================================================================================
; Memory Alloc: Pipe Diagonal (Sprite Template)
FramePipeDiagonalSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeDiagonalSpriteData

; =================================================================================
; Memory Alloc: Pipe Diagonal Right (Sprite Template)
FramePipeDiagonalRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeDiagonalSpriteData

; =================================================================================
; Memory Alloc: Pipe Diagonal (Sprite Template)
FramePipeDiagonalHighlightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeDiagonalHighlightSpriteData

; =================================================================================
; Memory Alloc: Pipe Diagonal Right (Sprite Template)
FramePipeDiagonalHighlightRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeDiagonalHighlightSpriteData

; =================================================================================
; Memory Alloc: Pipe Diagonal (Sprite Template)
FramePipeDiagonalCrackedSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeDiagonalCrackedSpriteData

; =================================================================================
; Memory Alloc: Pipe Diagonal Right (Sprite Template)
FramePipeDiagonalCrackedRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeDiagonalCrackedSpriteData

; =================================================================================
; Memory Alloc: Pipe Horizontal Tip Left (Sprite Template)
FramePipeHorizontalTipLeftSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeHorizontalTipSpriteData

; =================================================================================
; Memory Alloc: Pipe Horizontal Tip Right (Sprite Template)
FramePipeHorizontalTipRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeHorizontalTipSpriteData

; =================================================================================
; Memory Alloc: Pipe Horizontal Highlight (Sprite Template)
FramePipeHorizontalHighlightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeHorizontalHighlightSpriteData

; =================================================================================
; Memory Alloc: Pipe Top Right (Sprite Template)
FramePipeTopRightCornerSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW FramePipeTopLeftCornerSpriteData

; =================================================================================
; Memory Alloc: Pipe Top Left (Sprite Template)
FramePipeTopLeftCornerSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 1 bytes wide and 8 lines high
      DB 0x01, 0x08
      ; Sprite colour attribute palette index
      DB FramePipeColor
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW FramePipeTopLeftCornerSpriteData

; =================================================================================
; Memory Alloc: Stone Head Ornament Left (Sprite Template)
StoneHeadOrnamentLeftSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 4 bytes wide and 40 lines high
      DB 0x04, 0x28
      ; Sprite colour attribute palette index
;      DB ColourPaletteBrightWhite
      DB ColourPaletteDarkWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW StoneHeadOrnamentSpriteData

; =================================================================================
; Memory Alloc: Stone Head Ornament Left (Sprite Template)
StoneHeadOrnamentRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 4 bytes wide and 40 lines high
      DB 0x04, 0x28
      ; Sprite colour attribute palette index
;      DB ColourPaletteBrightWhite
      DB ColourPaletteDarkWhite
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW StoneHeadOrnamentSpriteData

; =================================================================================
; Memory Alloc: Bright Yellow Highlight (Sprite Template)
BrightYellowHighlightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 2 bytes wide and 32 lines high
      DB 0x01, 0x18
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightYellow
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW 0x0000 ; No sprite data

; =================================================================================
; Memory Alloc: Cherub Left (Sprite Template)
CherubLeftSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 4 bytes wide and 40 lines high
      DB 0x03, 0x18
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite vertical flip
      DB 0x00
      ; Sprite's pixel data
      DW CherubSpriteData

; =================================================================================
; Memory Alloc: Cherub Right (Sprite Template)
CherubRightSimpleSpriteTemplate:

; ---------------------------------------------------------------------------------
; Sprite attributes

      ; Sprite Dimensions: 4 bytes wide and 40 lines high
      DB 0x03, 0x18
      ; Sprite colour attribute palette index
      DB ColourPaletteBrightWhite
      ; Sprite vertical flip
      DB SpriteDataHorizontalFlipTrue
      ; Sprite's pixel data
      DW CherubSpriteData

; #################################################################################
; SRITE DATA INCLUDES
; #################################################################################
; ---------------------------------------------------------------------------------
; Memory Alloc: Zoinho (sprite data)

INCLUDE "resources/ZoinhoSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: GatePilar (sprite data)

INCLUDE "resources/GatePilarSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: TombStone (sprite data)

INCLUDE "resources/TombStoneSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: SkeletonCollapse (sprite data)

INCLUDE "resources/SkeletonCollapseSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: FleshEatingPlant (sprite data)

INCLUDE "resources/FleshEatingPlantSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: GardenBuildingBlock (sprite data)

INCLUDE "resources/GardenBuildingBlockSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: GreekPilarBlock (sprite data)

INCLUDE "resources/GreekPilarSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: IronFence (sprite data)

INCLUDE "resources/IronFenceSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Mushroom (sprite data)

INCLUDE "resources/MushRoomSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: SpeedySnail (sprite data)

INCLUDE "resources/SpeedySnailSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Shark (sprite data)

INCLUDE "resources/SharkSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: InvisibleMan (sprite data)

INCLUDE "resources/InvisibleManSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: ShootingFountain (sprite data)

INCLUDE "resources/ShootingFountainSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: SkeletonArm (sprite data)

INCLUDE "resources/SkeletonArmSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: PoisonDart (sprite data)

INCLUDE "resources/PoisonDartSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Rose (sprite data)

INCLUDE "resources/RoseSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Skull (sprite data)

INCLUDE "resources/SkullSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Axe (sprite data)

INCLUDE "resources/AxeSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Spikes (sprite data)

INCLUDE "resources/SpikesSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: RotatingSaw (sprite data)

INCLUDE "resources/RotatingSawSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameElement (sprite data)

INCLUDE "resources/FrameElementSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: FrameHeart (sprite data)

INCLUDE "resources/FrameScoreBoardSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: TrunkStump (sprite data)

INCLUDE "resources/TrunkStumpSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Stone Head Ornament (sprite data)

INCLUDE "resources/StoneHeadOrnamentSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Swim Wake (sprite data)

INCLUDE "resources/SwimWakeSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Wall Elements (sprite data)

INCLUDE "resources/WallElementsSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Book (sprite data)

INCLUDE "resources/BookSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Wall Torch (sprite data)

INCLUDE "resources/WallTorchSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Wooden Gate (sprite data)

INCLUDE "resources/WoodenGateSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Angry Bee (sprite data)

INCLUDE "resources/AngryBeeSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Tree Monster (sprite data)

INCLUDE "resources/TreeMonsterSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: D3v1l (sprite data)

INCLUDE "resources/D3v1lSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: SnakeHell (sprite data)

INCLUDE "resources/SnakeSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Scorpion (sprite data)

INCLUDE "resources/ScorpionSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Worm (sprite data)

INCLUDE "resources/WormSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Egg (sprite data)

INCLUDE "resources/EggSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Jack Goat (sprite data)

INCLUDE "resources/JackGoatSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: Cherub (sprite data)

INCLUDE "resources/CherubSpriteData_I01.asm"

; ---------------------------------------------------------------------------------
; Memory Alloc: FlamePattern (sprite data)

INCLUDE "resources/FlamesPatternSpriteData_I01.asm"

