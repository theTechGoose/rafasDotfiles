Plug 'liuchengxu/vim-clap'
Plug 'voldikss/clap-floaterm'
Plug 'voldikss/vim-floaterm'

let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_toggle  = '<C-space>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
"nnoremap <F1> :call CloseNerdTreeAndOpenTerminal()<CR>
tnoremap <silent> <F1> <C-\><C-n>:FloatermToggle<CR>



let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.85
let g:floaterm_height=0.855
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1


" normal mode mapping
tnoremap <leader><leader> <C-\><C-n>  

augroup FloatermCustomisations
    autocmd!
    autocmd ColorScheme * highlight FloatermBorder guibg=none
augroup END

