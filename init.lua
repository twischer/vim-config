-- Execute the following commands to install packer.vim
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- :packadd packer.nvim

local use = require('packer').use
require('packer').startup(function()
  --use 'wbthomason/packer.nvim'
  --use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  --use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  --use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  --use 'hrsh7th/cmp-buffer'
  --use 'hrsh7th/cmp-path'
  --use 'hrsh7th/cmp-cmdline'
  --use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  --use 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- Advanced sytax highlighting
  use 'nvim-treesitter/nvim-treesitter'
  run = ':TSUpdate'
  -- GIT diff viewer
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- Fast jump to words simular to kumping to links in vimium for Firefox
  -- TODO test it later
  --use {
  --  'phaazon/hop.nvim',
  --  branch = 'v2', -- optional but strongly recommended
  --  config = function()
  --    -- you can configure Hop the way you like here; see :h hop-config
  --    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --  end
  --}
  -- Uncomment to update all plugins
  --require('packer').sync()
end)

-- Auto-completion
-- See https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
-- Add additional capabilities supported by nvim-cmp

-- TODO uncomment to enabel
--local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--local lspconfig = require('lspconfig')
--
---- Enable some language servers with the additional completion capabilities offered by nvim-cmp
--local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
--for _, lsp in ipairs(servers) do
--  lspconfig[lsp].setup {
--    -- on_attach = my_custom_on_attach,
--    capabilities = capabilities,
--  }
--end
--
---- luasnip setup
--local luasnip = require 'luasnip'
--
---- nvim-cmp setup
--local cmp = require 'cmp'
--cmp.setup {
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end,
--  },
--  mapping = cmp.mapping.preset.insert({
--    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<CR>'] = cmp.mapping.confirm {
--      behavior = cmp.ConfirmBehavior.Replace,
--      select = true,
--    },
--    ['<Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--    ['<S-Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--  }),
--  sources = {
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--  },
--}
---- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--  sources = cmp.config.sources({
--    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--  }, {
--    { name = 'buffer' },
--  })
--})
--
---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline({ '/', '?' }, {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  })
--})


-- Terminal
-- The terminal can be exited with Alt+q
-- Open the terminal underneath the current window
-- Make it modifiable to allow modifiaction and copy pasting modified version
local terminalCommand = ':split<CR><C-w><Down>:terminal<CR>:set modifiable<CR>i'
vim.keymap.set('n', '<F4>', ":let $VIM_DIR=expand('%:p:h')<CR>"..terminalCommand.."cd $VIM_DIR<CR>")
-- Support to execute command in terminal but staying in normal mode
-- TODO define command to copy modified command, clean the old one, insert the new one and execute it
-- TODO cannot be used because copen selection does not work anymore
--vim.keymap.set('n', '<CR>', 'i<CR><C-\\><C-N>')
-- Add the following lines to ~/.bashrc. With autoshelldir enabled vim will
-- listen for the escape sequence sent by the terminal
--if [[ -n "$VIM_TERMINAL" ]]; then
--  PROMPT_COMMAND='_vim_sync_PWD'
--  function _vim_sync_PWD() {
--    printf '\033]7;file://%s\033\\' "$PWD"
--  }
--fi
-- TODO set autoshelldir
vim.keymap.set('t', '<F4>', '<C-\\><C-N>'..terminalCommand)
-- TODO support command to remove last directory (everything to the left till "/")

-- Use case sentive search for "/" when capital leters used
vim.opt.ignorecase = true
-- Ignore case when search string is lower case
vim.opt.smartcase = true

vim.cmd("let &grepprg='grep -H -n $*'")
-- TODO maybe there is already a solution available in neovim
-- grep in all files of current working directory
vim.keymap.set('n', 'f', ":grep -r -I --include=\\*.{c,h,cc,cpp,hpp,ino,py,java,kt} '\\b<cword>\\b' <CR><CR>:copen<CR>")
-- grep in current file
vim.keymap.set('n', 'F', ":grep -a '\\b<cword>\\b' % <CR><CR>:copen<CR>")

-- TODO set autoread
-- TODO function! YCMrefresh()
-- TODO    "Reload changed files
-- TODO    execute "e!"
-- TODO    "Open all buffers once to recognice them in YCM
-- TODO    for i in range(0,50)
-- TODO    	execute "bn"
-- TODO    endfor
-- TODO    " jump to first buffer
-- TODO    execute "1b"
-- TODO    checktime
-- TODO endfunction

--Open URLs
-- TODO Also open from Ctrl-Alt-Fx terminal
-- TODO Currently not required because the color schem in Ctrl-Alt-Fx terminal is quite bad
-- nmap gx :silent execute "!DISPLAY=:0 xdg-open " . shellescape("<cWORD>") . " &"<CR>:redraw!<CR>

--Terminal mode
-- Do not use Esc because it has to be forwarded to vim running in the vim terminal
--tnoremap <Esc> <C-\><C-n>
vim.keymap.set('t', '<C-A>', '<C-\\><C-n>')
-- Paste clipboard into terminal
--TODO blocks Ctrl-V in normal mode to enter block selection mode
--tnoremap <C-S-V> <C-W>"+

-- Navigate between vim windows via Alt-Arrows
vim.keymap.set('n', '<A-Left>',  '<C-W>h')
vim.keymap.set('n', '<A-Down>',  '<C-W>j')
vim.keymap.set('n', '<A-Up>',    '<C-W>k')
vim.keymap.set('n', '<A-Right>', '<C-W>l')
-- Do not stay in insert mode with <C-o> because newly selected window will also being in insert mode
vim.keymap.set('i', '<A-Left>',  '<Esc><C-W>h')
vim.keymap.set('i', '<A-Down>',  '<Esc><C-W>j')
vim.keymap.set('i', '<A-Up>',    '<Esc><C-W>k')
vim.keymap.set('i', '<A-Right>', '<Esc><C-W>l')
-- No need to keep the terminal in insert mode because pasting is also possible in normal mode
vim.keymap.set('t', '<A-Left>',  '<C-\\><C-N><C-W>h')
vim.keymap.set('t', '<A-Down>',  '<C-\\><C-N><C-W>j')
vim.keymap.set('t', '<A-Up>',    '<C-\\><C-N><C-W>k')
vim.keymap.set('t', '<A-Right>', '<C-\\><C-N><C-W>l')

-- Alt-f opens current buffer in new tab => fullscreen on
vim.keymap.set('n', '<A-f>', ':execute "tab sb ".bufnr("%")<CR>')
vim.keymap.set('i', '<A-f>', '<C-o>:execute "tab sb ".bufnr("%")<CR>')
vim.keymap.set('t', '<A-f>', '<C-\\><C-N>:execute "tab sb ".bufnr("%")<CR>i')
-- Do not write the file because it might be buffer without a file name
-- Therefore the command would fail
vim.keymap.set('n', '<A-q>', ':q<CR>')
vim.keymap.set('n', '<A-x>', ':wqa<CR>')
vim.keymap.set('i', '<A-q>', '<Esc>:q<CR>')
vim.keymap.set('t', '<A-q>', '<C-\\><C-N>:q<CR>i')

--FORMAT
--======
vim.opt.colorcolumn = '81'
--Glib and GStreamer
--set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
-- 8 char tabs
--set autoindent noexpandtab tabstop=8 shiftwidth=8
--Mark down
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Convert Tab to spaces
vim.opt.expandtab = true
--ESM
--set tabstop=3 softtabstop=0 expandtab shiftwidth=3 smarttab
--set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab


-- Show tabs
--set list
--set listchars=tab:>-

--Arduino files
-- TODO au BufRead,BufNewFile *.ino set filetype=cpp tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab


--OTHER
--=====
-- TODO set ruler
-- TODO set backspace=indent,eol,start
vim.opt.clipboard = "unnamedplus"
-- Copy
--vmap <F7> :!xclip -f -sel clip -d localhost:10.0<CR>
-- Paste
--map <F8> :r!xclip -o -sel clip -d localhost:10.0<CR>
-- Do not copy data to clipboard when using d
vim.keymap.set({'n', 'x'}, 'd', '"_d')
-- Select all with \a
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Highlight unwanted white spaces red
-- TODO convert into LUA
vim.cmd [[
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$\| \+\ze\t\|\t\+$/ 
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
]]

-- vimdiff
-- TODO convert into LUA
vim.cmd [[
    function! DiffToggle()
        if &diff
            windo diffoff
        else
            windo diffthis
        endif
    endfunction
    nnoremap <silent> <F8> :call DiffToggle()<CR>
]]

-- Spell Check
-- TODO convert into LUA
vim.cmd [[
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
]]
vim.keymap.set('n', '<F7>', ':call ToggleSpell()<CR>')
vim.keymap.set('i', '<F7>', '<C-o>:call ToggleSpell()<CR>')
-- See https://vim.fandom.com/wiki/Toggle_spellcheck_with_function_keys

-- See https://unix.stackexchange.com/questions/348771/why-do-vim-colors-look-different-inside-and-outside-of-tmux
-- This does not change the color in rescue terminal mode
--vim.opt.background = 'dark'

-- Exclude $ from file path when using gf to open files
-- TODO convert into LUA
vim.cmd('set isfname-=$')

-- Start always with split screen
--vim.cmd(':vsplit')

-- HowTo vimscript to LUA
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/#editor-settings
-- Further reading
-- https://github.com/nanotee/nvim-lua-guide

