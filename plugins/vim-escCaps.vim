

:function EscapeWithCaps() 
lua << EOF
vim.notify = require("notify")('Please Turn off caps lock', vim.lsp.log_levels.ERROR)
EOF
:endfunction
     
