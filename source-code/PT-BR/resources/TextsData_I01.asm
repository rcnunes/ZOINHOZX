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

    DB "PRONTO PRA COME", CharCCedilha, "AR?", StrEOS

; =============================================================
; Label: Menu - Who Am I - Position
; -------------------------------------------------------------
MenuWhoAmIPosition: EQU 0x0105

; =============================================================
; Memory Alloc: Scroll exit message
; -------------------------------------------------------------
StrScrollDisplayExit:

DB "\n\nPRESSIONE [X]", StrEOS

; =============================================================
; Memory Alloc: Menu - Who Am I - Text
; -------------------------------------------------------------
StrMenuWhoAmI:

DB "VOC", CharECircunflexo, " ", CharEAgudo, " O ZOINHO.\n"
DB "\n"
DB "SEM PERSPECTIVA NA VIDA,\n"
DB "VOC", CharECircunflexo, " SE PERDEU\n"
DB "NO JARDIM DOS TOLOS.\n"
DB "\n"
DB "PROCURE O SABER ESQUECIDO\n"
DB "E LUTE PARA ESCAPAR.\n"
DB "\n"
DB "S", CharOAgudo, " PRA DESCOBRIR\n"
DB "QUE A BRIGA DE FOICE\n"
DB "N", CharATil, "O", " TERMINA NUNCA."
DB StrEOS

; =============================================================
; Label: Menu - About - Position
; -------------------------------------------------------------
MenuAboutPosition: EQU 0x0005

; =============================================================
; Memory Alloc: Menu - About - Text
; -------------------------------------------------------------
StrMenuAbout:

DB "HIST", CharOAgudo, "RIA ORIGINAL, GR", CharAAgudo,"FICOS\n"
DB "E C", CharOAgudo, "DIGO:\n\n"
DB CharCopyRight, "2019-2023 RICARDO C. NUNES\n\n"
DB "ESTA VERS", CharATil, "O ", CharEAgudo, " GR", CharAAgudo, "TIS\n"
DB "E LIVRE PARA USO,\n"
DB "C", CharOAgudo,"PIA E DISTRIBUI", CharCCedilha, CharATil, "O\n"
DB "PARA FINS N", CharATil, "O COMERCIAIS.\n\n"
DB "PARA OS TERMOS DA LICEN", CharCCedilha,"A,\n"
DB "ACESSE O PROJETO NA P", CharAAgudo, "GINA\n"
DB "DO GITHUB:\n"
DB "GITHUB.COM/ZOINHOZX/ZOINHO"
DB StrEOS

StrMenuAboutPage2:

DB "NENHUMA GARANTIA OU SUPORTE\n"
DB "S", CharATil, "O OFERECIDOS.\n\n"
DB "JOGUE POR SUA CONTA E RISCO.\n"
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

MenuSubtitlePosition: EQU 0x0603
StrMenuSubtitle:
DB "NO JARDIM DOS TOLOS\n"
DB StrEOS

; -------------------------------------------------------------

MenuGameStartPosition: EQU 0x0706
StrMenuEntriesGameStart:

MenuGameStartPositionKeyboard: EQU 0x0706
StrKeyboard:
    DB "TECLADO", StrEOS

MenuGameStartPositionCursorKeys: EQU 0x0708
StrCursorKeys:
;    DB "SETAS DO CURSOR\n\n"
    DB "SETAS DO CURSOR", StrEOS

MenuGameStartPositionInterfaceII: EQU 0x070A
StrInterfaceII:
;    DB "INTERFACE II\n\n"
    DB "INTERFACE II", StrEOS

; -------------------------------------------------------------

;MenuRefineKeysPosition: EQU 0x070E
MenuRefineKeysPosition: EQU 0x070C
StrMenuEntriesRedefineKeys:
    DB "REDEFINIR TECLAS", StrEOS

; -------------------------------------------------------------

;MenuColourClashPosition: EQU 0x0710
MenuColourClashPosition: EQU 0x070E
StrMenuEntriesColourClash:
    DB "QUERO FICAR VESGO!", StrEOS

; -------------------------------------------------------------

StrMenuEntriesMonochrome:
    DB "MONOCROM", CharAAgudo, "TICO     ", StrEOS

; -------------------------------------------------------------

;MenuInfoPosition: EQU 0x0712
MenuInfoPosition: EQU 0x0710
StrMenuEntriesInfo:
    DB "QUEM SOU EU?\n\n"
    DB "SOBRE ...", StrEOS

; -------------------------------------------------------------

;MenuInstructionsPosition: EQU 0x0716
MenuInstructionsPosition: EQU 0x0714
StrMenuInstructions:
    DB "[ESP]&[ENT] PRA SEL.", StrEOS

; =============================================================
; Memory Alloc: Game Over
; -------------------------------------------------------------
StrGameOver:

    DB CharTopLeftCorner
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharTopRightCorner, "\n"
    DB CharVertPipe, " J", CharAAgudo," ERA MEU!", CharVertPipe, "\n"
    DB CharBottomLeftCorner
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharHorizPipe, CharHorizPipe, CharHorizPipe
    DB CharBottomRightCorner, "\n"
    DB StrEOS

StrGameOverPos EQU 0x090B

; ---------------------------------------------------------------------------------

; =============================================================
; Label: Book ID #0 - Text Position
; -------------------------------------------------------------
BookText_Position: EQU 0x0005

; =============================================================
; Memory Alloc: Book ID #0 - Text
; -------------------------------------------------------------
StrBookTextID_0:
DB "O CAMINHO ", CharACraseado, " FRENTE", StrNewLine
DB CharEAgudo, " TRAI", CharCCedilha, "OEIRO."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #1 - Text
; -------------------------------------------------------------
StrBookTextID_1:
DB "S", CharOAgudo, " O CONHECIMENTO", StrNewLine
DB "PODE ABRIR O CAMINHO."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #2 - Text
; -------------------------------------------------------------
StrBookTextID_2:
DB "ALGUNS LIVROS", StrNewLine
DB "S", CharATil, "O PERIGOSOS."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #3 - Text
; -------------------------------------------------------------
StrBookTextID_3:
DB "A FLORESTA NEGRA TE ENSINA", StrNewLine
DB "A TEMER AT", CharEAgudo, " AS SOMBRAS."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #4 - Text
; -------------------------------------------------------------
StrBookTextID_4:
DB CharEAgudo, " PRECISO INSISTIR SEMPRE.", StrNewLine
DB StrNewLine
DB "QUEM SABE AT", CharEAgudo, " AS PEDRAS PODEM", StrNewLine
DB "TE ENSINAR ALGO ..."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #5 - Text
; -------------------------------------------------------------
StrBookTextID_5:
DB "NO FIM DA JORNADA", StrNewLine
DB "COME", CharCCedilha, "A A FICAR", StrNewLine
DB "MAIS DURO AINDA."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #6 - Text
; -------------------------------------------------------------
StrBookTextID_6:
DB "A SEGUIR EST", CharAAgudo," SEU DESAFIO", StrNewLine
DB "FINAL.", StrNewLine
DB StrNewLine
DB "SOMENTE ENCARANDO DE FRENTE", StrNewLine
DB "VOC", CharECircunflexo," PODER", CharAAgudo," VENCER.", StrNewLine
DB StrNewLine
DB "... CHEGOU A HORA DE USAR", StrNewLine
DB "O BOT", CharATil, "O DISPARAR."
DB StrEOS

; =============================================================
; Memory Alloc: Book ID #7 - Text
; -------------------------------------------------------------
StrBookTextID_7:
DB "SEU TOLO MORTAL!", StrNewLine
DB StrNewLine
DB StrNewLine
DB "N", CharATil,"O H", CharAAgudo," COMO FUGIR", StrNewLine
DB StrNewLine
DB "DO MEU JARDIM ...", StrNewLine
DB StrNewLine
DB StrNewLine
DB "HA! HA! HA!"
DB StrEOS

; =============================================================
; Memory Alloc: Ending Text
; -------------------------------------------------------------
StrEndingText:
DB "FINALMENTE LIVRE", StrNewLine
DB "DO JARDIM DOS TOLOS,", StrNewLine
DB StrNewLine
DB "ZOINHO PODE AGORA", StrNewLine
DB "PROSSEGUIR EM SUA", StrNewLine
DB "JORNADA ..."
DB StrEOS

; =============================================================
; Memory Alloc: Gameplay continue question
; -------------------------------------------------------------
StrGameplayContinueQuestion:
DB "VOC", CharECircunflexo, " QUER CONTINUAR?", StrEOS

StrGameplayContinueOptions:
DB "[C] PARA CONTINUAR", StrNewLine
DB "[M] PARA MENU", StrEOS
