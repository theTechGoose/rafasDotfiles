Plug 'mcchrish/nnn.vim'

function! SwitchFileOrOpen(lines)
      let file = a:lines[-1]
      try
            :execute "sbuffer".file
      catch
            :execute "edit".file
      endtry
endfunction


let g:nnn#set_default_mappings = 0

" Set custom mappings

" create an empty function
function! ClearHighlightAndOpenTree()
      call ClearHighlight()
      call timer_start(50, {tid -> feedkeys( ":call nnn#pick(expand('%p:h'))\<cr>" ) })
      ":call feedkeys( "call nnn#pick(expand('%p:h'))\<cr>" )
      ":call sneak#cancel()    
      "wait for 0.2 seconds
      "call nnn#pick(expand('%p:h'))
endfunction


"nnoremap <silent> <leader>n :call ClearHighlight()<cr> <bar> :call nnn#pick(expand('%p:h'))<CR>
nnoremap <silent> <leader>n :call ClearHighlightAndOpenTree()<cr>
nnoremap <silent> <leader>N :NnnPicker<CR>
let g:nnn#layout = { 'left': '~30%' }
let g:nnn#action = {
      \ '<c-j>': function('SwitchFileOrOpen'),
      \ '<c-k>': 'vsplit',
      \}













" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'

"Plug 'preservim/nerdtree'
"
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"let NERDTreeShowHidden=1
"let NERDTreeMinimalUI=1

"let g:NERDTreeDirArrowExpandable = '▹'
"let g:NERDTreeDirArrowCollapsible = '▿'

""nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>DTree
"nnoremap <leader>n :call ExecNerdtree()<CR>
""nmap <leader>N :NERDTreeClose<CR>

":function ExecNerdtree()
"if exists('g:loaded_webdevicons')
"    call webdevicons#refresh()
"endif
":if g:NERDTree.IsOpen()
":    NERDTreeClose
":else
":NERDTreeToggle
":endif
":endfunction

"" If more than one window and previous buffer was NERDTree, go back to it.
"autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

"" avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
"let g:plug_window = 'noautocmd vertical topleft new'

"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsEnableFoldersOpenClose = 1
"let g:DevIconsEnableFolderExtensionPatternMatching = 1

"let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
"let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
"let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
"let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
"let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
"let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
"let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
"let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
"let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
"let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
"let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
"let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
"let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
"let g:nvim_tree_window_picker_exclude = {
"    \   'filetype': [
"    \     'notify',
"    \     'packer',
"    \     'qf'
"    \   ],
"    \   'buftype': [
"    \     'terminal'
"    \   ]
"    \ }
"" Dictionary of buffer option names mapped to a list of option values that
"" indicates to the window picker that the buffer's window should not be
"" selectable.
"let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"let g:nvim_tree_show_icons = {
"    \ 'git': 1,
"    \ 'folders': 1,
"    \ 'files': 1,
"    \ 'folder_arrows': 1,
"    \ }
""If 0, do not show the icons for one of 'git' 'folder' and 'files'
""1 by default, notice that if 'files' is 1, it will only display
""if nvim-web-devicons is installed and on your runtimepath.
""if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
""but this will not work when you set indent_markers (because of UI conflict)

"" default will show icon by default if no icon is provided
"" default shows no icon by default
"let g:nvim_tree_icons = {
"    \ 'default': '',
"    \ 'symlink': '',
"    \ 'git': {
"    \   'unstaged': "✗",
"    \   'staged': "✓",
"    \   'unmerged': "",
"    \   'renamed': "➜",
"    \   'untracked': "★",
"    \   'deleted': "",
"    \   'ignored': "◌"
"    \   },
"    \ 'folder': {
"    \   'arrow_open': "▿",
"    \   'arrow_closed': "▹",
"    \   'default': "",
"    \   'open': "",
"    \   'empty': "",
"    \   'empty_open': "",
"    \   'symlink': "",
"    \   'symlink_open': "",
"    \   }
"    \ }

""let g:NERDTreeDirArrowExpandable = '▹'
""let g:NERDTreeDirArrowCollapsible = '▿'
"nnoremap <leader>n :NvimTreeToggle<CR>
"nnoremap <leader>sr :NvimTreeRefresh<CR>
"nnoremap <leader>n :NvimTreeFindFile<CR>
"" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

"set termguicolors " this variable must be enabled for colors to be applied properly

"" a list of groups can be found at `:help nvim_tree_highlight`
"highlight NvimTreeFolderIcon guibg=blue

