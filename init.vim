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
set guifont=PragmataProMonoLiga\ Nerd\ Font:h17
set termguicolors
hi Cursor guifg=#F8F8F8 guibg=#A7A7A7
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
set nocursorline
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set conceallevel=0 " show vim-typescript 'ligatures' (return, null, function etc..)
set timeoutlen=400
set wildcharm=<tab> "set to trigger auto complete in buffer script
"----------------------------------------------------------------------
"set exrc
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

nmap <leader>ve :edit  ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>vz :edit ~/.zshrc<cr>

nmap <bs> :call ClearHighlight()<cr>
nmap <leader>Q :bufdo bdelete<cr>

:function ClearHighlight()
call feedkeys( ":nohlsearch\<CR>" )
:call sneak#cancel()    
:endfunction

" Allow gf to open non-existent files
 nnoremap <leader>o :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

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
nnoremap u uzzzv

" Quickly escape to normal mode
imap jk <esc>
imap JK <esc> :call EscapeWithCaps()<CR>
vmap <leader>jk <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>
imap :: <Esc>A:

cmap w!! %!sudo tee > /dev/null %

" more precise marks
nnoremap ' `
nnoremap ` '

" remap split movement
nnoremap <c-h> <C-w>h
nnoremap <c-l> <C-w>l
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k

" remap save
nnoremap <leader>ww :w!<CR>
nnoremap <leader>w <C-w>q
nnoremap <leader>w <C-w>=

" close window
nnoremap <leader>wq <C-w>q


" single char sneak, multiline f
map f <Plug>Sneak_f
map F <Plug>Sneak_F

" add a console.log with debug statements
nnoremap <leader>sp :call print_debug#print_debug()<cr>

" quit all 
nnoremap <leader>sq :wqall!<cr>

"quit window
nnoremap <leader>swq <C-w>q


" remap esc to leader e
vnoremap <space><space> <esc>
nnoremap <esc> <nop>

" Preseve clipboard when deleting single characters
nnoremap x "_x

" map Whiplash
nnoremap <leader>wip :Whiplash <Tab>
nnoremap <leader>wic :WhiplashCD<CR>

"map jumplist to leader j and k
nnoremap <leader>k <C-o>
nnoremap <leader>j <C-i>

"remap prettier
nnoremap <leader>pp :Prettier<CR>

"remap plug commands
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

"get file path
nnoremap <leader>gp :CopyBuffer<CR>
:command! CopyBuffer let @+ = expand('%:p')

"preview markdown
nnoremap <leader>pm :MarkdownPreview<CR>

"Split window
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

"snippets
nnoremap <leader>sa :CocCommand snippets.editSnippets<cr>

"search and replace
vnoremap <leader>sr :s/

"fine grain undo
inoremap ( (<C-g>u
inoremap { {<C-g>u
inoremap , ,<C-g>u
inoremap ; ;<C-g>u

"goto url
nnoremap <leader>gu :call Navigate()<cr>
function! Navigate()
let g:navUrl = matchstr(getline('.'), '(\zs.\{-}\ze)')
echom g:navUrl
:silent exec "! open "."'".g:navUrl."'"
endfunction

" Twilight toggling
nnoremap <leader>tw :Twilight<CR>

"move highlighted line
vnoremap J :m '>+1'<CR>gv=gv
vnoremap K :m '<-2'<CR>gv=gv

" easier %
nnoremap <space><space> %

" move to bottom of the file if already at the top




source ~/.config/nvim/autoCorrect.vim

"fine grained undo control
"inoremap  <Space><C-g>u

" insert mapping for missing keys bug
" inoremap ' '
" inoremap ( (
" inoremap ) )
" inoremap { {
" inoremap } }

" Hardmode
" inoremap <bs> <nop>
" nnoremap j <nop>
" nnoremap k <nop>
" nnoremap l <nop>
" nnoremap h <nop>

"remap buffer movement
"map gn :bnext<cr>
" map gp :bprevious<cr>
" nnoremap <leader><leader> :b <tab>

" remap auto-complete
"inoremap <silent><expr> <c-tab> coc#refresh()

" open relative file, if it doesnt exist create it and open it
"map <leader>gf :execute 'e %:h'expand('<cfile>')

" Open the current file in the default program
"nmap <leader>x :!xdg-open %<cr><cr>

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

"source ~/.config/nvim/plugins/which-key.vim
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
"-----------------------------------------------
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
  source ~/.config/nvim/plugins/jupyter_ascending.vim
  source ~/.config/nvim/plugins/vimwiki.vim
  source ~/.config/nvim/plugins/magma-nvim.vim
  source ~/.config/nvim/plugins/undotree.vim
  source ~/.config/nvim/plugins/highlight-yank.vim
  source ~/.config/nvim/plugins/twilight.vim
  source ~/.config/nvim/plugins/ts-playground.vim
  source ~/.config/nvim/plugins/expand-region.vim
  source ~/.config/nvim/plugins/easy-align.vim
  source ~/.config/nvim/plugins/lazygit.vim
  source ~/.config/nvim/plugins/neovide.vim


call plug#end()
doautocmd User PlugLoaded

"--------------------------------------------------------------------------
" Mini - Plugins
"--------------------------------------------------------------------------

"highlight cursor when jumping
function s:Cursor_Moved()
  let cur_pos = winline()
  if g:last_pos == 0
    set cul
    let g:last_pos = cur_pos
    return
  endif
  let diff = g:last_pos - cur_pos
  if diff > 1 || diff < -1
    set cul
  else
    set nocul
  endif
  let g:last_pos = cur_pos
endfunction
autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
let g:last_pos = 0


" go to the botton of the file when already at the top
function! RemapGG()
    let g:lineNumber = line('.') > 1
    if g:lineNumber
        normal! gg
    else
        normal! G
    endif
endfunction

nnoremap gg :call RemapGG()<cr>

"--------------------------------------------------------------------------

" Miscellaneous
"--------------------------------------------------------------------------

"au FocusGained,BufEnter * :silent! NvimTreeRefresh
" if buffer focus, check for changes, if leave, save
" run prettier on save
" au FocusLost,WinLeave * :silent! <silent>Prettier
" au BufWritePre * :silent! Prettier
" au FocusGained,BufEnter * :silent! call ConfigBadP()
" au FocusGained,BufEnter * :silent! call ConfigureNotify()
" au BufEnter * :IndentGuidesEnable
"let g:AutoCloseExpandSpace = 0 " Make iabbrev work again
au FocusGained,BufEnter * :silent! checktime
au FocusLost,WinLeave * :silent! w
 au FocusGained,BufEnter * :silent! call RemoveHighlight()
au InsertEnter * set cursorline
au InsertLeave * set nocursorline
autocmd BufWritePre *.ts :OR
autocmd BufEnter * if &filetype == "" | setlocal ft=typescript | endif
au BufEnter * set formatoptions-=ro



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
         init_selection = "<leader>v",
         node_incremental = "v",
         scope_incremental = "<c-g>",
         node_decremental = "<c-v>",
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
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
require("twilight").setup{
dimming = {
    alpha = 0.75,
    inactive = false,
  },
context = 0,
treesitter = true,
expand = {
    "function",
    "method",
    "arrow_function",
    "table",
		"body",
		"arguments",
    "if_statement",
    "formal_parameters",
    }

}
EOF


autocmd FileType json syntax match Comment +\/\/.\+$+
