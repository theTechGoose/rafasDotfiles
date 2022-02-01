Plug 'vim-test/vim-test'

let g:test#javascript#runner = 'jest'

nmap <leader>tf :TestFile<CR>
" nmap <leader>tn :TestNearest<CR>
" nmap <leader>ts :TestSuite<CR>
" nmap <leader>tl :TestLast<CR>
" nmap <leader>tv :TestVisit<CR>

augroup AutoDeleteTestTermBuffers
    autocmd!
    autocmd BufLeave term://*artisan\stest* bdelete!
    autocmd BufLeave term://*phpunit* bdelete!
augroup END
