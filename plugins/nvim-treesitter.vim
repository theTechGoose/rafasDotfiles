Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'lewis6991/spellsitter.nvim'
Plug 'theHamsta/nvim-treesitter-pairs'

:let g:is_open = 0
:function TriggerSelection()
    :if g:is_open
        :visual <leader>gqo
        :echom g:is_open
        :echom 'ran base'
    :else
        :normal <leader>gqe
        :let g:is_open = 1
        :echom g:is_open
        :echom 'ran else'
    :endif
:endfunction

" rainbow brackets remove frazer when vim-rainbow works
"Plug 'luochen1990/rainbow'
"Plug 'junegunn/rainbow_parentheses.vim'
" wPlug 'p00f/nvim-ts-rainbow'
Plug 'ChristianChiarulli/nvim-ts-rainbow'
