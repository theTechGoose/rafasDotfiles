Plug 'vimwiki/vimwiki'

nnoremap <leader>wo :VimwikiIndex<cr>
let g:vimwiki_list = [{'path': '~/Documents/infrastructure/rafasDotfiles/vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:polyglot_disabled = ['markdown']
