Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \"src/app/components/*": {
        \"src/app/components/*.ts": {
            \"alternate":"src/app/components/{}.scss"
        \},
        \"src/app/components/*.scss": {
            \"alternate":"src/app/components/{}.spec.ts"
        \},
        \"src/app/components/*.spec.ts": {
            \"alternate":"src/app/components/{}.html"
        \},
        \"src/app/components/*.html": {
            \"alternate":"src/app/components/{}.ts"
        \}
    \},
    \"src/app/services/*": {
        \"src/app/services/*.ts": {
            \ "alternate":"src/app/services/{}.spec.ts"
        \},
        \"src/app/services/*.spec.ts": {
            \ "alternate":"src/app/services/{}.ts"
        \},
    \},
    \"src/app/directives/*": {
        \"src/app/directives/*.ts": {
            \ "alternate":"src/app/directives/{}.spec.ts"
        \},
        \"src/app/directives/*.spec.ts": {
            \ "alternate":"src/app/directives/{}.ts"
        \},
    \},
    \"src/app/pipes/*": {
        \"src/app/pipes/*.ts": {
            \ "alternate":"src/app/pipes/{}.spec.ts"
        \},
        \"src/app/pipes/*.spec.ts": {
            \ "alternate":"src/app/pipes/{}.ts"
        \},
    \},
    \"src/helpers/*": {
        \"src/helpers/*.ts": {
            \ "alternate": "src/helpers/{}.spec.ts"
        \},
        \"src/helpers/*.spec.ts": {
            \"alternate": "src/helpers/{}.json"
        \},
        \"src/helpers/*.json":{ 
            \"alternate": "src/helpers/{}.ts"
        \}
    \},
    \"src/entrypoints/*": {
        \"src/entrypoints/*.ts": {
            \ "alternate": "src/entrypoints/{}.spec.ts"
        \},
        \"src/entrypoints/*.spec.ts": {
            \"alternate": "src/entrypoints/{}.json"
        \},
        \"src/entrypoints/*.json":{ 
            \"alternate": "src/entrypoints/{}.ts"
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
