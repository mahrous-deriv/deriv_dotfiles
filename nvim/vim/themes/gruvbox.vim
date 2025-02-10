" ==================================
" Gruvbox Theme Configuration
" ==================================
" This configuration is optimized for an enhanced visual experience with Gruvbox
" in both terminal and GUI Vim environments.

" Enable italics for a more distinctive style
let g:gruvbox_italics = 1


" Set Gruvbox contrast to 'hard' for deep, bold colors in dark mode
let g:gruvbox_contrast_dark = 'hard'

" Enable bold and underlined styles for better syntax distinction
let g:gruvbox_bold = 1
let g:gruvbox_underline = 1

" Customize specific highlight groups for a tailored look
augroup GruvboxCustomHighlights
  autocmd!
  " Adjust comments to be italicized for a softer, less distracting look
  autocmd ColorScheme gruvbox hi Comment cterm=italic gui=italic

  " Set cursor line to a subtle background for focus without distraction
  autocmd ColorScheme gruvbox hi CursorLine ctermbg=236 guibg=#3c3836

  " Dim inactive window splits to improve focus on the active window
  autocmd ColorScheme gruvbox hi NormalNC ctermbg=235 guibg=#282828
augroup END

" Enable 24-bit color if supported for better color depth
if has("termguicolors")
    set termguicolors
    " Remove background color for line numbers for a minimalistic look
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Configure line numbers to use a slightly dimmed color for readability
hi LineNr ctermfg=gray guifg=#7c6f64

" Enable line highlighting in the current window for better visual tracking
set cursorline

" Set search results to a standout color for quick identification
hi Search ctermfg=black ctermbg=yellow guifg=#282828 guibg=#fabd2f

" Enable syntax highlighting for enhanced code readability
syntax on

" Activate Gruvbox colorscheme with all custom settings
colorscheme gruvbox
let g:gruvbox_italics = 1
let g:gruvbox_contrast_dark='hard'

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

syntax on
colorscheme gruvbox
