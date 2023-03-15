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
; INCLUDE - Texts Data
; =================================================================================

; ---------------------------------------------------------------------------------
; Labels: Zoinho custom character set - special characters labels
CharBottomRightCorner EQU 0x10
CharBottomLeftCorner  EQU 0x11
CharTopRightCorner    EQU 0x12
CharTopLeftCorner     EQU 0x13

CharVertPipe  EQU 0x14
CharHorizPipe EQU 0x15

CharScrollLeftTopCorner     EQU 0x16
CharScrollRightTopCorner    EQU 0x17
CharScrollLeftBottomCorner  EQU 0x18
CharScrollRightBottomCorner EQU 0x19

CharFiligrane EQU 0x1A

CharCheckered EQU "$"
CharSolid     EQU "`"

CharAAgudo       EQU "#"
CharACraseado    EQU "%"
CharATil         EQU 0x1B
CharCCedilha     EQU 0x1C
CharECircunflexo EQU "*"
CharEAgudo       EQU 0x1D
CharOAgudo       EQU 0x1E
CharOTil         EQU 0x1F

CharCopyRight EQU "+"

CharPointerLeft  EQU "<"
CharPointerRight EQU ">"
CharPointerUp    EQU "^"
CharPointerDown  EQU "="

CharBtnEnter       EQU "("
CharBtnSpace       EQU ")"
CharBtnCapsShift   EQU ";"
CharBtnSymbolShift EQU "\\"

; =============================================================
; Memory Alloc: Start
; -------------------------------------------------------------
StrStart:

    DB "ARE YOU READY?", StrEOS

; =============================================================
; Label: Menu - Who Am I - Position
; -------------------------------------------------------------
MenuWhoAmIPosition: EQU 0x0105

; =============================================================
; Memory Alloc: Scroll exit message
; -------------------------------------------------------------
StrScrollDisplayExit:

DB "\n\nPRESS [X]", StrEOS

; =============================================================
; Memory Alloc: Menu - Who Am I - Text
; -------------------------------------------------------------
StrMenuWhoAmI:

DB "YOU PLAY AS ZOINHO.\n"
DB "\n"
DB "WITH NO PERSPECTIVE IN LIFE,\n"
DB "YOU BECAME LOST\n"
DB "IN THE GARDEN OF FOOLS.\n"
DB "\n"
DB "SEARCH FOR THE FORGOTTEN\n"
DB "LORE AND TRY TO ESCAPE.\n"
DB "\n"
DB "JUST TO FIND OUT THAT\n"
DB "THE FIGHT NEVER ENDS.\n"
DB StrEOS

; =============================================================
; Label: Menu - About - Position
; -------------------------------------------------------------
MenuAboutPosition: EQU 0x0005

; =============================================================
; Memory Alloc: Menu - About - Text
; -------------------------------------------------------------
StrMenuAbout:

DB "ORIGINAL STORY, ART AND\n"
DB "CODE:\n\n"
DB CharCopyRight, "2019-2023 RICARDO C. NUNES\n\n"
DB "THIS VERSION IS FREE TO USE,\n"
DB "COPY AND DISTRIBUTE\n"
DB "NON-COMMERCIALLY.\n"
DB "\n"
DB "FOR LICENSING DETAILS\n"
DB "PLEASE VISIT\n"
DB "PROJECT GITHUB PAGE:\n"
DB "GITHUB.COM/ZOINHOZX/ZOINHO"
DB StrEOS

StrMenuAboutPage2:

DB "I OFFER NO WARRANTY\n"
DB "OR SUPPORT.\n\n"
DB "PLAY IT AT YOUR OWN RISK.    "
DB StrEOS

; =============================================================
; Memory Alloc: Menu Entries
; -------------------------------------------------------------

MenuTitlePosition: EQU 0x0D00
StrMenuTitle:
DB "ZOINHO\n"
DB CharFiligrane, CharFiligrane, CharFiligrane
DB CharFiligrane, CharFiligrane, CharFiligrane
DB StrEOS

MenuSubtitlePosition: EQU 0x0503
StrMenuSubtitle:
DB "IN THE GARDEN OF FOOLS\n"
DB StrEOS

; -------------------------------------------------------------

MenuGameStartPosition: EQU 0x0706
StrMenuEntriesGameStart:

MenuGameStartPositionKeyboard: EQU 0x0706
StrKeyboard:
    DB "KEYBOARD", StrEOS

MenuGameStartPositionCursorKeys: EQU 0x0708
StrCursorKeys:
;    DB "SETAS DO CURSOR\n\n"
    DB "CURSOR KEYS", StrEOS

MenuGameStartPositionInterfaceII: EQU 0x070A
StrInterfaceII:
;    DB "INTERFACE II\n\n"
    DB "INTERFACE II", StrEOS

; -------------------------------------------------------------

;MenuRefineKeysPosition: EQU 0x070E
MenuRefineKeysPosition: EQU 0x070C
StrMenuEntriesRedefineKeys:
    DB "REDEFINE KEYS", StrEOS

; -------------------------------------------------------------

;MenuColourClashPosition: EQU 0x0710
MenuColourClashPosition: EQU 0x070E
StrMenuEntriesColourClash:
    DB "I LOVE COLOUR CLASH!", StrEOS

; -------------------------------------------------------------

StrMenuEntriesMonochrome:
    DB "MONOCHROME          ", StrEOS

; -------------------------------------------------------------

;MenuInfoPosition: EQU 0x0712
MenuInfoPosition: EQU 0x0710
StrMenuEntriesInfo:
    DB "WHO AM I?\n\n"
    DB "ABOUT...", StrEOS

; -------------------------------------------------------------

;MenuInstructionsPosition: EQU 0x0716
MenuInstructionsPosition: EQU 0x0714
StrMenuInstructions:
    DB "[SP]&[ENT] TO SELECT", StrEOS

; =============================================================
; Memory Alloc: Game Over
; -------------------------------------------------------------
StrGameOver:

    DB CharTopLeftCorner
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe;, CharHorizPipe;, CharHorizPipe
    DB CharTopRightCorner, "\n"
    DB CharVertPipe, "GAME OVER!", CharVertPipe, "\n"
    DB CharBottomLeftCorner
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe;, CharHorizPipe;, CharHorizPipe
    DB CharBottomRightCorner, "\n"
    DB StrEOS

StrGameOverPos EQU 0x0A0B

; ---------------------------------------------------------------------------------

; =============================================================
; Label: Book ID #0 - Text Position
; -------------------------------------------------------------
BookText_Position: EQU 0x0005

; =============================================================
; Memory Alloc: Book ID #0 - Text
; -------------------------------------------------------------
StrBookTextID_0:
DB "THE PATH AHEAD IS", StrNewLine
DB "TREACHEROUS."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #1 - Text
; -------------------------------------------------------------
StrBookTextID_1:
DB "ONLY KNOWLEDGE CAN", StrNewLine
DB "OPEN YOUR PATH."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #2 - Text
; -------------------------------------------------------------
StrBookTextID_2:
DB "SOME BOOKS ARE", StrNewLine
DB "DANGEROUS."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #3 - Text
; -------------------------------------------------------------
StrBookTextID_3:
DB "THE DARK FOREST TEACHES YOU", StrNewLine
DB "TO FEAR YOUR OWN SHADOW."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #4 - Text
; -------------------------------------------------------------
StrBookTextID_4:
DB "ALWAYS PUSH AHEAD.", StrNewLine
DB StrNewLine
DB "EVEN ROCKS IN YOUR PATH", StrNewLine
DB "CAN TEACH YOU SOMETHING."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #5 - Text
; -------------------------------------------------------------
StrBookTextID_5:
DB "AT THE END", StrNewLine
DB "IT GETS TOUGHER."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #6 - Text
; -------------------------------------------------------------
StrBookTextID_6:
DB "BEFORE YOU IS YOUR", StrNewLine
DB "FINAL CHALLENGE.", StrNewLine
DB StrNewLine
DB "ONLY BY FACING YOUR FEARS", StrNewLine
DB "YOU'LL BE ABLE TO WIN.", StrNewLine
DB StrNewLine
DB "...IT'S TIME TO USE", StrNewLine
DB "THE FIRE BUTTON."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #7 - Text
; -------------------------------------------------------------
StrBookTextID_7:
DB "YOU, MORTAL FOOL!", StrNewLine
DB StrNewLine
DB "THERE'S NO ESCAPE FROM", StrNewLine
DB "MY GARDEN...", StrNewLine
DB StrNewLine
DB "HAHAHA!"
DB StrEOS

; =============================================================
; Memory Alloc: Ending Text
; -------------------------------------------------------------
StrEndingText:
DB "AT LAST FREE FROM", StrNewLine
DB "THE GARDEN OF FOOLS,", StrNewLine
DB StrNewLine
DB "ZOINHO CAN NOW PROCEED", StrNewLine
DB "ON HIS JOURNEY..."
DB StrEOS

; =============================================================
; Memory Alloc: Gameplay continue question
; -------------------------------------------------------------
StrGameplayContinueQuestion:
DB "CONTINUE?", StrEOS

StrGameplayContinueOptions:
DB "[C] CONTINUE", StrNewLine
DB "[M] BACK TO MENU", StrEOS
