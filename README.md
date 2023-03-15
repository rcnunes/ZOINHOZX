# PROJECT:
ZOINHO - IN THE GARDEN OF FOOLS

# SHORT DESCRIPTION:  

"Zoinho - In The Garden of Fools" is a homebrew free game for 8 bit computers based on or compatible with the Sinclair ZX Spectrum 48K.

# GETTING STARTED:

This is a Z80 assembly code project, with additional BASIC code, targetted for the 8bit micro computer Sinclair ZX Spectrum 48K.

All the necessary Z80 assembly code is provided in .ASM format files, including all the game resources / assets already also encoded in assembly code. 

All Z80 assembly source code for this game was written targetting the syntax and functionalities provided by the "PASMO Z80 ASSEMBLER" by (C) 2004-2022 Julian Albo. 

The game's raw graphical assets are also provided for viewing and editing via the application "ZX-PaintBrush" by (C) Claus Jahn.

# PREREQUISITES:

You will have to setup your own IDE environment, i.e. using VSCode to view and edit and build the Z80 assembly code. But you can always use any simple text editor and build everything via the command line interface, if you want to.

NB: If you wish to use other Z80 Assembler, other than PASMO, you may need to adjust the code syntax and some macros implementation -- PASMO is mostly compliant with the classic Z80 Macro Assembler syntax. 

Some resource and executable files are provided in Sinclair ZX Spectrum tape format (.TAP) and may be used to execute or else load the game, or its parts, into either an emulator or else a real compatible machine accordingly.

The Sinclair ZX Spectrum BASIC loader is also provided in tape format (.TAP).

All tape format files (.TAP) may be viewed and edited using the applications "ZX-Edit" and "ZX-BlockEdit" by (C) Claus Jahn.

# INSTALLING:

You should install "PASMO Z80 ASSEMBLER" by (C) 2004-2022 Julian Albo (https://pasmo.speccy.org/), or any other Z80 Assembler you wish to use.

If you want to edit raw graphical assets, I suggest you should install the whole suite of applications from Claus Jahn, or at least the application "ZX-PaintBrush".

If you want to edit tape format files (.TAP), you will also need to install "ZX-PaintBrush", "ZX-Edit" and "ZX-BlockEdit" from Claus Jahn too.

NB: Unfortunately, it seems Claus Jahn has stopped maintaining his suite of tools and its host web page. You will have to look for copies of it in Sinclair ZX Spectrum related web repositories.

# DEPLOYMENT:

This version provides all the source code, raw assets and executables.

# BUILD WITH:

To build the whole source code you should copy and paste the main folder including its resources sub-folder.

Just build file Zoinho.asm, all dependencies are defined in this file's include statement list. The resulting build (Zoinho.tap) should contain the entire game.

To build the whole executable, including the BASIC loader and loading screen, you will have to stitch all 3 following .TAP files together in a single .TAP file:

zoinho-BASIC-loader.tap
ZoinhoLoadingScreen.tap
Zoinho.tap

NB: Application "ZX-BlockEdit" can be used to stitch all these .TAP files together in the given sequence.

# CONTRIBUTING:

N/A yet.

# VERSIONING:

1.0.0 - initial release

# AUTHORS:

Ricardo C. Nunes - all source code, resources and assets (creative work). 

# LICENSES:

This project is licensed under the following licenses:

1) Source code and game resources: GNU General Public License v3.0 (gpl-3.0)
2) Creative work / content: Creative Commons Attribution-NonCommercial-ShareAlike 4.0  (CC BY-NC-SA-4.0)

# ACKNOWLEDGEMENTS:

Thank you Sir Clive Sinclair for creating the ZX Spectrum 8 bit computer.

Thanks to the ZX Spectrum world wide comunitiy and to everyone else, who to this day supports this wonderful 8 bit computer with hardware, knowledge, resources, emulators, developing tools and etc. 

