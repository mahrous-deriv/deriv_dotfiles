" ==================================
" Iceberg Theme Configuration
" ==================================
" This setup optimizes the Iceberg theme for a visually pleasant experience
" with additional customizations for enhanced readability and focus.

" Enable syntax highlighting for structured and colorful code
syntax on

" Enable 24-bit color support if the terminal supports it for richer colors
if has("termguicolors")
    set termguicolors
    " Remove background color for line numbers to keep a clean look
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Customize Iceberg colors and highlight groups
augroup IcebergCustomHighlights
  autocmd!
  
  " Set line numbers to a cool gray to match the Iceberg color palette
  autocmd ColorScheme iceberg hi LineN ctermfg=lightblue guifg=#6c8d9b
  
  " Subtle highlight on the current line for better focus
  autocmd ColorScheme iceberg hi CursorLine ctermbg=235 guibg=#1c1f26

  " Customize the search highlight for better contrast with Iceberg’s cool tones
  autocmd ColorScheme iceberg hi Search ctermfg=black ctermbg=lightblue guifg=#1b2b34 guibg=#c0c5ce

  " Highlight matching parentheses with a soft background for easy pairing
  autocmd ColorScheme iceberg hi MatchParen ctermbg=238 guibg=#4f5b66

  " Dim inactive windows slightly to focus on the active one
  autocmd ColorScheme iceberg hi NormalNC ctermbg=236 guibg=#2b303b
augroup END

" Enable cursorline highlighting for active line visibility
set cursorline

" Activate the Iceberg colorscheme with all custom settings
colorscheme iceberg
