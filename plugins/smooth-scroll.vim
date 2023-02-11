Plug 'terryma/vim-smooth-scroll'

noremap <silent> <S-return> :call smooth_scroll#up(&scroll/5, 0, 1)<CR>
noremap <silent> <return> :call smooth_scroll#down(&scroll/5, 0, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 1)<CR>

