-- Execute the following commands to install packer.vim
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- :packadd packer.nvim
-- For installing/updating plugins uncomment sync() call at the end once

--local use = require('packer').use
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  --use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  --use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  --use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  --use 'hrsh7th/cmp-buffer'
  --use 'hrsh7th/cmp-path'
  --use 'hrsh7th/cmp-cmdline'
  --use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  --use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Advanced syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate' -- Fixed: properly contained inside the plugin table block
  }
  
  -- GIT diff viewer
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Fast jump to words similar to jumping to links in vimium for Firefox
  --use {
  --  'phaazon/hop.nvim',
  --  branch = 'v2',
  --  config = function()
  --    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --  end
  --}

  --use 'subnut/nvim-ghost.nvim'

    use {
      'nvim-telescope/telescope.nvim',
      tag = 'v0.2.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

  -- TODO Uncomment to install/update all plugins
  -- require('packer').sync()
end)


-- Auto-completion
-- See https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
-- Add additional capabilities supported by nvim-cmp

-- TODO uncomment to enable
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


vim.keymap.set('n', 'ZZ', '<cmd>w | bd<CR>', { silent = true })

-- Cycle through MRU (Most Recently Used) buffers
-- See escape sequence in ~/.config/keyd/app.conf
local builtin = require('telescope.builtin')
local open_telescope = function()
  builtin.buffers({
    sort_lastused = true,
    ignore_current_buffer = true,
    attach_mappings = function(_, map)
      -- zum nächsten Buffer in der Liste springen
      map('n', '<C-Tab>', require('telescope.actions').move_selection_next)
      map('i', '<C-Tab>', require('telescope.actions').move_selection_next)
      -- zurückspringen
      map('n', '<C-S-Tab>', require('telescope.actions').move_selection_previous)
      map('i', '<C-S-Tab>', require('telescope.actions').move_selection_previous)
      return true
    end,
  })
end
vim.keymap.set({ "n", "i", "t" }, '<C-Tab>', open_telescope)

-- Terminal
vim.keymap.set({ "n", "i", "t" }, "<C-t>", function()
  local current_dir = vim.fn.expand("%:p:h")
  if vim.fn.isdirectory(current_dir) == 0 then
    current_dir = vim.fn.getcwd()
  end
  vim.cmd.lcd(current_dir)
  vim.cmd.terminal()
  vim.cmd("startinsert")
end)
-- TODO :set modifiable
-- Switch from terminal mode to normal mode by Ctrl+e
vim.keymap.set('t', '<C-e>', '<C-\\><C-n>')
-- Execute terminal command when enter pressed in normal mode
vim.keymap.set('n', '<CR>', 'i<CR>')

-- TODO support command to remove last directory (everything to the left till "/")

vim.opt.relativenumber = true
-- Use case sensitive search for "/" when capital letters used
vim.opt.ignorecase = true
-- Ignore case when search string is lower case
vim.opt.smartcase = true

-- Disable mouse support
vim.opt.mouse = ""

vim.cmd("let &grepprg='grep -H -n $*'")
-- TODO maybe there is already a solution available in neovim
-- grep in all files of current working directory
--vim.keymap.set('n', 'f', ":grep -r -I --include=\\*.{c,h,cc,cpp,hpp,ino,py,java,kt} '\\b<cword>\\b' <CR><CR>:copen<CR>")
-- grep in current file
--vim.keymap.set('n', 'F', ":grep -a '\\b<cword>\\b' % <CR><CR>:copen<CR>")

-- Automatically reload files changed outside Neovim
vim.opt.autoread = true

--Open URLs
-- TODO Also open from Ctrl-Alt-Fx terminal
-- TODO Currently not required because the color schem in Ctrl-Alt-Fx terminal is quite bad
-- nmap gx :silent execute "!DISPLAY=:0 xdg-open " . shellescape("<cWORD>") . " &"<CR>:redraw!<CR>

--FORMAT
--======
vim.opt.colorcolumn = '81'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Convert Tab to spaces
vim.opt.expandtab = true

-- Set up Arduino (.ino) file configuration via Lua autocmd
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ino",
  callback = function()
    vim.opt_local.filetype = "cpp"
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

--OTHER
--=====
-- TODO set ruler
-- TODO set backspace=indent,eol,start
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('i', '<C-v>', '<Esc>pi')
vim.keymap.set('t', '<C-v>', '<C-\\><C-n>pi')
-- Do not copy data to clipboard when using d
vim.keymap.set({'n', 'x'}, 'd', '"_d')
-- Select all 
vim.keymap.set('n', '<Space>a', ':keepjumps normal! ggVG<cr>')

-- Highlight unwanted white spaces red
-- TODO disable for terminal
-- TODO convert into LUA
--vim.cmd [[
--    highlight ExtraWhitespace ctermbg=red guibg=red
--    match ExtraWhitespace /\s\+$\| \+\ze\t\|\t\+$/ 
--    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
--    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
--    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
--    autocmd BufWinLeave * call clearmatches()
--]]

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

