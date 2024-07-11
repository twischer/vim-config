Cheat sheet https://gist.github.com/azadkuh/5d223d46a8c269dadfe4

R			Ersetzten modus (Kann auch im Einfügen modus mit [Einfg] umgeschaltet werden)
Ctrl+V					Zeilen Markieren
:grep PATTERN % :copen	Search in current file for PATTERN and open in quickfix bar
:s/^/#					Markierte Zeilen bearbeiten
:s/\([^ ]\)  /\1[]
:s/$/Hello world/	Add "Hello world" to end of line
:s/ -/^M-/g		Replace " -" with new line (press Ctl+v and Enter for ^M, before type :set magic)
:s/\S* \S* /\1^M/g	Replace second space with new lin\1^M/g	Replace second space with new linee
:g/PATTERN/d            Delete maching line
:g/START/,/END/d            Delete maching line block
Ctrl+V Shift+I # Esc	Zeilen auskommentieren
Ctrl+V x				Kommentar zeichen entfernen
Ctrl+V D				Zeilen Inhalt löschen aber nicht die Zeilenumbrüche
Shift+V x				Zeilen löschen
u						Letzte Operation Rückgängig
Ctrl+R					Wiederherstellen

G			Zur letzten Zeile springen
$			Zum letzten Zeichen springen
gg			Zur ersten Zeile
NG			Zu Zeile N springen
w/W			Jump to beginning of next word/non blank word
b/B			Jump to beginning of previous word/non blank word
e/E			Move to end of word
%			Move to corresponding opening/closing bracket
|			Move to the n-th column

gf			Open file under courser
Ctrl+w gf		Open file in new tab
Ctrl+w gF		Open file in new tab and jump to line number
Ctrl+]			Follow link (e.g in :help)

TODO tabs gt, gT or #gt # is a number

yy or Y 		to copy the line
yiw			copy word under courser
yiW			copy words not including space under courser
Byt$			copy from beginning till $ (e.g. path in terminal)
yi(
viw			select word under courser
vi(			select text between ( and ) excluding ( and )
vi"
vi'
va(			select text between ( and ) including ( and )
p 			to paste the copied or deleted text after the current line
P 			to paste the copied or deleted text before the current line

diw			Cut word into clipboard
ciw			Change word under courser and enter insert mode to start typing
cit			Change inner tag <h2>Sample Title</h2> => <h2></h2>

To copy to clipboard add "set clipboard=unnamedplus " to ~/.vimrc


:echo Ctrl-R Ctrl-W		Copy word under cursor
:echo printf('%x', ^R^W)	Convert number under cursor into hex

Hex mode
========
:%xxd
:set ft=xxd
:%!xxd -r

Terminal mode
=============
$ vim -c ':term ++curwin'
Ctrl+W N	Enter normal mode for copy&paste
Ctrl+W Ctrl+C	Send Ctrl+C to the running command
i		Enter insert mode to insert commands

Edit current line in $EDITOR
-----------------------------
set -o vi
ESC
v		Open EDITOR

#		Add # before command and Enter
k		Use last command
2k		Use command before last command

See https://catonmat.net/ftp/bash-vi-editing-mode-cheat-sheet.txt

Rechtschreibprüfung
-------------------
F8 to enable
]s, [s		springt zum nächsten erkannten Fehler, bzw. rückwärts
zg		fügt das Wort unter dem Cursor zur Liste bekannter Wörter hinzu
z=		schlägt Änderung vor 

See http://wiki.ubuntu-forum.de/index.php?title=Vim/Rechtschreibpr%C3%BCfung


Suchen
------
/WORD
:g/WORD/			show all occurence of current file
n			Search same direction
N			Search opisit direction
~				Change case of character under courser
*				find next word under courser
#				find previous word under courser
Ctrl-O				jump back to the previous (older) location.
Ctrl-I OR Tab			jump forward to the next (newer) location.
:vim pattern **/*.c		grep for string in *.c files recursivly from working directory
:copen				Open findings of last match
:cn				Jump to next finding
:cnf				Jump to next finding in next file
^ steht für Strg

Split windows
=============
:ls		Show opened files
:Nb		Open file N
:b NAME		Open file NAME
:bm		Open next modified file
:n filename	Open filename in current window
:e		Reload file
:sp filename 	Open filename in horizontal split
:vsp filename 	Open filename in vertical split
Ctrl-w s	Duplicate current window horizontal
Ctrl-w v	Duplicate current window vertical
Ctrl-w q	Close the current window
:qa             Close all files and windows
Ctrl-w o	Fullscreen
Ctrl-w h Ctrl-w ← 	Shift focus to split on left of current
Ctrl-w l Ctrl-w → 	Shift focus to split on right of current
Ctrl-w j Ctrl-w ↓ 	Shift focus to split below the current
Ctrl-w k Ctrl-w ↑ 	Shift focus to split above the current
Ctrl-w n+ 	Increase size of current split by n lines
Ctrl-w n- 	Decrease size of current split by n lines
:winc ...   Alternative to Ctrl-w ...

vimdiff
=======
do	get changes from other window into the current window
dp	put the changes from current window into the other window
]c	jump to the next change
[c	jump to the previous change
zo	open fold
zc	close fold

:set diffopt+=iwhite	Ignore whitespace diffs

https://github.com/ycm-core/YouCompleteMe
=========================================
You could also consider using YCM-Generator to generate the ycm_extra_conf.py file.
See https://github.com/rdnetto/YCM-Generator

sudo apt install build-essential cmake python3-dev
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git checkout origin/master
git submodule update --init --recursive
vim +PluginInstall +qall

If it fails due to SSLError do the following
--------------------------------------------
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/clangd/cache
wget https://dl.bintray.com/ycm-core/clangd/clangd-10.0.0-x86_64-unknown-linux-gnu.tar.bz2
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer

Formatting rules
----------------
cd ~/work
wget https://github.com/torvalds/linux/raw/master/.clang-format
cd ~/work/gstreamer
wget https://gitlab.apertis.org/pkg/target/rhosydd/-/raw/master/.clang-format
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

See https://zed0.co.uk/clang-format-configurator/


Usage
-----
Ctrl+Space	Show possible completions
Ctrl+y		Close completetion menu
\d		Show diagnostic information of err/warn
Ctrl+W Enter	Open :copen item in horizontal split window

