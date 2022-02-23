Plug 'vimwiki/vimwiki', {'branch': 'dev'}

let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_list = [{'path': '~/Documents/infrastructure/rafasDotfiles/vimwiki',
            \'syntax': 'markdown',
            \'ext': '.md'}]

let g:vimwiki_conceallevel  = 0

let g:vimwiki_key_mappings =
\ {
\   'all_maps': 1,
\   'global': 1,
\   'headers': 1,
\   'text_objs': 1,
\   'table_format': 1,
\   'table_mappings': 0,
\   'lists': 0,
\   'links': 1,
\   'html': 1,
\   'mouse': 0,
\ }

nnoremap <leader>wo :VimwikiIndex<cr>
nnoremap <leader>wl :VimwikiFollowLink<cr>
