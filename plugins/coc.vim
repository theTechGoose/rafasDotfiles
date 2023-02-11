Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'antoinemadec/coc-fzf'

au FileType html let b:coc_root_patterns = ['.git']
autocmd FileType python let b:coc_root_patterns = ['.git']

"'commit': 'bdf75abf2d892ceaa6f0f56c15a388ec31236ad2'



function! FileRefFunc(path)
  echom a:path
      try
            :execute "sbuffer ".a:path
      catch
            :execute "edit ".a:path
      endtry
endfunction


:command -nargs=1 OpenRedit :call FileRefFunc("<args>")
" let g:coc_user_config = {}

"let g:coc_user_config['coc.preferences.jumpCommand'] = ':OpenRedit'

augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

"    \ 'coc-pairs',
"let b:coc_pairs_disabled = [">", "<"]
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-sh',
    "\ 'coc-tabnine',
    \ 'coc-jedi',
    \ 'coc-snippets',
    \ 'coc-svg',
    \ 'coc-tsserver',
    \ '@yaegassy/coc-volar',
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
let g:copilot_no_tab_map = v:true
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1):
      \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
      \ check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"







" imap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

"imap <expr><S-TAB> pumvisible()? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


 " Use leader c to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>h <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>l <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>d <Plug>(coc-diagnostic-info)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
map <silent> gi <Plug>(coc-references)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ]h <Plug>(coc-git-nextchunk)
nmap <silent> [h <Plug>(coc-git-prevchunk)

" apply autofix to problem on the current line.
nmap <leader>af  <plug>(coc-fix-current)
nmap <leader>am  <plug>(coc-format-selected)
xmap <leader>am  <plug>(coc-format-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ga  <Plug>(coc-codeaction-line)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

let g:coc_disable_transparent_cursor = 1

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"nmap <leader>l :CocFzfList<cr>

:function Show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('definitionHover')
endif
:endfunction
nnoremap <leader>i :call Show_documentation()<CR>
inoremap ,d <esc>:call Show_documentation()<CR>

autocmd FileType scss setl iskeyword+=@
autocmd FileType scss setl iskeyword+=$
autocmd FileType scss setl iskeyword+=-

autocmd FileType css setl iskeyword+=@
autocmd FileType css setl iskeyword+=$
autocmd FileType css setl iskeyword+=-
