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
; INCLUDE - RoutineEngineIsometric
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; -------------------------------------------------------------
; Definition: Minimap stack valid ID thresholds
; ID has to be >= MinimapStackValidID_Low and < MinimapStackValidID_High
MinimapStackValidID_Low  EQU 0x40
MinimapStackValidID_High EQU 0xFF

; -------------------------------------------------------------
; Constants: Null value
NullValue EQU 0x00

; -------------------------------------------------------------
; Constants: Isometric space origin coordinates
IsoOriginLineCoord   EQU 0x0C
IsoOriginColumnCoord EQU 0x80

; -------------------------------------------------------------
; Label: Iso coordinates max limits
MaxIsoX EQU 0x68
MaxIsoY EQU 0x40
MaxIsoZ EQU 0x68

; -------------------------------------------------------------
; Minimap stack size (256 indices = 512 BYTES)
MinimapStackSize EQU 0x0200

; =============================================================
; Routine: Transform all sprite coordinates and spaces
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
TransformSpriteInstanceSpacesCoords:

      CALL TransformSpriteInstance3DTo2D
      CALL TransformSpriteInstance3DToMinimapIndex

; -------------------------------------------------------------

      RET

; =============================================================
; Routine: Transform sprite instance 3D to 2D coordinates
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
TransformSpriteInstance3DTo2D:

      PUSH HL
      PUSH BC
      PUSH DE
      PUSH AF

; -------------------------------------------------------------

      PUSH DE
      POP HL

      ; Skip to template
      LD BC,ATTR_SpriteInstanceTemplatePointer
      ADD HL,BC

; -------------------------------------------------------------

      LD B,(HL) ; Get template pointer
      INC HL
      LD C,(HL)

      LD HL,ATTR_SpriteTemplatePosColOffset
      ADD HL,BC

      LD B,(HL) ; Column offset
      INC HL
      LD C,(HL) ; Line offset

      PUSH BC
      POP HL

; -------------------------------------------------------------

      ; Skip to Iso X coord
      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

; -------------------------------------------------------------
; Transform LINE coordinate: L = Lo + X/2 - Y + Z/2

      LD B,IsoOriginLineCoord ; Lo coordinate

      LD A,(DE) ; Retrieve X coordinate
      INC DE

      PUSH AF   ; Keep X for COLUMN transform

      SRL A     ; Divide X by 2

      ADD A,B   ; Add it up
      LD B,A

      LD A,(DE) ; Retrieve Y coordinate
      INC DE

      LD C,A
      LD A,B
      SUB C   ; Subtract it
      LD B,A

      LD A,(DE) ; Retrieve Z coordinate
      INC DE

      LD C,A    ; Keep Z for COLUMN transform

      SRL A     ; Divide Z by 2

      ADD A,B   ; Add it up
      
      SUB 0x06

; -------------------------------------------------------------

      ; Store transformed LINE coordinate at current position attribute

      INC DE ; Skip Minimap index
      INC DE ; Skip COLUMN coordinate

; -------------------------------------------------------------
      ADD A,L ; Subtract position line offset
; -------------------------------------------------------------

      LD (DE),A ; Store LINE coordinate

; -------------------------------------------------------------
; Transform COLUMN coordinate: C = Co + 2 * X - 2 * Z

      LD B,IsoOriginColumnCoord ; Co coordinate

      POP AF ; Retrieve X coordinate

      ADD A,B ; Add it up

      SUB C ; Subtract Z

      ; Store transformed COLUMN coordinate at current position attribute

      DEC DE ; Set pointer back to COLUMN coordinate

; -------------------------------------------------------------
      ADD A,H ; Subtract position column offset
; -------------------------------------------------------------

      LD (DE),A ; Store COLUMN coordinate

; -------------------------------------------------------------

      POP AF
      POP DE
      POP BC
      POP HL

      RET ; Exit

; =============================================================
; Routine: Transform sprite instance 3D coordinates to Minimap index
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
TransformSpriteInstance3DToMinimapIndex:

      PUSH BC
      PUSH DE
      PUSH AF

; -------------------------------------------------------------
; Transform Minimap Index (Minimap Dimensions: 8 x 8 x 4)
;
; MMi = ( X/16 ) * 8 * 4 + ( y/16 ) + ( Z/16 ) * 4

      ; Skip to Iso X coord
      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      LD A,(DE) ; X
      INC DE

      ADD A,0x0F

      SRL A
      SRL A
      SRL A
      SRL A

      ADD A,A
      ADD A,A
      ADD A,A
      ADD A,A
      ADD A,A

      LD B,A

      LD A,(DE) ; Y
      INC DE

      SRL A
      SRL A
      SRL A
      SRL A

      ADD A,B

      LD B,A

      LD A,(DE) ; Z
      INC DE

      ADD A,0x0F

      SRL A
      SRL A
      SRL A
      SRL A

      ADD A,A
      ADD A,A

      ADD A,B

      LD (DE),A ; Store Minimap index

; -------------------------------------------------------------

      POP AF
      POP DE
      POP BC

      RET ; Exit

; -------------------------------------------------------------
; Memory Alloc: Minimap stack (256 indices)
MinimapStackBottom: DS MinimapStackSize
MinimapStack: ; Minimap stack top

; =============================================================
; Routine: Clear Minmap
; -------------------------------------------------------------
ClearMinimapStack:

      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      DI
      LD (StackPointer),SP

; -------------------------------------------------------------

      LD SP,MinimapStack

      LD HL,0x0000

      LD B,0xFF

ClearMinimapLoop:

      PUSH HL

      DJNZ ClearMinimapLoop

; -------------------------------------------------------------

      LD SP,(StackPointer)
      EI

; -------------------------------------------------------------

      POP BC
      POP HL

      RET ; Exit

; =============================================================
; Routine: Move sprite instance to Minmap
; -------------------------------------------------------------
; -> DE: Sprite instance
; -------------------------------------------------------------
MoveSpriteToMinimap:

      DI

      PUSH HL
      PUSH DE
      PUSH BC
      PUSH AF

; -------------------------------------------------------------
; Check whether sprite is valid for Minimap

      LD A,(DE)

      ; Background sprites have null ID
      CP 0x00
      JR Z,MoveSpriteToMinimapContinue

      CP MinimapStackValidID_Low
      JR C,MoveSpriteToMinimapEnd

      CP MinimapStackValidID_High
      JR NC,MoveSpriteToMinimapEnd

MoveSpriteToMinimapContinue:

; -------------------------------------------------------------
; Get instance´s Minimap index

      PUSH DE
      POP HL

      ; Skip to Display flag
      M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag

      ; Check whether sprite is visible, if not do not move it to Minimap
      LD A,(HL)
      CP SpriteInstanceDisplayFlagTrue
      JR NZ,MoveSpriteToMinimapEnd

      ; Skip to Minimap
      M_OffsetPointer HL, ATTR_SpriteInstanceDisplayFlag, ATTR_SpriteInstanceMinimapIndex

      LD A,(HL) ; Minimap index

; -------------------------------------------------------------
; Store sprite instace at provided Minimap index

      LD BC,MinimapStackBottom

      LD H,0x00
      LD L,A

      ADD HL,HL ; Index is multiplied by 2 to convert to pointer
      ADD HL,BC

      LD (HL),E
      INC HL
      LD (HL),D

; -------------------------------------------------------------

MoveSpriteToMinimapEnd:

      POP AF
      POP BC
      POP DE
      POP HL
      
      EI

      RET

; =============================================================
; Routine: Display Minmap stack
; -------------------------------------------------------------
DisplayMinimapStack:

  DI

      PUSH HL
      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      LD HL,MinimapStackBottom

; -------------------------------------------------------------

      LD B,0xFF

DisplayMinimapStackLoop:

      ; Get sprite instance pointer from Minimap stack
      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL

      ; Skip display if pointer is null
      LD A,D
      ADD A,E
      CP NullValue
      JR Z,DisplayMinimapStackSkip

      ; Skip display if display flag is false
      INC DE
      LD A,(DE)
      DEC DE
      CP SpriteInstanceDisplayFlagTrue
      JR NZ,DisplayMinimapStackSkip

      ; Display sprite instance
      CALL DisplaySprite

DisplayMinimapStackSkip:

      DJNZ DisplayMinimapStackLoop

; -------------------------------------------------------------

      POP BC
      POP DE
      POP HL
      
      EI

      RET

; =============================================================
; Routine: Refresh entire Iso scene
; -------------------------------------------------------------
RefreshIsoScene:

   PUSH DE
   PUSH BC

; -------------------------------------------------------------

    LD A,(StaticStackSize) ; Nr. of sprites
    LD B,A

ZoinhoCollectItemDisplayLoop:

    CALL StaticStackLoopRead
    CALL SpriteInstanceDisplayFlagSetTrue

    DJNZ ZoinhoCollectItemDisplayLoop

; -------------------------------------------------------------

    LD A,(StencilCheckSwitch)
    PUSH AF

    LD A,StencilCheckDisabled
    LD (StencilCheckSwitch),A

    CALL DisplayMinimapStack

    POP AF
    LD (StencilCheckSwitch),A

; -------------------------------------------------------------

    POP BC
    POP DE

    RET

; =============================================================
; Label: Shark Tank Flag value
; -------------------------------------------------------------
SharkTankFlagFalse: EQU 0x00
SharkTankFlagTrue:  EQU 0xFF

; =============================================================
; Mem Alloc: Zoinho instance pointer
; -------------------------------------------------------------
SharkTankFlag: DB SharkTankFlagFalse

; =============================================================
; Mem Alloc: Zoinho instance pointer
; -------------------------------------------------------------
ZoinhoInstancePointer: DW 0x0000

; =============================================================
; Routine: Isometric scene init
; -------------------------------------------------------------
; -> HL: Scene template
; -------------------------------------------------------------
IsoSceneInit:

      PUSH HL
      PUSH BC
      PUSH DE
      PUSH AF

; ------------------------------------------------------------

      LD (CurrentScenePointer),HL

; ------------------------------------------------------------
; Set Stencil Check switch state

      LD A,(HL)
      INC HL
      LD (StencilCheckSwitch),A

; -------------------------------------------------------------
; Initialize Locked Portal check

     PUSH HL

     LD HL,NextScenePointerVoid
     LD (LockedPortalPointer),HL
     LD (LocalPortalDisplayFlagPointer),HL

     POP HL

; ------------------------------------------------------------
; Initialize Portals

      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL
      LD (NextScenePointerPortalFrontRight),DE
      CALL PortalLocksCheck

      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL
      LD (NextScenePointerPortalBackLeft),DE
      CALL PortalLocksCheck

      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL
      LD (NextScenePointerPortalFrontLeft),DE
      CALL PortalLocksCheck

      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL
      LD (NextScenePointerPortalBackRight),DE
      CALL PortalLocksCheck

; ------------------------------------------------------------
; Create and initialize static sprites

      LD B,(HL) ; Static sprites counter
      INC HL

SceneStaticSpritesLoop:

      LD A,(HL) ; Get Sprite ID
      INC HL

; ------------------------------------------------------------
; Get sprite template from sprites table

      CALL SpriteTemplateGet

; ------------------------------------------------------------

      PUSH HL

      EX DE,HL

      PUSH BC

      CALL CreateSpriteInstance
      CALL StaticStackPush

      POP BC

      POP HL

      CALL IsoCoordInit

      DJNZ SceneStaticSpritesLoop

; -------------------------------------------------------------
; Initialize Iso Scene Portals

      CALL ScenePortalsInit

; -------------------------------------------------------------

      PUSH HL

      LD A,ZoinhoID
      LD HL,ZoinhoSpriteTemplate

      CALL CreateSpriteInstance
      CALL DynamicStackPush

      PUSH DE
      POP HL
      INC HL
      LD A,SpriteInstanceDisplayFlagFalse
      LD (HL),A

      ; Transform 3D coordinates to 2D and Minimap index
      CALL TransformSpriteInstanceSpacesCoords
      CALL UpdateSpritePrevPos

      POP HL

; -------------------------------------------------------------
; Create and initialize dynamic sprites

      LD B,(HL) ; Dynamic sprites counter
      INC HL

; -------------------------------------------------------------

      LD A,SharkTankFlagFalse
      LD (SharkTankFlag),A

      LD A,0x00
      LD (ZoinhoSinkingCounter),A

; -------------------------------------------------------------

SceneDynamicSpritesLoop:

      LD A,(HL) ; Get Sprite ID
      INC HL

; -------------------------------------------------------------
; Shark Tank Flag check

      PUSH AF

      CP SharkID
      JR NZ,SceneDynamicSpritesLoopContinue

      LD A,SharkTankFlagTrue
      LD (SharkTankFlag),A

SceneDynamicSpritesLoopContinue:

      POP AF

; -------------------------------------------------------------

; ------------------------------------------------------------
; Get sprite template from sprites table

      CALL SpriteTemplateGet

; ------------------------------------------------------------

      PUSH HL

      EX DE,HL

      PUSH BC

      CALL CreateSpriteInstance
      CALL DynamicStackPush

      POP BC

      POP HL

      CALL IsoCoordInit
      CALL UpdateSpritePrevPos

      DJNZ SceneDynamicSpritesLoop

; -------------------------------------------------------------
; Display whole scene for the first time

      ; Load entire scene into Minimap
      CALL LoadSceneToMinimap

; -------------------------------------------------------------

      ; Hide PoisonDart
      CALL PoisonDartsHide

; -------------------------------------------------------------

      LD A,ThrownAxeID
      CALL DynamicSpriteSearchByID
      JR NC,SceneDynamicSpritesThrownAxeSkip

      INC DE
      LD A,SpriteInstanceDisplayFlagFalse
      LD (DE),A

SceneDynamicSpritesThrownAxeSkip:

; -------------------------------------------------------------

      LD A,ThrownBookID
      CALL DynamicSpriteSearchByID
      JR NC,SceneDynamicSpritesThrownBookSkip

      INC DE
      LD A,SpriteInstanceDisplayFlagFalse
      LD (DE),A

SceneDynamicSpritesThrownBookSkip:

; -------------------------------------------------------------

      ; Hide TreeMonsters
      CALL TreeMonstersHide

; -------------------------------------------------------------

      LD A,(DynamicStackSize)
      LD B,A

SceneDynamicSpritesHideScorpionPlaceholderLoop:

      CALL DynamicStackLoopRead

      LD A,(DE)

      CP ScorpionPlaceholderID
      JR NZ,SceneDynamicSpritesHideScorpionPlaceholderSkip

      INC DE
      LD A,SpriteInstanceDisplayFlagFalse
      LD (DE),A

SceneDynamicSpritesHideScorpionPlaceholderSkip:

      DJNZ SceneDynamicSpritesHideScorpionPlaceholderLoop

; -------------------------------------------------------------

      ; Display Background sprites
      CALL BackgroundStaticDisplay

      ; Display sprites in Minimap stack
      CALL DisplayMinimapStack

; -------------------------------------------------------------

      LD A,ZoinhoID
      CALL DynamicSpriteSearchByID

      LD (ZoinhoInstancePointer),DE

; -------------------------------------------------------------

      POP AF
      POP DE
      POP BC
      POP HL

      RET ; Exit

; =============================================================
; Routine: Isometric 3D coordinate init and transform
; -------------------------------------------------------------
; -> HL: Scene template pointer
; -> DE: Sprite instance
; -------------------------------------------------------------
IsoCoordInit:

      PUSH AF
      
      PUSH DE

      ; Skip to Iso X coord
      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

      ; Initialize Iso coordinates
      LD A,(HL) ; X
      INC HL
      LD (DE),A
      INC DE

      LD A,(HL) ; Y
      INC HL
      LD (DE),A
      INC DE

      LD A,(HL) ; Z
      INC HL
      LD (DE),A
      
      POP DE

      ; Transform 3D coordinates to 2D and Minimap index
      CALL TransformSpriteInstanceSpacesCoords

      POP AF

      RET ; Exit

; =============================================================
; Routine: Load entire scene into Minmap
; -------------------------------------------------------------
LoadSceneToMinimap:

      PUSH BC
      PUSH AF

; -------------------------------------------------------------

      CALL ClearMinimapStack

; -------------------------------------------------------------

      LD A,(StaticStackSize) ; Nr. of sprites
      LD B,A

SceneStaticSpriteLoop:

      CALL StaticStackLoopRead

      LD A,(DE)
      CP BackgroundElementID
      JR Z,SceneStaticSpriteLoopSkip

      CALL SpriteInstanceDisplayFlagSetTrue
      CALL MoveSpriteToMinimap

      CALL CollectItemPlacement

SceneStaticSpriteLoopSkip:

      DJNZ SceneStaticSpriteLoop

; -------------------------------------------------------------

      LD A,(DynamicStackSize) ; Nr. of sprites
      LD B,A

SceneDynamicSpriteLoop:

      CALL DynamicStackLoopRead

      LD A,(DE)

      CALL SpriteInstanceDisplayFlagSetTrue
      
SceneDynamicSpriteLoopDisplaySkip:

      CALL MoveSpriteToMinimap

      DJNZ SceneDynamicSpriteLoop

; -------------------------------------------------------------

      POP AF
      POP BC

      RET ; Exit

; =============================================================
; Routine: Remove sprite from Minimap
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; -------------------------------------------------------------
RemoveSpriteFromMinimap:

      PUSH HL
      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      ; Skip to Minimap index
      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceMinimapIndex

      LD A,(DE) ; Minimap index

      LD BC,MinimapStackBottom

      LD H,0x00
      LD L,A

      ADD HL,HL ; Index is multiplied by 2 to convert to pointer
      ADD HL,BC

      XOR A

      LD (HL),A
      INC HL
      LD (HL),A

; -------------------------------------------------------------

      POP BC
      POP DE
      POP HL

      RET ; Exit

; =============================================================
; Routine: Check Sprite instance position Minimap Index
; -------------------------------------------------------------
; -> DE: Sprite instance pointer
; <- Carry Flag: Index state
; -------------------------------------------------------------
CheckSpritePosMinimapIndex:

      PUSH DE
      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      ; Skip to Minimap index
      M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceMinimapIndex

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
      JR Z,MinimapIsFree

      SCF ; Set Carry Flag

      JR MinimapCheckEnd

MinimapIsFree:

      OR A ; Reset Carry Flag

; -------------------------------------------------------------

MinimapCheckEnd:

      POP BC
      POP HL
      POP DE

      RET ; Exit

; =============================================================
; Routine: Get sprite instance from Minimap Stack index
; -------------------------------------------------------------
; -> A: Minimap index
; <- DE: Sprite instance pointer
; -------------------------------------------------------------
MinimapStackGetSpriteFromIndex:

      PUSH HL
      PUSH BC

; -------------------------------------------------------------

      LD BC,MinimapStackBottom

; -------------------------------------------------------------

      LD H,0x00
      LD L,A

      ADD HL,HL
      ADD HL,BC

      ; Get sprite instance pointer from Minimap stack
      LD E,(HL)
      INC HL
      LD D,(HL)
      INC HL

; -------------------------------------------------------------

      POP BC
      POP HL

      RET

; #############################################################
; PORTALS PLACEMENT
; #############################################################

; =============================================================
; Routine: Initialize Iso Scene Portals
; -------------------------------------------------------------
ScenePortalsInit:

      PUSH HL
      PUSH DE

; -------------------------------------------------------------

      LD DE,(NextScenePointerPortalBackRight)

      LD A,D
      OR E
      JR Z,ScenePortalBackRightBackground

      CALL SceneBackgroundRightPassage

      LD A,WoodenGateZID
      LD (WoodenGateID),A
      LD HL,WoodenGateZSpriteTemplate
      LD (WoodenGateSpriteTemplate),HL

      LD HL,PortalBackRightPillarsPos
      CALL ScenePillarsDisplay

      JR ScenePortalFrontLeftCheck

ScenePortalBackRightBackground:

      CALL SceneBackgroundRightFull

; -------------------------------------------------------------

ScenePortalFrontLeftCheck:

      LD DE,(NextScenePointerPortalFrontLeft)

      LD A,D
      OR E
      JR Z,ScenePortalFrontLeftSkip

      LD A,WoodenGateZID
      LD (WoodenGateID),A
      LD HL,WoodenGateZSpriteTemplate
      LD (WoodenGateSpriteTemplate),HL

      LD HL,PortalFrontLeftPillarsPos

      CALL ScenePillarsDisplay

ScenePortalFrontLeftSkip:

; -------------------------------------------------------------

      LD DE,(NextScenePointerPortalFrontRight)

      LD A,D
      OR E
      JR Z,ScenePortalFrontRightSkip

      LD A,WoodenGateXID
      LD (WoodenGateID),A
      LD HL,WoodenGateXSpriteTemplate
      LD (WoodenGateSpriteTemplate),HL

      LD HL,PortalFrontRightPillarsPos

      CALL ScenePillarsDisplay

ScenePortalFrontRightSkip:

; -------------------------------------------------------------

      LD DE,(NextScenePointerPortalBackLeft)

      LD A,D
      OR E
      JR Z,ScenePortalBackLeftBackground

      CALL SceneBackgroundLeftPassage

      LD A,WoodenGateXID
      LD (WoodenGateID),A
      LD HL,WoodenGateXSpriteTemplate
      LD (WoodenGateSpriteTemplate),HL

      LD HL,PortalBackLeftPillarsPos
      CALL ScenePillarsDisplay
      
      JR ScenePortalsInitEnd

; -------------------------------------------------------------

ScenePortalBackLeftBackground:

      CALL SceneBackgroundLeftFull

; -------------------------------------------------------------

ScenePortalsInitEnd:

      POP DE
      POP HL

      RET

; =============================================================
; Memory Alloc: Wooden Gate
; -------------------------------------------------------------
WoodenGateID: DB 0x00
WoodenGateSpriteTemplate: DW 0x0000

; =============================================================
; Routine: Display Scene Pillars
; -------------------------------------------------------------
; -> DE: Scene portal pointer
; -> HL: Portal pillar positions
; -------------------------------------------------------------
ScenePillarsDisplay:

    PUSH HL
    PUSH BC
    PUSH DE

; -------------------------------------------------------------

    ; Pillars counter
    LD A,0x02

ScenePillarsDisplayLoop:

    EX AF,AF'

    PUSH HL

    ; Create sprite
    LD A,GatePilarID
    LD HL,GatePilarSpriteTemplate

    CALL CreateSpriteInstance
    CALL StaticStackPush

    ; Set ISO coords
    M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

    POP HL

    LDI
    INC DE
    LDI

    ; Transform ISO coords
    M_OffsetPointer DE, ATTR_SpriteInstanceMinimapIndex, ATTR_SpriteInstanceRoot

    CALL TransformSpriteInstanceSpacesCoords

    ; Evaluate Pillar counter
    EX AF,AF'

    DEC A
    JR NZ,ScenePillarsDisplayLoop

; -------------------------------------------------------------
; Check for Locked Portal and display it if necessary

    POP DE
    PUSH DE

    PUSH HL

    CALL LockedPortalCheck
    JR NC,ScenePillarsDisplayLockedPortalSkip

; -------------------------------------------------------------

    ; Create sprite
    LD A,(WoodenGateID)
    LD HL,(WoodenGateSpriteTemplate)

    CALL CreateSpriteInstance
    CALL DynamicStackPush

    ; Set ISO coords
    M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

    POP HL

    LDI
    INC DE
    LDI

    ; Transform ISO coords
    M_OffsetPointer DE, ATTR_SpriteInstanceMinimapIndex, ATTR_SpriteInstanceRoot

    CALL TransformSpriteInstanceSpacesCoords
    CALL UpdateSpritePrevPos

; -------------------------------------------------------------

    JR ScenePillarsDisplayEnd

ScenePillarsDisplayLockedPortalSkip:

    POP HL

; -------------------------------------------------------------

ScenePillarsDisplayEnd:

    POP DE
    POP BC
    POP HL

    RET

; =============================================================
; Routine: Include Back Fence Left - Passage
; -------------------------------------------------------------
SceneBackgroundLeftPassage:

    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------

    LD B,0x08 ; Z Coord
    LD C,0x05 ; No. of elements

; -------------------------------------------------------------

SceneBackgroundLeftPassageLoop:

    ; Create sprite
    LD A,BackgroundElementID
    LD HL,BackgroundIronFenceXSpriteTemplate

    CALL CreateSpriteInstance
    CALL StaticStackPush

; -------------------------------------------------------------

    EX DE,HL

    ; Set ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosZ

    LD (HL),B

    ; Transform ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceIsoPosZ, ATTR_SpriteInstanceRoot

    EX DE,HL

; -------------------------------------------------------------

    CALL TransformSpriteInstanceSpacesCoords

    LD A,0x18
    ADD A,B
    LD B,A

; -------------------------------------------------------------

    LD A,C
    CP 0x04
    JR NZ,SceneBackgroundLeftPassageSkip

    LD A,0x18
    ADD A,B
    LD B,A

    DEC C

SceneBackgroundLeftPassageSkip:

; -------------------------------------------------------------

    DEC C
    JR NZ,SceneBackgroundLeftPassageLoop

; -------------------------------------------------------------

    POP AF
    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Include Back Fence Left - Full
; -------------------------------------------------------------
SceneBackgroundLeftFull:

    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------

    LD B,0x08 ; Z Coord
    LD C,0x05 ; No. of elements

; -------------------------------------------------------------

    LD A,(CurrentIsoScene)
    AND 0x07
    CP 0x05
    JR C,SceneBackgroundLeftFullLoopFence

    LD HL,BackgroundWallThornsZSpriteTemplate

    JR SceneBackgroundLeftFullLoopContinue

SceneBackgroundLeftFullLoopFence:

    LD HL,BackgroundIronFenceZSpriteTemplate

SceneBackgroundLeftFullLoopContinue:

SceneBackgroundLeftFullLoop:

; -------------------------------------------------------------

    LD HL,(CurrentScenePointer)
    LD DE,IsoSceneTemplateD3v1lFinalScene
    XOR A
    SBC HL,DE
    JR NZ,SceneBackgroundLeftFullLoopContinueNotHell

    LD HL,HellBackgroundWallThornsXSpriteTemplate

    JR SceneBackgroundLeftFullLoopContinueHell

SceneBackgroundLeftFullLoopContinueNotHell:

    LD HL,BackgroundWallThornsXSpriteTemplate

SceneBackgroundLeftFullLoopContinueHell:

; -------------------------------------------------------------

    ; Create sprite
    LD A,BackgroundElementID

    CALL CreateSpriteInstance
    CALL StaticStackPush

; -------------------------------------------------------------

    EX DE,HL

    ; Set ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosZ

    LD (HL),B

    ; Transform ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceIsoPosZ, ATTR_SpriteInstanceRoot

    EX DE,HL

; -------------------------------------------------------------

    CALL TransformSpriteInstanceSpacesCoords

    LD A,0x18
    ADD A,B
    LD B,A

    DEC C
    JR NZ,SceneBackgroundLeftFullLoop

; -------------------------------------------------------------

    POP AF
    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Include Back Fence Right - Passage
; -------------------------------------------------------------
SceneBackgroundRightPassage:

    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------

    LD B,0x08 ; X Coord
    LD C,0x05 ; No. of elements

; -------------------------------------------------------------

SceneBackgroundRightPassageLoop:

    ; Create sprite
    LD A,BackgroundElementID
    LD HL,BackgroundIronFenceZSpriteTemplate

    CALL CreateSpriteInstance
    CALL StaticStackPush

; -------------------------------------------------------------

    EX DE,HL

    ; Set ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

    LD (HL),B

    ; Transform ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceIsoPosX, ATTR_SpriteInstanceRoot

    EX DE,HL

; -------------------------------------------------------------

    CALL TransformSpriteInstanceSpacesCoords

    LD A,0x18
    ADD A,B
    LD B,A

; -------------------------------------------------------------

    LD A,C
    CP 0x04
    JR NZ,SceneBackgroundRightPassageSkip

    LD A,0x18
    ADD A,B
    LD B,A

    DEC C

SceneBackgroundRightPassageSkip:

; -------------------------------------------------------------

    DEC C
    JR NZ,SceneBackgroundRightPassageLoop

; -------------------------------------------------------------

    POP AF
    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Include Back Fence Right - Full
; -------------------------------------------------------------
SceneBackgroundRightFull:

    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------

    LD B,0x08 ; X Coord
    LD C,0x05 ; No. of elements

; -------------------------------------------------------------

SceneBackgroundRightFullLoop:

    LD A,(CurrentIsoScene)
    AND 0x07
    CP 0x03
    JR C,SceneBackgroundRightFullLoopFence

    LD HL,BackgroundWallThornsZSpriteTemplate

    JR SceneBackgroundRightFullLoopContinue

SceneBackgroundRightFullLoopFence:

    LD HL,BackgroundIronFenceZSpriteTemplate

SceneBackgroundRightFullLoopContinue:

; -------------------------------------------------------------

    PUSH HL

    LD HL,(CurrentScenePointer)
    LD DE,IsoSceneTemplateD3v1lFinalScene
    XOR A
    SBC HL,DE
    JR NZ,SceneBackgroundRightFullLoopContinueNotHell

    POP HL

    LD HL,HellBackgroundWallThornsZSpriteTemplate

    PUSH HL

SceneBackgroundRightFullLoopContinueNotHell:

    POP HL

; -------------------------------------------------------------

    ; Create sprite
    LD A,BackgroundElementID

    CALL CreateSpriteInstance
    CALL StaticStackPush

; -------------------------------------------------------------

    EX DE,HL

    ; Set ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

    LD (HL),B

    ; Transform ISO coords
    M_OffsetPointer HL, ATTR_SpriteInstanceIsoPosX, ATTR_SpriteInstanceRoot

    EX DE,HL

; -------------------------------------------------------------

    CALL TransformSpriteInstanceSpacesCoords

    LD A,0x18
    ADD A,B
    LD B,A

    DEC C
    JR NZ,SceneBackgroundRightFullLoop

; -------------------------------------------------------------

    POP AF
    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Check Portal Locks
; -------------------------------------------------------------
; -> DE: Portal to be checked
; -------------------------------------------------------------
PortalLocksCheck:

    PUSH HL
    PUSH BC
    PUSH DE

; -------------------------------------------------------------

    LD A,(PortalLocksCount) ; Portal locks counter

    LD HL,PortalLocksArray

; -------------------------------------------------------------

    LD DE,(CurrentScenePointer)

PortalLocksCheckCurrentSceneLoop:

    PUSH AF

    LD C,(HL)
    INC HL
    LD B,(HL)
    INC HL

    PUSH HL

    PUSH BC
    POP HL

    XOR A
    SBC HL,DE
    JR Z,PortalLocksCheckCurrentSceneTrue

    POP HL

    INC HL
    INC HL

    INC HL

    POP AF

    DEC A
    JR NZ,PortalLocksCheckCurrentSceneLoop

    JR PortalLocksCheckElse

; -------------------------------------------------------------

PortalLocksCheckCurrentSceneTrue:

    POP HL
    POP AF

    POP DE
    PUSH DE ; Portal Pointer to be checked

    LD C,(HL)
    INC HL
    LD B,(HL)
    INC HL

    PUSH HL

    PUSH BC
    POP HL

    XOR A
    SBC HL,DE
    JR NZ,PortalLocksCheckLockedPortalFalse

    LD (LockedPortalPointer),DE

    POP HL
    LD (LocalPortalDisplayFlagPointer),HL

    JR PortalLocksCheckEnd

PortalLocksCheckLockedPortalFalse:

    POP HL

    JR PortalLocksCheckEnd

; -------------------------------------------------------------

PortalLocksCheckElse:

    LD A,(PortalLocksCount) ; Portal locks counter

    LD HL,PortalLocksArray

    INC HL
    INC HL

; -------------------------------------------------------------

    LD DE,(CurrentScenePointer)

PortalLocksCheckCurrentSceneElseLoop:

    PUSH AF

    LD C,(HL)
    INC HL
    LD B,(HL)
    INC HL

    PUSH HL

    PUSH BC
    POP HL

    XOR A
    SBC HL,DE
    JR Z,PortalLocksCheckCurrentSceneElseTrue

    POP HL

    INC HL
    INC HL

    INC HL

    POP AF

    DEC A
    JR NZ,PortalLocksCheckCurrentSceneElseLoop

    JR PortalLocksCheckEnd

; -------------------------------------------------------------

PortalLocksCheckCurrentSceneElseTrue:

    POP HL
    POP AF

    POP DE
    PUSH DE

    DEC HL
    DEC HL
    DEC HL
    DEC HL

    LD C,(HL)
    INC HL
    LD B,(HL)
    INC HL

    PUSH HL

    PUSH BC
    POP HL

    XOR A
    SBC HL,DE
    JR NZ,PortalLocksCheckLockedPortalElseFalse

    LD (LockedPortalPointer),DE
    
    POP HL
    
    INC HL
    INC HL

    LD (LocalPortalDisplayFlagPointer),HL

    JR PortalLocksCheckEnd

PortalLocksCheckLockedPortalElseFalse:

    POP HL

; -------------------------------------------------------------

PortalLocksCheckEnd:

    POP DE
    POP BC
    POP HL

    RET