Vim help
========
Ctrl+V					Zeilen Markieren
: s/^/#					Markierte Zeilen bearbeiten
:s/\([^ ]\)  /\1[]
:s/$/Hello world/	Add "Hello world" to end of line
:s/ -/^M-/g		Replace " -" with new line (press Ctl+v and Enter for ^M, before type :set magic)
:s/\S* \S* /\1^M/g	Replace second space with new lin\1^M/g	Replace second space with new linee
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



yy or Y 		to copy the line
p 			to paste the copied or deleted text after the current line
P 			to paste the copied or deleted text before the current line

To copy to clipboard add "set clipboard=unnamedplus " to ~/.vimrc

Rechtschreibprüfung
-------------------
F8 to enable
]s, [s		springt zum nächsten erkannten Fehler, bzw. rückwärts
zg		fügt das Wort unter dem Cursor zur Liste bekannter Wörter hinzu
z=		schlägt Änderung vor 

See http://wiki.ubuntu-forum.de/index.php?title=Vim/Rechtschreibpr%C3%BCfung


Multiple files
--------------
:bn :bp			switch to next/previous file

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
:ls		Show opened files
:Nb		Open file N
:sp filename 	Open filename in horizontal split
:vsp filename 	Open filename in vertical split
Ctrl-w S	Duplicate current window horizontal
Ctrl-w V	Duplicate current window vertical
Ctrl-w Q	Close the current window
Ctrl-w O	Fullscreen close other buffers
Ctrl-w _ Ctrl+W |	Fullscreen
Ctrl-w =		Windows
Ctrl-w x		Swap window with lower one
Ctrl-w R		Rotate windows up
Ctrl-w r		Rotate windows down
Ctrl-w h		Move window very left
Ctrl-w l		Move window very right
Ctrl-w j		Move window very below
Ctrl-w k		Move window very above
Ctrl-h Ctrl-w ← 	Shift focus to split on left of current
Ctrl-l Ctrl-w → 	Shift focus to split on right of current
Ctrl-j Ctrl-w ↓ 	Shift focus to split below the current
Ctrl-k Ctrl-w ↑ 	Shift focus to split above the current
Ctrl-w n+ 	Increase size of current split by n lines
Ctrl-w n- 	Decrease size of current split by n lines

Terminal
========
Ctrl-\ Ctrl-n		Enter normal mode
i			Enter insert mode

https://github.com/ycm-core/YouCompleteMe
=========================================
You could also consider using YCM-Generator to generate the ycm_extra_conf.py file.
See https://github.com/rdnetto/YCM-Generator

sudo apt install vim-youcompleteme vim-addon-manager
vam install youcompleteme
OR
sudo apt install build-essential cmake python3-dev
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

If it fails do to SSLError do the following
-------------------------------------------
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/clangd/cache
wget https://dl.bintray.com/ycm-core/clangd/clangd-10.0.0-x86_64-unknown-linux-gnu.tar.bz2
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer

Formatting rules
----------------
cd ~/work
wget https://github.com/torvalds/linux/raw/master/.clang-format
See https://zed0.co.uk/clang-format-configurator/


Usage
-----
Ctrl+Space	Show possible completions
Ctrl+y		Close completetion menu
\d		Show diagnostic information of err/warn
Ctrl+W Enter	Open :copen item in horizontal split window

