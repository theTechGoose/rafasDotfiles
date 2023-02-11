" Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'marko-cerovac/material.nvim'
"let g:dracula_italic = 0
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Using Vim-Plug
" Plug 'navarasu/onedark.nvim'
" Plug 'sainnhe/sonokai'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'rakr/vim-one'
" Vim Script
"let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
   " let g:sonokai_style = 'andromeda'
   " let g:sonokai_better_performance = 1

   " if has('termguicolors')
   "   set termguicolors
   " endif

   " let g:sonokai_enable_italic = 1
" Vim Script

"Plug 'lmburns/kimbox'
"Plug 'mhartington/oceanic-next'
Plug 'sainnhe/sonokai'




autocmd User PlugLoaded ++nested silent! colorscheme sonokai
let g:airline_theme = 'sonokai'
let g:sonokai_style = 'maia'
" let g:one_allow_italics = 1 
" let g:airline_theme='one'
