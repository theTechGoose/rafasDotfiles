Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \  "src/app/*": {
    \  "src/app/*.ts": {
    \  "alternate":"src/app/{}.scss"
    \},
\  "src/app/*.scss": {
\  "alternate":"src/app/{}.spec.ts"
\},
\  "src/app/*.spec.ts": {
\  "alternate":"src/app/{}.html"
\},
\  "src/app/*.html": {
\  "alternate":"src/app/{}.ts"
\}
  \}
\}

nnoremap <leader>; :A<cr>
        "}
   
    " \"src/app/*.component.ts": {"alternate": "src/app/{}.component.scss"},
    " \   "app/*Controller.php": {
    " \     "type": "source",
    " \     "alternate": "tests/Feature/{}ControllerTest.php",
    " \   },
    " \   "app/**/Models/*.php": {
    " \     "type": "source",
    " \     "alternate": [
    " \       "tests/Unit/{dirname}/Models/{basename}Test.php",
    " \       "tests/Unit/{dirname}/{basename}Test.php",
    " \     ],
    " \   },
    " \   "app/**/Listeners/*.php": {
    " \     "type": "source",
    " \     "alternate": "tests/Unit/{dirname}/Listeners/{basename}Test.php",
    " \   },
    " \   "app/*.php": {
    " \     "type": "source",
    " \     "alternate": [
    " \       "tests/Unit/{}Test.php",
    " \       "tests/Feature/{}Test.php",
    " \     ]
    " \   },
    " \   "tests/Feature/*Test.php": {
    " \     "type": "test",
    " \     "alternate": "app/{}.php",
    " \   },
    " \   "tests/Unit/*Test.php": {
    " \     "type": "test",
    " \     "alternate": [
    " \       "app/{}.php",
    " \       "app/Models/{}.php",
    " \     ],
    " \   },
    " \ 
