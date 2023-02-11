Plug 'vim-test/vim-test'
"Plug 'neomake/neomake'
"let g:test#strategy = 'neomake'
let test#strategy = "dispatch"
" let g:test#basic#start_normal = 1
" let g:test#preserve_screen = 1
nnoremap <leader>tn :TestNearest --forceExit<CR>
nnoremap <leader>ts :TestSuite --forceExit<CR>
nnoremap <leader>tl :TestLast --forceExit<CR>
nnoremap <leader>tv :TestVisit<CR>
noremap <leader>td :exec '! npx jest '.expand("%")<CR>

function! Test(cmd) abort 
    let l:credsPath = FindPackgeJson()
    if l:credsPath['result'] 
				let l:oCmd = l:credsPath['value'].' && '.a:cmd
				echom l:oCmd
				return l:oCmd
		endif
    echom 'No credentials found'
    echom a:cmd
    return a:cmd
endfunction


function SetPath(path) 
    let g:path = a:path 
endfunction

function FindPackgeJson()
    let l:packagelocation = findfile('package.json')
    let l:fullpackage = readfile(l:packagelocation)
    let l:decodedpackage = json_decode(l:fullpackage)
    try
    let l:testy = decodedpackage['creds']
    return {
            \ 'value': l:testy,
            \'result': 1
          \ }
catch
		echom 'not found'
    return {
            \ 'value': 0,
            \ 'result': 0
          \ }
endtry
endfunction

let g:test#javascript#runner = 'jest'
"let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:test#custom_transformations = {'testy': function('Test')}
let g:test#transformation = 'testy'

nmap <silent> <leader>tf :TestFile<CR><CR>
" nmap <leader>tn :TestNearest<CR>
" nmap <leader>ts :TestSuite<CR>
" nmap <leader>tl :TestLast<CR>
" nmap <leader>tv :TestVisit<CR>

augroup AutoDeleteTestTermBuffers
    autocmd!
    autocmd BufLeave term://*artisan\stest* bdelete!
    autocmd BufLeave term://*phpunit* bdelete!
augroup END
