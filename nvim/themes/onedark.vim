" ================================
" Theme configuration for onedark.vim
" ================================
" Prevent background color setting when in terminal mode

if has("autocmd") && !has("gui_running")
  augroup colorset
    autocmd!
    " Define color for white text with hex for GUI, cterm for 256 colors, and cterm16 fallback
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }
    
    " Set highlight for Normal text with white foreground and no background
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

" Style comments in italics, applicable for both GUI and terminal
hi Comment cterm=italic gui=italic

" Optional appearance settings
let g:onedark_hide_endofbuffer = 1          " Hide '~' on empty lines at buffer end
let g:onedark_terminal_italics = 1          " Enable terminal italics if supported
let g:onedark_termcolors = 256              " Use 256-color mode for terminals

" Enable 24-bit color support in terminals that support termguicolors
if has("termguicolors")
    set termguicolors
    " Clear background color for line numbers
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Activate the onedark colorscheme
colorscheme onedark
