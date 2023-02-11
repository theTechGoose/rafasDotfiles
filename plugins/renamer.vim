Plug 'nvim-lua/plenary.nvim'
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }

" Symbol renaming.
nmap <leader>rn <cmd>lua require('renamer').rename()<cr>
