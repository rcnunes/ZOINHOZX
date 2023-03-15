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
; INCLUDE - RoutineEngineScene
; =================================================================================

; =============================================================
; MACROS & GLOBAL DEFINITIONS
; =============================================================

; -------------------------------------------------------------
; Labels: Scene Statuses
SceneStatusGameplay         EQU 0x01
SceneStatusDeath            EQU 0x02
SceneStatusEnd              EQU 0x03
SceneStatusMenu             EQU 0x04
SceneStatusGameplayContinue EQU 0x05

; -------------------------------------------------------------
; Memory Alloc: Scene Status
SceneStatus: DB SceneStatusGameplay


; =============================================================
; Memory Alloc: Current Iso Scene
; -------------------------------------------------------------
CurrentIsoScene: DW 0x0000

; -------------------------------------------------------------
; Labels: Random placement map (template)
PlacementMapRandom EQU %10111001
PlacementMapAll    EQU %11111111

; -------------------------------------------------------------
; Memory Alloc: Collection items placement control
PlacementControlBooks:        DB PlacementMapAll ;, PlacementMapAll
PlacementControlSkulls:       DB PlacementMapAll ;PlacementMapRandom ;, PlacementMapRandom
PlacementControlAxes:         DB PlacementMapAll ;, PlacementMapRandom
PlacementControlTreeMonsters: DB PlacementMapAll ;, PlacementMapRandom

; -------------------------------------------------------------
; Labels: Placement mask
PlacementMask EQU %00000001

; =============================================================
; Routine: Scene manager
; -------------------------------------------------------------
SceneManager:

SceneManagerLoop:

      LD A,(SceneStatus)
      CP SceneStatusGameplay
      CALL Z,SceneUpdate

; -------------------------------------------------------------

      LD A,(SceneStatus)
      CP SceneStatusEnd
      JR Z,SceneManagerEnd

; -------------------------------------------------------------

      ;LD A,(SceneStatus)
      CP SceneStatusDeath
      JR NZ,SceneManagerGameOverSkip

      CALL SceneUpdateZoinhoDead

; -------------------------------------------------------------

      LD A,(ScoreLivesStr)
      CP "9"
      JR Z,SceneManagerEnd

SceneManagerGameOverSkip:

; -------------------------------------------------------------

      JR SceneManagerLoop

; -------------------------------------------------------------

SceneManagerEnd:

      RET

; =============================================================
; Routine: Scene Update
; -------------------------------------------------------------
SceneUpdate:

SceneUpdateLoop:

      ; Update dynamic sprite position
      LD A,(DynamicStackSize)
      LD B,A

DynamicSpriteUpdateLoop:

      CALL DynamicStackLoopRead

; -------------------------------------------------------------

      CALL RemoveSpriteFromMinimap
      CALL ClearDynamicSprite
      CALL DynamicSpriteUpdate
      CALL MoveSpriteToMinimap

      DJNZ DynamicSpriteUpdateLoop

; -------------------------------------------------------------

      LD A,(SpriteDataColourAttributeChoice)
      LD (SpriteDataColourAttributeFlag),A

; ------------------------------------------------------------

      ; Display Background sprites
      CALL BackgroundStaticDisplay

; ------------------------------------------------------------

      ; Display sprites in Minimap stack
      CALL DisplayMinimapStack

; -------------------------------------------------------------

      LD A,SpriteDataColourAttributeClash
      LD (SpriteDataColourAttributeFlag),A

; -------------------------------------------------------------

      ; Swap screen buffer (pixels)
      CALL SwapScreenBufferAll

; ------------------------------------------------------------

      ; Read keyboard / control state
      CALL ControlsRead

; ------------------------------------------------------------

      CALL PortalThresholdCheck

; ------------------------------------------------------------

      LD A,(SceneStatus)
      CP SceneStatusGameplay
      JR Z,SceneUpdateLoop

; ------------------------------------------------------------

      RET

; =============================================================
; Routine: Game Start
; -------------------------------------------------------------
GameStart:

    CALL ScreenBufferClear
    
    LD BC,0x0105
    LD DE,StrStart
    CALL ScrollDisplay
    
    RET

; =============================================================
; Memory Alloc: Game Over
; -------------------------------------------------------------
HeartBrokenPos EQU 0xE0A8

; =============================================================
; Routine: Scene Update ZoinhoDead only
; -------------------------------------------------------------
SceneUpdateZoinhoDead:

      PUSH HL

; -------------------------------------------------------------

SceneUpdateZoinhoDeadLoop:

; ------------------------------------------------------------

      ; Update dynamic sprite position
      LD A,ZoinhoDeadID
      CALL DynamicSpriteSearchByID

; -------------------------------------------------------------

      CALL ClearDynamicSprite
      CALL ZoinhoDeadUpdate

; ------------------------------------------------------------

      ; Display Background sprites
      CALL BackgroundStaticDisplay

; ------------------------------------------------------------

      ; Display sprites in Minimap stack
      CALL DisplayMinimapStack

; ------------------------------------------------------------

      ; Swap screen buffer (pixels)
      CALL SwapScreenBufferAll

; ------------------------------------------------------------

      LD A,(SceneStatus)
      CP SceneStatusDeath

      JR Z,SceneUpdateZoinhoDeadLoop

; ------------------------------------------------------------

      LD A,ZoinhoNewIsoPosFlagTrue
      LD (ZoinhoNewIsoPosFlag),A

; ------------------------------------------------------------

      LD HL,ScoreLivesStr
      DEC (HL)

      LD A,(HL)
      CP ScoreLessThanZero
      JR NZ,SceneUpdateZoinhoDeadGameOverSkip

      LD A,ColourPaletteRainbow
      LD DE,StrGameOver
      LD BC,StrGameOverPos
      CALL StrPrint

      LD DE,0x0F02
      LD (SpriteDimension),DE
      LD BC,HeartBrokenPos
      DEC B
      CALL BlitterClear

      LD DE,FrameHeartBrokenSimpleSpriteTemplate
      LD BC,HeartBrokenPos
      CALL DisplaySimpleSprite

      CALL SwapScreenBufferAll

      ; Wait for ENTER key

SceneUpdateZoinhoDeadGameOverWait:

      LD A,KeysSegmentHJKLEn
      IN A,(SpeccyKeyboardPort)
      AND MaskKeys____En

      JR NZ,SceneUpdateZoinhoDeadGameOverWait

      LD A,"9"
      LD (ScoreLivesStr),A

SceneUpdateZoinhoDeadGameOverSkip:

; ------------------------------------------------------------

      CALL SceneInit

; ------------------------------------------------------------

      POP HL

      RET

; =============================================================
; Memory Alloc: Frame counter value reference
; -------------------------------------------------------------
;ScreenFrameCounter: DB 0x00

; =============================================================
; Routine: Scene Init
; -------------------------------------------------------------
SceneInit:

      PUSH HL
      PUSH DE

      ; Clear engine states
      CALL StencilBufferStackClear
      CALL SpriteInstanceStackClear
      CALL StaticStackClear
      CALL DynamicStackClear
      CALL PlayBeeperInterleavedClear
      CALL ScreenBufferClear

; -------------------------------------------------------------

      ; Load and init Iso scene
      LD HL,(CurrentIsoScene)
      DI
      CALL IsoSceneInit

; -------------------------------------------------------------

      LD A,(ZoinhoNewIsoPosFlag)
      CP ZoinhoNewIsoPosFlagFalse
      JR Z,SceneInitZoinhoNewPosSkip

      LD A,ZoinhoID
      CALL DynamicSpriteSearchByID

      INC DE
      LD A,SpriteInstanceDisplayFlagTrue
      LD (DE),A

      INC DE

      LD A,(ZoinhoNewIsoPosX)
      LD (DE),A
      INC DE

      LD A,(ZoinhoNewIsoPosY)
      LD (DE),A
      INC DE

      LD A,(ZoinhoNewIsoPosZ)
      LD (DE),A

; -------------------------------------------------------------

SceneInitZoinhoNewPosSkip:

      LD A,ZoinhoNewIsoPosFlagFalse
      LD (ZoinhoNewIsoPosFlag),A

; -------------------------------------------------------------

      ; Display Background sprites
      CALL BackgroundStaticDisplay

; -------------------------------------------------------------

      LD A,(StencilCheckSwitch)
      LD H,A

      LD A,StencilCheckDisabled
      LD (StencilCheckSwitch),A

      CALL DisplayMinimapStack

      LD A,H
      LD (StencilCheckSwitch),A

; -------------------------------------------------------------

      LD A,StencilCheckDisabled
      LD (StencilCheckSwitch),A

      ; Display Iso space frame
      CALL DisplayIsoFrame

      LD A,StencilCheckEnabled
      LD (StencilCheckSwitch),A

; -------------------------------------------------------------

      LD A,0x40
      LD (ImmunityWait),A

; -------------------------------------------------------------

      POP DE
      POP HL

      RET

; =============================================================
; Scene Portals
; -------------------------------------------------------------
; Back Left  /\ Back Right
; Front Left \/ Front Right

; =============================================================
; Label: Scene Portal Void
; -------------------------------------------------------------
NextScenePointerVoid EQU 0x0000

; =============================================================
; Memory Alloc: Current Portal Directions
; -------------------------------------------------------------
NextScenePointerPortalBackLeft:   DW NextScenePointerVoid
NextScenePointerPortalFrontRight: DW NextScenePointerVoid
NextScenePointerPortalBackRight:  DW NextScenePointerVoid
NextScenePointerPortalFrontLeft:  DW NextScenePointerVoid

; =============================================================
; Memory Alloc: Locked Portal Direction
; -------------------------------------------------------------
CurrentScenePointer:           DW NextScenePointerVoid
LockedPortalPointer:           DW NextScenePointerVoid
LocalPortalDisplayFlagPointer: DW NextScenePointerVoid

; =============================================================
; Labels: Scene Portal Positions (X,Z), Thresholds (X,Z)
; -------------------------------------------------------------
PortalBackLeftPillarsPos:   DB 0x00, 0x30
                            DB 0x00, 0x50
                            DB 0x00, 0x40 ; Locked Gate
PortalBackLeftThreshold:    DB 0x00, 0x02 ; X range
                            DB 0x30, 0x40 ; Z range
PortalBackLeftTransport:    DB 0x60, 0x40


PortalBackRightPillarsPos:  DB 0x30, 0x08
                            DB 0x50, 0x08
                            DB 0x40, 0x08 ; Locked Gate
PortalBackRightThreshold:   DB 0x30, 0x40 ; X range
                            DB 0x00, 0x02 ; Z range
PortalBackRightTransport:   DB 0x35, 0x60


PortalFrontLeftPillarsPos:  DB 0x30, 0x70
                            DB 0x50, 0x70
                            DB 0x40, 0x70 ; Locked Gate
PortalFrontLeftThreshold:   DB 0x30, 0x40 ; X range
                            DB 0x68, 0x80 ; Z range
PortalFrontLeftTransport:   DB 0x35, 0x08


PortalFrontRightPillarsPos: DB 0x70, 0x30
                            DB 0x70, 0x50
                            DB 0x70, 0x40 ; Locked Gate
PortalFrontRightThreshold:  DB 0x68, 0x80 ; X range
                            DB 0x30, 0x40 ; Z range
PortalFrontRightTransport:  DB 0x08, 0x35

; =============================================================
; Memory Alloc: Zoinho New Position
; -------------------------------------------------------------
ZoinhoNewIsoPosFlag: DB 0x00

ZoinhoNewIsoPosX: DB 0x00
ZoinhoNewIsoPosY: DB 0x00
ZoinhoNewIsoPosZ: DB 0x00

ZoinhoLastIsoPosX: DB 0x00
ZoinhoLastIsoPosY: DB 0x00
ZoinhoLastIsoPosZ: DB 0x00

; =============================================================
; Labels: Zoinho New Position Flag States
; -------------------------------------------------------------
ZoinhoNewIsoPosFlagFalse EQU 0x00
ZoinhoNewIsoPosFlagTrue  EQU 0xFF

; =============================================================
; Routine: Portal threshold check
; -------------------------------------------------------------
PortalThresholdCheck:

      PUSH HL
      PUSH DE

; -------------------------------------------------------------

      LD DE,(NextScenePointerPortalBackRight)

      LD A,D
      OR E
      JR Z,PortalThresholdCheckBackRightSkip

; -------------------------------------------------------------

      LD HL,PortalBackRightThreshold
      LD BC,PortalBackRightTransport
      CALL PortalThresholdStepCheck

PortalThresholdCheckBackRightSkip:

; -------------------------------------------------------------

      LD DE,(NextScenePointerPortalFrontLeft)

      LD A,D
      OR E
      JR Z,PortalThresholdCheckFrontLeftSkip

; -------------------------------------------------------------

      LD HL,PortalFrontLeftThreshold
      LD BC,PortalFrontLeftTransport
      CALL PortalThresholdStepCheck

PortalThresholdCheckFrontLeftSkip:

; -------------------------------------------------------------

      LD DE,(NextScenePointerPortalFrontRight)

      LD A,D
      OR E
      JR Z,PortalThresholdCheckFrontRightSkip

      LD HL,PortalFrontRightThreshold
      LD BC,PortalFrontRightTransport
      CALL PortalThresholdStepCheck

PortalThresholdCheckFrontRightSkip:

; -------------------------------------------------------------

      LD DE,(NextScenePointerPortalBackLeft)

      LD A,D
      OR E
      JR Z,PortalThresholdCheckBackLeftSkip

      LD HL,PortalBackLeftThreshold
      LD BC,PortalBackLeftTransport
      CALL PortalThresholdStepCheck

PortalThresholdCheckBackLeftSkip:

; -------------------------------------------------------------

PortalThresholdCheckEnd:

    POP DE
    POP HL

    RET

; =============================================================
; Routine: Portal threshold step check
; -------------------------------------------------------------
; -> HL: Portal threshold coords
; -> DE: Portal next scene template ID
; -> BC: Portal transport to next position
; -------------------------------------------------------------
PortalThresholdStepCheck:

    PUSH DE
    PUSH BC
    PUSH HL

; -------------------------------------------------------------

    CALL LockedPortalCheck
    JR C,PortalThresholdStepCheckEnd

; -------------------------------------------------------------

    POP HL
    PUSH HL

    LD B,(HL)
    INC HL
    LD C,(HL)
    INC HL

    PUSH HL

    LD HL,0x0001*ATTR_SpriteInstanceIsoPosX
    LD DE,(ZoinhoInstancePointer)

    ADD HL,DE
    EX DE,HL

    POP HL

    LD A,(DE)

    CP B
    JR C,PortalThresholdStepCheckEnd

    CP C
    JR NC,PortalThresholdStepCheckEnd

    LD B,(HL)
    INC HL
    LD C,(HL)

    INC DE
    INC DE

    LD A,(DE)

    CP B
    JR C,PortalThresholdStepCheckEnd

    CP C
    JR NC,PortalThresholdStepCheckEnd

; -------------------------------------------------------------
; Portal threshold check is true

    POP HL
    POP BC
    POP DE

    CALL PortalEnter

    PUSH DE
    PUSH BC
    PUSH HL

; -------------------------------------------------------------

PortalThresholdStepCheckEnd:

    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Portal enter
; -------------------------------------------------------------
; -> DE: Portal next scene template ID
; -> BC: Zoinho next position
; -------------------------------------------------------------
PortalEnter:

    PUSH HL
    PUSH DE
    PUSH BC

; ------------------------------------------------------------

      LD A,(SpriteDataColourAttributeMonochromeColour)
      INC A
      CP ColourPaletteBrightWhite
      JR NZ,PortalEnterRecycleMonochromeColourSkip

      LD A,ColourPaletteBrightMagenta

PortalEnterRecycleMonochromeColourSkip:

      LD (SpriteDataColourAttributeMonochromeColour),A

; ------------------------------------------------------------

    LD (CurrentIsoScene),DE

    LD A,SceneStatusGameplay
    LD (SceneStatus),A

    LD A,ZoinhoNewIsoPosFlagTrue
    LD (ZoinhoNewIsoPosFlag),A

    PUSH BC
    POP HL

    PUSH HL

; -------------------------------------------------------------

    LD HL,(ZoinhoInstancePointer)

    M_OffsetPointer HL, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceIsoPosX

    LD DE,ZoinhoNewIsoPosX

    LDI
    LDI
    LDI

    LD DE,ZoinhoNewIsoPosX

; -------------------------------------------------------------

    POP HL

    LD BC,PortalBackLeftTransport
    XOR A
    SBC HL,BC
    JR NZ,PortalBackLeftTransportSkip

    LD A,(BC)
    LD (DE),A

    JR PortalEnterEnd

PortalBackLeftTransportSkip:

    ADD HL,BC

; -------------------------------------------------------------

    LD BC,PortalBackRightTransport
    XOR A
    SBC HL,BC
    JR NZ,PortalBackRightTransportSkip

    INC BC
    LD A,(BC)
    INC DE
    INC DE
    LD (DE),A

    JR PortalEnterEnd

PortalBackRightTransportSkip:

    ADD HL,BC

; -------------------------------------------------------------

    LD BC,PortalFrontLeftTransport
    XOR A
    SBC HL,BC
    JR NZ,PortalFrontLeftTransportSkip

    INC BC
    LD A,(BC)
    INC DE
    INC DE
    LD (DE),A

    JR PortalEnterEnd

PortalFrontLeftTransportSkip:

; -------------------------------------------------------------

    LD BC,PortalFrontRightTransport

    LD A,(BC)
    LD (DE),A

; -------------------------------------------------------------

PortalEnterEnd:

    LD HL,ActionBeeperTemplate
    CALL PlayBeeper

    CALL SceneInit

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Memory Alloc: Score Strings
; -------------------------------------------------------------
ScoreBooksStr:     DB "0", StrEOS
ScoreLivesStr:     DB "0", StrEOS
ScoreSkullsStr:    DB "0", StrEOS
ScoreAxesStr:      DB "0", StrEOS

ScoreBooksPos     EQU 0x0316
ScoreLivesPos     EQU 0x1E16
ScoreSkullsPos    EQU 0x1B16
ScoreAxesPos      EQU 0x0516

ScoreLessThanZero EQU "/"

; =============================================================
; Routine: Display Iso Frame
; -------------------------------------------------------------
DisplayIsoFrame:

      PUSH HL
      PUSH DE
      PUSH BC

; -------------------------------------------------------------

      LD HL,FrameIsometricStageTemplate
      CALL DisplaySpriteFrameTemplate

; -------------------------------------------------------------

      LD HL,FrameScoreBoardTemplate
      CALL DisplaySpriteFrameTemplate

; -------------------------------------------------------------

      LD A,ColourPaletteBrightWhite

      LD DE,ScoreLivesStr
      LD BC,ScoreLivesPos
      CALL StrPrint

      LD DE,ScoreSkullsStr
      LD BC,ScoreSkullsPos
      CALL StrPrint

      LD DE,ScoreAxesStr
      LD BC,ScoreAxesPos
      CALL StrPrint

      LD DE,ScoreBooksStr
      LD BC,ScoreBooksPos
      CALL StrPrint

; -------------------------------------------------------------

      POP BC
      POP DE
      POP HL

      RET

; =============================================================
; Memory Alloc: Menu index
; -------------------------------------------------------------
MenuIndex: DB 0x00

; =============================================================
; Memory Alloc: Menu index string
; -------------------------------------------------------------
StrMenuIndex: DB CharPointerRight, StrEOS

; =============================================================
; Routine: Menu Index Display
; -------------------------------------------------------------
MenuIndexDisplay:

     LD A,(MenuIndex)
     ADD A,A
     ADD A,0x06

     LD B,0x05
     LD C,A

     LD DE,StrMenuIndex
     LD A,ColourPaletteBrightYellow
     CALL StrPrint

     RET

; =============================================================
; Routine: Menu Index Erase
; -------------------------------------------------------------
MenuIndexErase:

     LD A,(MenuIndex)
     ADD A,A
     ADD A,0x06

     LD B,0x05
     LD C,A

     LD DE,StrSpaceFill
     LD A,ColourPaletteBlack
     CALL StrPrint

     RET

; =============================================================
; Labels: Menu Index Gap and Max Value
; -------------------------------------------------------------
MenuIndexGap: EQU 0x03
MenuIndexMax: EQU 0x07

; =============================================================
; Routine: Menu Index Cycle
; -------------------------------------------------------------
MenuIndexCycle:

     PUSH HL

; -------------------------------------------------------------

     CALL MenuIndexErase

; -------------------------------------------------------------

     LD A,(MenuIndex)
     INC A

MenuIndexCycleGapSkip:

     CP MenuIndexMax
     JR C,MenuIndexCycleThroughSkip

     XOR A

MenuIndexCycleThroughSkip:

     LD (MenuIndex),A

; -------------------------------------------------------------

     CALL MenuIndexDisplay

; -------------------------------------------------------------

     CALL SwapScreenBufferAll

; -------------------------------------------------------------

     POP HL

     RET

; =============================================================
; Routine: Menu - Who Am I
; -------------------------------------------------------------
MenuWhoAmI:

    LD BC,MenuWhoAmIPosition
    LD DE,StrMenuWhoAmI
    CALL ScrollDisplay

; -------------------------------------------------------------

    RET

; =============================================================
; Label: Menu Options - Position
; -------------------------------------------------------------
MenuIndexKeyboard:     EQU 0x00
MenuIndexCursorKeys:   EQU 0x01
MenuIndexInterfaceII:  EQU 0x02

MenuIndexRedefineKeys: EQU 0x03
MenuIndexColour:       EQU 0x04
MenuIndexWhoAmI:       EQU 0x05
MenuIndexAbout:        EQU 0x06

; =============================================================
; Routine: Menu - About
; -------------------------------------------------------------
MenuColour:

    LD A,(SpriteDataColourAttributeChoice)
    CP SpriteDataColourAttributeClash
    JR Z,MenuColourMonochrome

    LD A,SpriteDataColourAttributeClash
    LD (SpriteDataColourAttributeChoice),A

    LD DE,StrMenuEntriesColourClash
    LD BC,MenuColourClashPosition
    LD A,ColourPaletteRainbow
    CALL StrPrint

    JR MenuColourEnd

MenuColourMonochrome:

    LD A,SpriteDataColourAttributeMonochrome
    LD (SpriteDataColourAttributeChoice),A

    LD DE,StrMenuEntriesMonochrome
    LD BC,MenuColourClashPosition
    LD A,ColourPaletteDarkWhite
    CALL StrPrint

; -------------------------------------------------------------

MenuColourEnd:

     CALL SwapScreenBufferAll

; -------------------------------------------------------------

    RET

; =============================================================
; Routine: Menu - About
; -------------------------------------------------------------
MenuAbout:

    LD BC,MenuAboutPosition
    LD DE,StrMenuAbout
    CALL ScrollDisplay

    LD BC,MenuAboutPosition
    LD DE,StrMenuAboutPage2
    CALL ScrollDisplay

    RET

; =============================================================
; Routine: Menu Manager
; -------------------------------------------------------------
MenuManager:

; -------------------------------------------------------------
; Display Menu

MenuManagerInit:

; -------------------------------------------------------------

     CALL ScreenBufferClear

     CALL DisplayMenu
     CALL MenuIndexDisplay

; -------------------------------------------------------------
; Refresh screen display

     CALL SwapScreenBufferAll

; -------------------------------------------------------------
; Init menu music

     LD HL,GreenSleevesBeeperTemplate
     CALL PlayBeeperInterleavedClear

; -------------------------------------------------------------

MenuManagerMusicLoop:

     CALL PlayBeeperInterleaved

; -------------------------------------------------------------
; [SPACE] or [ENTER] key to mute/skip intro music theme

     LD A,KeysSegmentBNMSsSp
     IN A,(SpeccyKeyboardPort)
     AND MaskKeys____Sp
     JR Z,MenuManagerInputGet

     LD A,KeysSegmentHJKLEn
     IN A,(SpeccyKeyboardPort)
     AND MaskKeys____En
     JR Z,MenuManagerInputGet

     JR MenuManagerMusicLoop

; -------------------------------------------------------------
; Get menu input

MenuManagerInputGet:

MenuManagerLoop:

; -------------------------------------------------------------
; [SPACE] key cycle through menu options

     LD A,KeysSegmentBNMSsSp
     IN A,(SpeccyKeyboardPort)
     AND MaskKeys____Sp
     JR NZ,MenuIndexCycleSkip

; Key press hyteresis
MenuIndexSpaceKeyHysteresis:

     LD A,KeysSegmentBNMSsSp
     IN A,(SpeccyKeyboardPort)
     AND MaskKeys____Sp
     JR Z,MenuIndexSpaceKeyHysteresis

     CALL MenuIndexCycle

MenuIndexCycleSkip:

; -------------------------------------------------------------
; [ENTER] key accepts current menu option

     LD A,KeysSegmentHJKLEn
     IN A,(SpeccyKeyboardPort)
     AND MaskKeys____En
     JR Z,MenuManagerOption

; -------------------------------------------------------------

     JR MenuManagerLoop

MenuManagerOption:

MenuIndexEnterKeyHysteresis:

     LD A,KeysSegmentHJKLEn
     IN A,(SpeccyKeyboardPort)
     AND MaskKeys____En
     JR Z,MenuIndexEnterKeyHysteresis

; -------------------------------------------------------------

     LD A,(MenuIndex)

; -------------------------------------------------------------
; Interaface II - define Jump and Fire keys and then play

     CP MenuIndexInterfaceII
     JR NZ,MenuManagerDedefineInterfaceIIJumpFireSkip

     CALL ControlInterfaceIISet

     LD A,MenuDedefineJumpFireKeysInterfaceII
     LD DE,StrInterfaceII
     CALL MenuDedefineJumpFireKeys

     JR MenuManagerGameStart

MenuManagerDedefineInterfaceIIJumpFireSkip:

; -------------------------------------------------------------
; Cursor keys - define Jump and Fire keys and then play

     CP MenuIndexCursorKeys
     JR NZ,MenuManagerDedefineCursorKeysJumpFireSkip

     CALL ControlCursorKeysSet

     LD A,MenuDedefineJumpFireKeysCursor
     LD DE,StrCursorKeys
     CALL MenuDedefineJumpFireKeys

     JR MenuManagerGameStart

MenuManagerDedefineCursorKeysJumpFireSkip:

; -------------------------------------------------------------
; Redefine Keys

     CP MenuIndexRedefineKeys
     JR NZ,MenuManagerRedefineKeysSkip

     CALL MenuRedefineKeys

     JP MenuManagerInit

MenuManagerRedefineKeysSkip:

; -------------------------------------------------------------
; Colour Clash / Monochrome toggle

     CP MenuIndexColour
     JR NZ,MenuManagerColourSkip

     CALL MenuColour

     JR MenuManagerLoop

MenuManagerColourSkip:

; -------------------------------------------------------------
; Check and execute "WHO AM I?" menu option

     CP MenuIndexWhoAmI
     JR NZ,MenuManagerWhoAmISkip

     CALL MenuWhoAmI

     JP MenuManagerInit

MenuManagerWhoAmISkip:

; -------------------------------------------------------------
; Check and execute "ABOUT..." menu option

     CP MenuIndexAbout
     JR NZ,MenuManagerAboutSkip

     CALL MenuAbout

     JP MenuManagerInit

MenuManagerAboutSkip:

; =============================================================
; -------------------------------------------------------------
; Game start

MenuManagerGameStart:

; -------------------------------------------------------------
; Game init and execution

     CALL GameStartNewInit

; -------------------------------------------------------------

MenuManagerGameStartContinue:

     CALL SceneInit

     CALL SceneManager

     CALL GameplayContinueCheck

; -------------------------------------------------------------

     LD A,(SceneStatus)
     CP SceneStatusGameplayContinue
     JR NZ,MenuManagerGameStartContinueSkip

     LD A,SceneStatusGameplay
     LD (SceneStatus),A

     JR MenuManagerGameStartContinue

MenuManagerGameStartContinueSkip:

; -------------------------------------------------------------
; Execute menu again

     JP MenuManagerInit

; =============================================================
; Memory Alloc: Game start possible scenes (4 entry points)
; -------------------------------------------------------------
GameStartNewInitScene:

DW IsoSceneTemplateBreatherBeforeInYourFace
DW IsoSceneTemplatePushingDaisiesEast
DW IsoSceneTemplateBookOfTheDarkForest
DW IsoSceneTemplateGreekColumns

; =============================================================
; Routine: Game start new init
; -------------------------------------------------------------
GameStartNewInit:

     LD HL,ZoinhoDeadBeeperTemplate
     CALL PlayBeeper

; -------------------------------------------------------------
; Reset game scores

     LD A,"0"
     LD (ScoreBooksStr),A

     LD A,"9"
     LD (ScoreLivesStr),A

     LD A,"0"
     LD (ScoreSkullsStr),A

     LD A,"0"
     LD (ScoreAxesStr),A

; -------------------------------------------------------------
; Reposition all collectables and enemies

     LD A,PlacementMapAll

     LD HL,PlacementControlSkulls
     LD (HL),A

     LD HL,PlacementControlBooks
     LD (HL),A

     LD HL,PlacementControlAxes
     LD (HL),A

     LD HL,PlacementControlTreeMonsters
     LD (HL),A

     LD A,D3v1lKillsRequired
     LD (D3v1lKillCounter),A

     LD A,SceneStatusGameplay
     LD (SceneStatus),A

; -------------------------------------------------------------
; Randomly pick one of the 4 entry scenes

     LD A,R
     AND 0x03

     LD H,0x00
     LD L,A

     ADD HL,HL

     LD DE,GameStartNewInitScene

     ADD HL,DE

     LD E,(HL)
     INC HL
     LD D,(HL)

     LD (CurrentIsoScene),DE

; -------------------------------------------------------------
; Enable all locked portals

     LD A,(PortalLocksCount)
     LD B,A

     LD A,SpriteInstanceDisplayFlagTrue

     LD HL,PortalLocksArray+0x0004

GameStartNewInitPortalLocksLoop:

     LD (HL),A

     INC HL
     INC HL
     INC HL
     INC HL
     INC HL

     DJNZ GameStartNewInitPortalLocksLoop

; -------------------------------------------------------------

     RET

; =============================================================
; Alloc: PUBLISHING STRING
; -------------------------------------------------------------
StrPublishing: DB " R.C.NUNES[2023]", StrEOS

; =============================================================
; Routine: Display Menu
; -------------------------------------------------------------
DisplayMenu:

    LD DE,StrMenuTitle
    LD BC,MenuTitlePosition
    LD A,ColourPaletteBrightYellow
    CALL StrPrint

; -------------------------------------------------------------

    LD DE,StrMenuSubtitle
    LD BC,MenuSubtitlePosition
    LD A,ColourPaletteBrightGreen
    CALL StrPrint

; -------------------------------------------------------------

    LD DE,StrKeyboard
    LD BC,MenuGameStartPositionKeyboard
    LD A,ColourPaletteRainbow
    CALL StrPrint

    LD DE,StrCursorKeys
    LD BC,MenuGameStartPositionCursorKeys
    LD A,ColourPaletteRainbow
    CALL StrPrint

    LD DE,StrInterfaceII
    LD BC,MenuGameStartPositionInterfaceII
    LD A,ColourPaletteRainbow
    CALL StrPrint

; -------------------------------------------------------------

    LD DE,StrMenuEntriesRedefineKeys
    LD BC,MenuRefineKeysPosition
    LD A,ColourPaletteRainbow
    CALL StrPrint

; -------------------------------------------------------------

    LD A,(SpriteDataColourAttributeChoice)
    CP SpriteDataColourAttributeClash
    JR NZ,DisplayMenuAttributeMonochrome

    LD DE,StrMenuEntriesColourClash
    LD BC,MenuColourClashPosition
    LD A,ColourPaletteRainbow
    CALL StrPrint
    JR DisplayMenuAttributeSkip

DisplayMenuAttributeMonochrome:

    LD DE,StrMenuEntriesMonochrome
    LD BC,MenuColourClashPosition
    LD A,ColourPaletteDarkWhite
    CALL StrPrint

DisplayMenuAttributeSkip:

; -------------------------------------------------------------

    LD DE,StrMenuEntriesInfo
    LD BC,MenuInfoPosition
    LD A,ColourPaletteRainbow
    CALL StrPrint

; -------------------------------------------------------------

    LD DE,StrMenuInstructions
    LD BC,MenuInstructionsPosition
    LD A,ColourPaletteDarkWhite
    CALL StrPrint

; -------------------------------------------------------------

    LD HL,FrameEntryMenuTemplate
    CALL DisplaySpriteFrameTemplate

; -------------------------------------------------------------

    LD BC,0x3025

    LD L,0x02

EntryMenuFrameHorizontalLoop:

    LD H,0x03

EntryMenuFrameHorizontalSectionLoop:

    LD A,0x06

    LD DE,FramePipeHorizontalSimpleSpriteTemplate

EntryMenuFrameHorizontalSectionMainLoop:

    CALL DisplaySimpleSprite

    EX AF,AF'

    LD A,B
    ADD A,0x08
    LD B,A

    EX AF,AF'

    DEC A
    JR NZ,EntryMenuFrameHorizontalSectionMainLoop

    LD DE,FramePipeHorizontalHighlightSimpleSpriteTemplate
    CALL DisplaySimpleSprite

    LD A,B
    ADD A,0x08
    LD B,A

    DEC H
    JR NZ,EntryMenuFrameHorizontalSectionLoop

    LD BC,0x30B8

    DEC L
    JR NZ,EntryMenuFrameHorizontalLoop

; -------------------------------------------------------------

    LD DE,StrPublishing
    LD BC,0x0817
    LD A,ColourPaletteDarkCyan
    CALL StrPrint

; -------------------------------------------------------------

    LD DE,FramePipeVerticalSimpleSpriteTemplate
    LD BC,0x1830

    LD L,0x02

EntryMenuFrameVerticalLoop:

    LD H,0x11

EntryMenuFrameVerticalSectionLoop:

    CALL DisplaySimpleSprite

    LD A,C
    ADD A,0x08
    LD C,A

    DEC H
    JR NZ,EntryMenuFrameVerticalSectionLoop

    LD DE,FramePipeVerticalRightSimpleSpriteTemplate
    LD BC,0xE030

    DEC L
    JR NZ,EntryMenuFrameVerticalLoop

; -------------------------------------------------------------

    RET

; =============================================================
; Memory Alloc: Collect Item ID
; -------------------------------------------------------------
CollectItemID: DB 0x00

; =============================================================
; Routine: Collect Item
; -------------------------------------------------------------
; -> HL: Placement control pointer
; -> DE: Score pointer
; -> BC: Score position
; -------------------------------------------------------------
ZoinhoCollectItem:

    PUSH HL
    PUSH DE
    PUSH BC

; -------------------------------------------------------------

    LD A,(CollectItemID)
    PUSH AF

; -------------------------------------------------------------
; Reset item placement position

    BIT 3,A
    JR Z,ZoinhoCollectItemHiByteSkip

    INC HL

ZoinhoCollectItemHiByteSkip:

; -------------------------------------------------------------

    LD C,PlacementMask
    AND 0x07

ZoinhoCollectItemMaskLoop:

    JR Z,ZoinhoCollectItemCheck
    SLA C
    DEC A
    JR ZoinhoCollectItemMaskLoop

ZoinhoCollectItemCheck:

    LD A,(HL)
    XOR C
    LD (HL),A

; -------------------------------------------------------------
; Remove Item from scene

    POP AF

    CALL StaticSpriteSearchByID

    CALL ClearDynamicSprite
    CALL RemoveSpriteFromMinimap

    M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag
    LD A,SpriteInstanceDisplayFlagFalse
    LD (DE),A

; -------------------------------------------------------------

    CALL RefreshIsoScene

; -------------------------------------------------------------
; Emmit collect action sound

    LD HL,ActionBeeperTemplate
    CALL PlayBeeper

; -------------------------------------------------------------

    POP BC
    POP DE
    POP HL

; -------------------------------------------------------------

    EX DE,HL
    INC (HL)
    EX DE,HL

    LD A,ColourPaletteBrightWhite
    CALL StrPrint

; -------------------------------------------------------------

    RET

; =============================================================
; Routine: Collect Item
; -------------------------------------------------------------
; -> DE: Sprite instance
; -------------------------------------------------------------
CollectItemPlacement:

    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF

; -------------------------------------------------------------

    LD A,(DE)

    CP CollectItemBaseID
    JR C,CollectItemPlacementEnd

    LD B,A

; -------------------------------------------------------------

    LD C,PlacementMask
    AND 0x07

CollectItemPlacementMaskLoop:

    JR Z,CollectItemPlacementContinue
    SLA C
    DEC A
    JR CollectItemPlacementMaskLoop

CollectItemPlacementContinue:

; -------------------------------------------------------------

    LD A,B
    AND 0xF0

; -------------------------------------------------------------

    CP BookID_0
    JR NZ,CollectItemPlacementBookSkip

    LD HL,PlacementControlBooks

    BIT 3,B
    JR Z,CollectItemPlacement2ndByteBookSkip

    INC HL

CollectItemPlacement2ndByteBookSkip:

    LD A,(HL)
    AND C
    JR Z,CollectItemPlacementRemove

    JR CollectItemPlacementEnd

CollectItemPlacementBookSkip:

; -------------------------------------------------------------

    CP SkullID_0
    JR NZ,CollectItemPlacementSkullSkip

    LD HL,PlacementControlSkulls

    BIT 3,B
    JR Z,CollectItemPlacement2ndByteSkullSkip

    INC HL

CollectItemPlacement2ndByteSkullSkip:

    LD A,(HL)
    AND C
    JR Z,CollectItemPlacementRemove

    JR CollectItemPlacementEnd

CollectItemPlacementSkullSkip:

; -------------------------------------------------------------

    CP AxeID_0
    JR NZ,CollectItemPlacementAxeSkip

    LD HL,PlacementControlAxes

    BIT 3,B
    JR Z,CollectItemPlacement2ndByteAxesSkip

    INC HL

CollectItemPlacement2ndByteAxesSkip:

    LD A,(HL)
    AND C
    JR Z,CollectItemPlacementRemove

    JR CollectItemPlacementEnd

CollectItemPlacementAxeSkip:

; -------------------------------------------------------------

    JR CollectItemPlacementEnd

; -------------------------------------------------------------

CollectItemPlacementRemove:

    CALL RemoveSpriteFromMinimap

    M_OffsetPointer DE, ATTR_SpriteInstanceRoot, ATTR_SpriteInstanceDisplayFlag
    LD A,SpriteInstanceDisplayFlagFalse
    LD (DE),A

; -------------------------------------------------------------

CollectItemPlacementEnd:

    POP AF
    POP BC
    POP DE
    POP HL

    RET

; =============================================================
; Routine: Check whether or not portal is locked
; -------------------------------------------------------------
; -> DE: Scene portal pointer
; <- CF: Carry flag is set if locked
; -------------------------------------------------------------
LockedPortalCheck:

    PUSH HL

; -------------------------------------------------------------

    LD A,D
    OR E
    JR Z,LockedPortalCheckUnlocked

; -------------------------------------------------------------

    LD HL,(LockedPortalPointer)
    LD A,H
    OR L
    JR Z,LockedPortalCheckUnlocked

; -------------------------------------------------------------

    XOR A
    SBC HL,DE
    JR NZ,LockedPortalCheckUnlocked

; -------------------------------------------------------------

    LD HL,(LocalPortalDisplayFlagPointer)

    LD A,(HL)
    CP SpriteInstanceDisplayFlagTrue
    JR NZ,LockedPortalCheckUnlocked

    SCF

    JR LockedPortalCheckEnd

; -------------------------------------------------------------

LockedPortalCheckUnlocked:

    XOR A

; -------------------------------------------------------------

LockedPortalCheckEnd:

    POP HL

    RET

; =============================================================
; Routine: Redefine Keys
; -------------------------------------------------------------
MenuRedefineKeys:

     PUSH DE

; -------------------------------------------------------------

     LD HL,ActionBeeperTemplate
     CALL PlayBeeper

; -------------------------------------------------------------

     CALL ScreenBufferClear

; -------------------------------------------------------------

     LD A,ColourPaletteBrightYellow
     LD BC,0x0105
     LD DE,StrTitleRedefineKeys
     CALL StrPrint

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexUp
     LD DE,StrPointerUp
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexDown
     LD DE,StrPointerDown
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexRight
     LD DE,StrPointerRight
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexLeft
     LD DE,StrPointerLeft
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexJump
     LD DE,StrJump
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexFire
     LD DE,StrFire
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD HL,ZoinhoDeadBeeperTemplate
     CALL PlayBeeper
     CALL PlayBeeper

; -------------------------------------------------------------

     POP DE

     RET

; =============================================================
; Routine: Redefine Keys Display
; -------------------------------------------------------------
;  ->  A : Redefine key index
;  -> DE : Label string pointer
; -------------------------------------------------------------
RedefineKeysDisplay:

     INC C
     INC C
     
     PUSH BC

; -------------------------------------------------------------

     PUSH AF

; -------------------------------------------------------------

     LD A,ColourPaletteBrightCyan
     LD B,0x01
     CALL StrPrint

     POP AF

     PUSH BC
     
     PUSH AF

     CALL SwapScreenBufferAll

; -------------------------------------------------------------

     POP AF
     CALL KeyBoardRedefine

; -------------------------------------------------------------

     POP BC

     LD A,ColourPaletteBrightWhite
     LD B,0x0A
     CALL StrPrint

; -------------------------------------------------------------

     CALL SwapScreenBufferAll

     LD HL,ActionBeeperTemplate
     CALL PlayBeeper

; -------------------------------------------------------------

     POP BC

     RET

; =============================================================
; Label: Cursor v. Joystick
; -------------------------------------------------------------
MenuDedefineJumpFireKeysInterfaceII: EQU 0x00
MenuDedefineJumpFireKeysCursor:      EQU 0x01

; =============================================================
; Routine: Define Jump and Fire keys
; -------------------------------------------------------------
; -> DE: Title
; ->  A: Cursor v Joystick
; -------------------------------------------------------------
MenuDedefineJumpFireKeys:

     PUSH DE

; -------------------------------------------------------------

     PUSH AF

; -------------------------------------------------------------

     LD HL,ActionBeeperTemplate
     CALL PlayBeeper

; -------------------------------------------------------------

     CALL ScreenBufferClear

; -------------------------------------------------------------
; Print Title

     LD A,ColourPaletteBrightYellow
     LD BC,0x0105
     CALL StrPrint

; -------------------------------------------------------------

     POP AF

; -------------------------------------------------------------
; Display Cursor Keys

     CP MenuDedefineJumpFireKeysCursor
     JR NZ,MenuDedefineJumpFireKeysCursorSkip

     LD DE,StrPointerVector

     LD L,0x04

MenuDedefineJumpFireKeysCursorLoop:

     INC C
     INC C

     LD A,ColourPaletteBrightCyan
     LD B,0x01
     CALL StrPrint

     LD A,ColourPaletteBrightWhite
     LD B,0x0A
     CALL StrPrint

     INC DE
     INC DE

     DEC L
     JR NZ,MenuDedefineJumpFireKeysCursorLoop
     
     JR MenuDedefineJumpFireKeysDefineTitleDisplay
     
MenuDedefineJumpFireKeysCursorSkip:

; -------------------------------------------------------------
; Display Joystick

     LD DE,StrPointerVector

     LD L,0x04

MenuDedefineJumpFireKeysJoystickLoop:

     INC C
     INC C

     LD A,ColourPaletteBrightCyan
     LD B,0x01
     CALL StrPrint

     PUSH DE

     LD A,ColourPaletteBrightWhite
     LD B,0x0A
     LD DE,StrJoystick
     CALL StrPrint

     POP DE

     INC DE
     INC DE

     DEC L
     JR NZ,MenuDedefineJumpFireKeysJoystickLoop

; -------------------------------------------------------------
; Define Keys Title Display

MenuDedefineJumpFireKeysDefineTitleDisplay:

     INC C
     INC C

     LD A,ColourPaletteBrightYellow
     LD B,0x01
     LD DE,StrTitleDefineKeys
     CALL StrPrint

; -------------------------------------------------------------

     PUSH BC

     CALL SwapScreenBufferAll

     POP BC

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexJump
     LD DE,StrJump
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD A,RedefinedKeyIndexFire
     LD DE,StrFire
     CALL RedefineKeysDisplay

; -------------------------------------------------------------

     LD HL,ZoinhoDeadBeeperTemplate
     CALL PlayBeeper

; -------------------------------------------------------------

     POP DE

     RET

; =============================================================
; Routine: Gameplay continue check
; -------------------------------------------------------------
GameplayContinueCheck:

   LD A,(SceneStatus)
   CP SceneStatusEnd
   JR Z,GameplayContinueCheckEnd

; -------------------------------------------------------------

   CALL ScreenBufferClear

; -------------------------------------------------------------

   LD A,ColourPaletteBrightYellow
   LD BC,0x0202
   LD DE,StrGameplayContinueQuestion
   CALL StrPrint

   LD A,ColourPaletteBrightGreen
   LD BC,0x0205
   LD DE,StrGameplayContinueOptions
   CALL StrPrint

; -------------------------------------------------------------

   CALL SwapScreenBufferAll

; -------------------------------------------------------------

GameplayContinueCheckKeyLoop:

    LD A,KeysSegmentVCXZCs
    IN A,(SpeccyKeyboardPort)
    AND MaskKeys_C___
    JR NZ,GameplayContinueCheckCSkip

; -------------------------------------------------------------

    LD A,SceneStatusGameplayContinue
    LD (SceneStatus),A

    JR GameplayContinueCheckEnd

; -------------------------------------------------------------

GameplayContinueCheckCSkip:

    ; Go to menu
    LD A,KeysSegmentBNMSsSp
    IN A,(SpeccyKeyboardPort)
    AND MaskKeys__M__
    JR NZ,GameplayContinueCheckKeyLoop

    LD A,SceneStatusMenu
    LD (SceneStatus),A

; -------------------------------------------------------------

GameplayContinueCheckEnd:

   RET