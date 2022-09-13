"YouCompleteMe
"=============
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1

" Do not select anything in the completion with the arrow up and down keys
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
inoremap <expr> <Down>  pumvisible() ? "\<C-E>\<C-O>j" : "\<Down>"
inoremap <expr> <Up>    pumvisible() ? "\<C-E>\<C-O>k" : "\<Up>"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"let g:ycm_filepath_completion_use_working_dir = 0
let g:ycm_global_ycm_extra_conf = '~/beschreibungen/howtos/vim/ycm_extra_conf.py'
"let g:ycm_clangd_args = ['--fallback-style=~/.vim/bundle/YouCompleteMe/linux.clang-format']

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
"let g:ycm_clangd_binary_path = exepath("clangd")

nnoremap <F1> :pclose<CR>:silent YcmCompleter GetDoc<CR>
nnoremap <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F3> :YcmCompleter GoToReferences<CR>
" :copen :cclose


"Autocomplte paths like bash
set wildmenu
set wildmode=list:longest

" Terminal
nnoremap <F4> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
" Add the following lines to ~/.bashrc. With autoshelldir enabled vim will
" listen for the escape secence sent by the terminal
"if [[ -n "$VIM_TERMINAL" ]]; then
"  PROMPT_COMMAND='_vim_sync_PWD'
"  function _vim_sync_PWD() {
"    printf '\033]7;file://%s\033\\' "$PWD"
"  }
"fi
set autoshelldir
tnoremap <F4> <C-A>:terminal<CR>

" Use case sentive search for "/" when capital leters used
set smartcase

let &grepprg='grep -H -n $*'
"map f :silent grep '\b<cword>\b' <CR>:copen<CR>
map f :grep -r -I --include=\*.{c,h,cpp,hpp,ino,py,java} '\b<cword>\b' <CR><CR>:copen<CR>
" grep in current file
map F :grep -a '\b<cword>\b' % <CR><CR>:copen<CR>

set autoread
function! YCMrefresh()
	"Reload changed files
	execute "e!"
	"Open all buffers once to recognice them in YCM
	for i in range(0,50)
		execute "bn"
	endfor
	" jump to first buffer
	execute "1b"
	checktime
endfunction

nnoremap <F5> :call YCMrefresh()<CR>
":YcmForceCompileAndDiagnostics<CR>

nnoremap <F6> :YcmCompleter RefactorRename 
nnoremap <F10> :YcmCompleter FixIt<CR>
" <F11> => Toggle full screen
nnoremap <F12> :YcmCompleter Format<CR>

"Open URLs
"nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR>:redraw!<CR>
" Also open from Ctrl-Alt-Fx terminal
nmap gx :silent execute "!DISPLAY=:0 xdg-open " . shellescape("<cWORD>") . " &"<CR>:redraw!<CR>

"Terminal mode
" Allow to forward Ctrl-W to a application running in the terminal
set termwinkey=<C-A>
" Do not use Esc because it has to be forwarded to vim running in the vim terminal
"tnoremap <Esc> <C-\><C-n>
tnoremap <C-A> <C-\><C-n>
" Paste clipboard into terminal
"TODO blocks Ctrl-V in normal mode to enter block selection mode
"tnoremap <C-S-V> <C-W>"+

" Navigate between vim windows via Alt-Arrows
nnoremap <Esc>[1;3D <C-W>h
nnoremap <Esc>[1;3B <C-W>j
nnoremap <Esc>[1;3A <C-W>k
nnoremap <Esc>[1;3C <C-W>l
tnoremap <Esc>[1;3D <C-A>h
tnoremap <Esc>[1;3B <C-A>j
tnoremap <Esc>[1;3A <C-A>k
tnoremap <Esc>[1;3C <C-A>l

"FORMAT
"======
set colorcolumn=81
"Glib and GStreamer
"set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
" 8 char tabs
"set autoindent noexpandtab tabstop=8 shiftwidth=8
"Mark down
"set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
"ESM
"set tabstop=3 softtabstop=0 expandtab shiftwidth=3 smarttab
"set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab


" Show tabs
"set list
"set listchars=tab:>-

"Arduino files
au BufRead,BufNewFile *.ino set filetype=cpp tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab


"OTHER
"=====
set ruler
set backspace=indent,eol,start
set clipboard=unnamedplus
" Copy
"vmap <F7> :!xclip -f -sel clip -d localhost:10.0<CR>
" Paste
"map <F8> :r!xclip -o -sel clip -d localhost:10.0<CR>

"Not enabled by default on this machine
syntax on

" Highlight unwanted white spaces red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t\|\t\+$/ 
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" vimdiff
function! DiffToggle()
    if &diff
        windo diffoff
    else
        windo diffthis
    endif
endfunction
nnoremap <silent> <F8> :call DiffToggle()<CR>

" Spell Check
let b:myLang=0
let g:myLangList=["nospell","en","de"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F7> :call ToggleSpell()<CR>
imap <F7> <C-o>:call ToggleSpell()<CR>
" See https://vim.fandom.com/wiki/Toggle_spellcheck_with_function_keys

" See https://unix.stackexchange.com/questions/348771/why-do-vim-colors-look-different-inside-and-outside-of-tmux
set background=dark

" ignore case for lower cases search strings
" and respect case for mixed case search strings
set smartcase


" Exclude $ from file path when using gf to open files
set isfname-=$
