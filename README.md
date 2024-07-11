Vim help
========
Ctrl+V					Zeilen Markieren
: s/^/#					Markierte Zeilen bearbeiten
:s/\([^ ]\)  /\1[]
:s/$/Hello world/	Add "Hello world" to end of line
:s/ -/^M-/g		Replace " -" with new line (press Ctl+v and Enter for ^M, before type :set magic)
:s/\S* \S* /\1^M/g	Replace second space with new lin\1^M/g	Replace second space with new linee
&		2  repeat last :s
g&		2  repeat last ":s" on all lines

gcc             Comment out a line
Ctrl+V Shift+I # Esc	Zeilen auskommentieren
Ctrl+V x				Kommentar zeichen entfernen
Ctrl+V D				Zeilen Inhalt löschen aber nicht die Zeilenumbrüche
Shift+V x				Zeilen löschen
u						Letzte Operation Rückgängig
Ctrl+R					Wiederherstellen

G			Zur letzten Zeile springen
0               To first character in the line
$			Zum letzten Zeichen springen
gg			Zur ersten Zeile
NG			Zu Zeile N springen
)               Sentence forward
(               Sentence backwards
}               Paragraph forward
{               Paragraph backwards
|		1  cursor to column N

==		2  filter N lines through "indent" TODO may be auto indention

A		2  append text after the end of the line N times
O		2  begin a new line above the cursor and insert text, repeat N times
o		2  begin a new line underneath the cursor and insert text, repeat N times
J		2  Join N lines; default is 2
gJ		2  join lines without inserting space
x               Delete character under the cursor
X               Delete character left of the cursor
dd              Delete current line
dw              Delete current word
D               Delete to the end of the line
yy or Y 		to copy the line
p 			to paste the copied or deleted text after the current line
P 			to paste the copied or deleted text before the current line

Replace mutliple characters in mutliple lines
    <CTRL-v>   select the area
    c		2  delete highlighted area and start insert

CTRL-G		   display current file name and position

Integer calulations
===================
CTRL-A		2  add N to number at/after cursor
CTRL-X		2  subtract N from number at/after cursor


normal mode for :/? commands
============================
TODO might support all edit modes even vim supports in normal mode
q:		   edit : command-line in command-line window
q/		   edit / command-line in command-line window
q?		   edit ? command-line in command-line window
TODO why is q! for command line not supported

Hex Editor
==========
:%xxd
:set ft=xxd
:%!xxd -r

TODO add keycode for switching between asci and hex view


Rechtschreibprüfung
===================
F8 to enable
]s, [s		springt zum nächsten erkannten Fehler, bzw. rückwärts
zg		fügt das Wort unter dem Cursor zur Liste bekannter Wörter hinzu
z=		schlägt Änderung vor 

See http://wiki.ubuntu-forum.de/index.php?title=Vim/Rechtschreibpr%C3%BCfung


Multiple files
--------------
:bn :bp			switch to next/previous file
:bd             Close current buffer
:ls		Show opened files
:Nb		Open file N
:sp filename 	Open filename in horizontal split
:vsp filename 	Open filename in vertical split
CTRL-W ^	    split current window and edit alternate file N
CTRL-W f	   split window and edit file name under the cursor
CTRL-W F	   split window and edit file name under the cursor and jump to the line number following the file name.
gf		   start editing the file whose name is under the cursor
gF		   start editing the file whose name is under the cursor and jump to the line number following the filename.
gx		   execute application for file name under the cursor (only with |netrw| plugin)
ALT-q	        quit current window (like |:quit|)
ZZ		   write if buffer changed and close window
ZQ		   close window without writing

Suchen
------
/WORD
n			find next word
*			find next word under courser
#			find previous word under courser
Ctrl-O			jump back to the previous (older) location.
Ctrl-I OR Tab		jump forward to the next (newer) location.

^ steht für Strg

Split windows
=============
CTRL-W +	   increase current window height N lines
CTRL-W -	   decrease current window height N lines
CTRL-W <	   decrease current window width N columns
CTRL-W =	   make all windows the same height & width
CTRL-W >	   increase current window width N columns
Ctrl-w O	Fullscreen close other buffers
Ctrl-w _ Ctrl+W |	Fullscreen  (Alt+f and Alt+q)
Ctrl-w =		Windows

CTRL-W H	   move current window to the far left
CTRL-W J	   move current window to the very bottom
CTRL-W K	   move current window to the very top
CTRL-W L	   move current window to the far right
CTRL-W R	   rotate windows upwards N times
CTRL-W r	   rotate windows downwards N times
Ctrl-w x		Swap window with lower one

CTRL-W h	   go to Nth left window (stop at first window)
CTRL-W j	   go N windows down (stop at last window)
CTRL-W k	   go N windows up (stop at first window)
CTRL-W l	   go to Nth right window (stop at last window)
ALT-Arrows     go to window
CTRL-W p	   go to previous (last accessed) window
CTRL-W w	   go to N next window (wrap around)

Switch between tabs
-------------------
gT		   go to the previous tab page
gt		   go to the next tab page
g<Tab>		   go to last accessed tab page
gD		1  go to definition of word under the cursor in current file
gd		1  go to definition of word under the cursor in current function

vimdiff
-------
zj		1  move to the start of the next fold
zk		1  move to the end of the previous fold
zo		   open fold
zc		   close a fold
za		   open a closed fold, close an open fold
zF		   create a fold for N lines
zd		   delete a fold

Terminal
========
Ctrl-\ Ctrl-n		Enter normal mode
i			Enter insert mode

Auto-Completion
===============
#CTRL-W d	   split window and jump to definition under the cursor
#CTRL-W i	   split window and jump to declaration of identifier under the cursor

See https://github.com/github/copilot.vim#getting-started
sudo apt install nodejs
git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim
:Copilot setup


TODO do lookup with GIT in case it is a hash
K		   lookup Keyword under the cursor with 'keywordprg'
TODO check what else is supported for keywordprg

TODO What does it do
CTRL-]		trigger abbreviation

