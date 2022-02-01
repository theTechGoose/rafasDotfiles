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

set shiftwidth=4
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
set wrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=15
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamed
set confirm
set cursorline
"set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set conceallevel=1 " show vim-typescript 'ligatures' (return, null, function etc..)
set timeoutlen=400
set wildcharm=<tab> "set to trigger auto complete in buffer script
"let g:netrw_liststyle=3 " these next two lines make it so a directory can be opened with nerdtree
"let g:netrw_keepdir=0
"let g:NERDTreeChDirMode=2

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\\"
nmap <S-CR> :wq<CR>
nmap <space> <leader>
vmap <space> <leader>

nmap <leader>ve :vsplit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>h :call ClearHighlight()<cr>
nmap <leader>Q :bufdo bdelete<cr>

:function ClearHighlight()
call feedkeys( ":nohlsearch\<CR>" )
:call sneak#cancel()    
:endfunction

" Allow gf to open non-existent files
"map <leader>gf :execute 'e %:h'expand('<cfile>')
 nnoremap <leader>o :edit <cfile><cr>

" open relative file, if it doesnt exist create it and open it

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" 

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
"inoremap <silent><expr> <c-tab> coc#refresh()

" Open the current file in the default program
"nmap <leader>x :!xdg-open %<cr><cr>

" Quickly escape to normal mode
imap jk <esc>
imap JK <esc> :call EscapeWithCaps()<CR>
vmap jk <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>
imap :: <Esc>A:


cmap w!! %!sudo tee > /dev/null %

" more precise marks
nnoremap ' `
nnoremap ` '

" remap split movement
nnoremap <leader><S-h> <C-w>h
nnoremap <leader><S-l> <C-w>l
nnoremap <leader><S-j> <C-w>j
nnoremap <leader><S-k> <C-w>k

" remap buffer movement
"map gn :bnext<cr>
" map gp :bprevious<cr>
" nnoremap <leader><leader> :b <tab>

" remap save
nnoremap <leader>ww :call SaveAndFormat('1')<CR>
nnoremap <leader>w <C-w>q
nnoremap <leader>w <C-w>=

" close window
nnoremap <leader>wq <C-w>q

:function SaveAndFormat(any) 
wa
silent! <silent>Prettier
IndentGuidesEnable
:endfunction

" Hardmode
" inoremap <bs> <nop>
" nnoremap j <nop>
" nnoremap k <nop>
" nnoremap l <nop>
" nnoremap h <nop>

" see numbers
"nnoremap <leader>sn :exe "set relativenumber!<CR> | sleep 1000m | set relativenumber!<CR >"

" single char sneak, multiline f
map f <Plug>Sneak_f
map F <Plug>Sneak_F

" add a console.log with debug statements
nnoremap <leader>sp :call print_debug#print_debug()<cr>

" quit all 
nnoremap <leader>sq :wqall!<cr>

"quit window
nnoremap <leader>swq <C-w>q

" insert mapping for missing keys bug
" inoremap ' '
" inoremap ( (
" inoremap ) )
" inoremap { {
" inoremap } }

" remap esc to leader e
vnoremap <leader>e <esc>
nnoremap <esc> <nop>


" Preseve clipboard when deleting single characters
nnoremap x "_x

" map Whiplash
nnoremap <leader>wip :Whiplash <Tab>
nnoremap <leader>wic :WhiplashCD<CR>


"map jumplist to leader j and k
nnoremap <leader>k <C-o>
nnoremap <leader>j <C-i>


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
"source ~/.config/nvim/plugins/vim-shoot.vim
"source ~/.config/nvim/plugins/arduino.vim
"source ~/.config/nvim/plugins/context-commentstring.vim
"source ~/.config/nvim/plugins/dispatch.vim
"source ~/.config/nvim/plugins/editorconfig.vim
"source ~/.config/nvim/plugins/ulTest.vim  deprecate
"source ~/.config/nvim/plugins/eunuch.vim
"source ~/.config/nvim/plugins/firenvim.vim
"source ~/.config/nvim/plugins/fugitive.vim
"source ~/.config/nvim/plugins/heritage.vim
"source ~/.config/nvim/plugins/lion.vim
"source ~/.config/nvim/plugins/phpactor.vim
"source ~/.config/nvim/plugins/splitjoin.vim
"source ~/.config/nvim/plugins/textobj-xmlattr.vim
"source ~/.config/nvim/plugins/bad-practices.vim
"source ~/.config/nvim/plugins/nvim-notify.vim
"source ~/.config/nvim/plugins/vim-escCaps.vim
"source ~/.config/nvim/plugins/vim-xtract.vim
"source ~/.config/nvim/plugins/vimspector
"source ~/.config/nvim/plugins/vim-be-good.vim
"source ~/.config/nvim/plugins/vimspector.vim
 source ~/.config/nvim/plugins/airline.vim
 source ~/.config/nvim/plugins/sneak.vim
 source ~/.config/nvim/plugins/coc.vim
 source ~/.config/nvim/plugins/commentary.vim
 source ~/.config/nvim/plugins/paleNight.vim
 source ~/.config/nvim/plugins/exchange.vim
 source ~/.config/nvim/plugins/floaterm.vim
 source ~/.config/nvim/plugins/fzf.vim
 source ~/.config/nvim/plugins/lastplace.vim
 source ~/.config/nvim/plugins/markdown-preview.vim
 source ~/.config/nvim/plugins/nerdtree.vim
 source ~/.config/nvim/plugins/pasta.vim
 source ~/.config/nvim/plugins/peekaboo.vim
 source ~/.config/nvim/plugins/polyglot.vim
 source ~/.config/nvim/plugins/projectionist.vim
 source ~/.config/nvim/plugins/quickscope.vim
 source ~/.config/nvim/plugins/repeat.vim
 source ~/.config/nvim/plugins/rooter.vim
 source ~/.config/nvim/plugins/sayonara.vim
 source ~/.config/nvim/plugins/smooth-scroll.vim
 source ~/.config/nvim/plugins/surround.vim
 source ~/.config/nvim/plugins/targets.vim
 source ~/.config/nvim/plugins/unimpaired.vim
 source ~/.config/nvim/plugins/vim-test.vim
 source ~/.config/nvim/plugins/visual-multi.vim
 source ~/.config/nvim/plugins/visual-star-search.vim
 source ~/.config/nvim/plugins/which-key.vim
 source ~/.config/nvim/plugins/vim-typescript
 source ~/.config/nvim/plugins/vim-signature
 source ~/.config/nvim/plugins/vim-prettier
 source ~/.config/nvim/plugins/vim-copilot
 source ~/.config/nvim/plugins/nvim-treesitter.vim
 source ~/.config/nvim/plugins/vim-closetag.vim
 source ~/.config/nvim/plugins/vim-noItalics.vim
 source ~/.config/nvim/plugins/setup-workspace.vim
 source ~/.config/nvim/plugins/print-debug.vim
 source ~/.config/nvim/plugins/search-highlight.vim
 source ~/.config/nvim/plugins/Codi.vim
 source ~/.config/nvim/plugins/indent-rainbow.vim
 source ~/.config/nvim/plugins/wiplash.vim
 source ~/.config/nvim/plugins/devIcons.vim
 source ~/.config/nvim/plugins/jsonc.vim
 source ~/.config/nvim/plugins/v-coolor.vim

call plug#end()
doautocmd User PlugLoaded



"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------



" if buffer focus, check for changes, if leave, save
" run prettier on save
au FocusGained,BufEnter * :silent! checktime
"au FocusGained,BufEnter * :silent! NvimTreeRefresh
au FocusLost,WinLeave * :silent! w
" au FocusLost,WinLeave * :silent! <silent>Prettier
" au BufWritePre * :silent! Prettier
" au FocusGained,BufEnter * :silent! call ConfigBadP()
" au FocusGained,BufEnter * :silent! call ConfigureNotify()
 au FocusGained,BufEnter * :silent! call RemoveHighlight()
" au BufEnter * :IndentGuidesEnable


" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" nightfly color scheme
colorscheme nightfly
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Change Color when entering Insert Mode
highlight Cursor guifg=Blue guibg=LightGreen
highlight Visual guifg=Black guibg=White

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-h>",
            node_incremental = "<C-[>",
            scope_incremental = "<C-h>",
            node_decremental = "<C-l>",
        }
    },
  autotag = {
      enable = true,
  },
   rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
  indent = {
    enable = true
  },
}
--require'nvim-tree'.setup()
EOF


autocmd FileType json syntax match Comment +\/\/.\+$+
