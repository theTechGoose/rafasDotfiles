Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/spellsitter.nvim'

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
