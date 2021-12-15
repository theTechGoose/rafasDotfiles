"                                    ________
"                                  |\\#######\
"                                  |#\\#######\
"                                  |##\\#######\
"                                  |###\\#######\
"                                  #####\\#######\
"                         _______,#######|\#######\
"                         \W############W  \#######\
"                          \W##########W    \#######\
"                           '#########'      \#######\
"                              ¯¯¯¯¯          ¯¯¯¯¯¯¯¯
"
"       Personal vim configuration of Jess Archer <jess@jessarcher.com>

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set cursorline
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set conceallevel=1 " show vim-typescript 'ligatures' (return, null, function etc..)
set timeoutlen=150
set wildcharm=<tab> "set to trigger auto complete in buffer script

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"
nmap <S-CR> :wq<CR>

nmap <leader>ve :vsplit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
"map <leader>gf :execute 'e %:h'expand('<cfile>')
 map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Open html in chrome
nnoremap <leader>c :exe '!open -a /Applications/Google\ Chrome.app %'<CR>

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" remap auto-complete
inoremap <silent><expr> <c-tab> coc#refresh()

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quickly escape to normal mode
imap jk <esc>
imap JK <esc> :call EscapeWithCaps()<CR>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>


cmap w!! %!sudo tee > /dev/null %

" more precise marks
nnoremap ' `

" remap split movement
nnoremap <leader><S-h> <C-w>h
nnoremap <leader><S-l> <C-w>l
nnoremap <leader><S-j> <C-w>j
nnoremap <leader><S-k> <C-w>k

" remap buffer movement
map gn :bnext<cr>
map gp :bprevious<cr>
" nnoremap <leader><leader> :b <tab>

" remap save
nnoremap <leader>w :wa<CR>
" Hardmode
inoremap <bs> <nop>
nnoremap j <nop>
nnoremap k <nop>
nnoremap l <nop>
nnoremap h <nop>

" see numbers
"nnoremap <leader>sn :exe "set relativenumber!<CR> | sleep 1000m | set relativenumber!<CR >"





"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/sneak.vim
source ~/.config/nvim/plugins/vim-shoot.vim
source ~/.config/nvim/plugins/arduino.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/paleNight.vim
"source ~/.config/nvim/plugins/dracula.vim

source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/ulTest.vim " deprecate
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/exchange.vim
source ~/.config/nvim/plugins/firenvim.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/lastplace.vim
source ~/.config/nvim/plugins/lion.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/peekaboo.vim
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/rooter.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/targets.vim
source ~/.config/nvim/plugins/textobj-xmlattr.vim
source ~/.config/nvim/plugins/unimpaired.vim
source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/visual-star-search.vim
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/vim-typescript
source ~/.config/nvim/plugins/vim-signature
source ~/.config/nvim/plugins/vim-prettier
source ~/.config/nvim/plugins/vim-copilot
source ~/.config/nvim/plugins/bad-practices.vim
source ~/.config/nvim/plugins/nvim-treesitter.vim
source ~/.config/nvim/plugins/nvim-notify.vim
source ~/.config/nvim/plugins/vim-closetag.vim
source ~/.config/nvim/plugins/vim-escCaps.vim
source ~/.config/nvim/plugins/vim-xtract.vim
source ~/.config/nvim/plugins/vim-noItalics.vim
source ~/.config/nvim/plugins/setup-workspace.vim
source ~/.config/nvim/plugins/vimspector
call plug#end()
doautocmd User PlugLoaded



"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

augroup FileTypeOverrides
autocmd!
" Use '//' instead of '/* */' comments
autocmd FileType php setlocal commentstring=//%s
autocmd TermOpen * setlocal nospell
augroup ENDm

" if buffer focus, check for changes, if leave, save
" run prettier on save
au FocusGained,BufEnter * :silent! checktime
au FocusGained,BufEnter * :silent! NERDTreeRefreshRoot
au FocusLost,WinLeave * :silent! w
au FocusLost,WinLeave * :silent! <silent>Prettier
" au FocusGained,BufEnter * :silent! call ConfigBadP()
au FocusGained,BufEnter * :silent! call ConfigureNotify()
au FocusGained,BufEnter * :silent! call RemoveHighlight()

" Tree sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
require('spellsitter').setup()
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>so",
      node_incremental = "<leader>",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Pale night color scheme
colorscheme nightfly
"let g:airline_theme = "palenight"
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif