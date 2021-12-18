:function SetupWorkspace()
:let done = 0
:call inputsave()
:let panes = input('how many panes?')

 
:if panes =~# '^\d\+$'
    while panes >= done + 2
        :let done += 1
        :vsplit
    :endwhile
:else
    :echom 'input must be a number'
:endif
:endfunction
nnoremap <leader>su :call SetupWorkspace()<CR> 
