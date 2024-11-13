" ==========================================================================
" Neovim Configuration for mahrous-deriv 
" ==========================================================================
"

" ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║     
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
" ==========================================================================

" Source configurations
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/iceberg.vim
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/gruvbox.vim

" Auto-reload Neovim configuration when saving init.vim
" au! BufWritePost $MYVIMRC source %
autocmd BufWritePost init.vim source % 

" Enable Mouse Support
set mouse=a                   " Enable mouse in all modes (normal, inert, etc.)

" Basic Settings
" --------------------------------------------------------------------------
set nocompatible               " Disable vi compatibility mode
set number                     " Display line numbers
set cursorline                 " Highlight current line
set cursorcolumn               " Highlight current column
set scrolloff=10               " Keep cursor centered
set nowrap                     " Disable line wrapping
set incsearch                  " Incremental search
set ignorecase                 " Case-insensitive search by default
set smartcase                  " Case-sensitive if search includes uppercase
set showcmd                    " Show partial command in status line
set showmode                   " Show mode on the status line
set showmatch                  " Show matching parenthesis
set hlsearch                   " Highlight search results
set history=1000               " Save 1000 commands in history
set wildmenu                   " Enhanced command-line completion
set wildmode=list:longest      " Completion behavior
set wildignore=*.docx,*.jpg,*.png,*.pdf,*.exe,*.flv,*.img  " Ignore files in wildmenu
set noswapfile                 " Disable .swp files
set clipboard^=unnamed,unnamedplus " Enable clipboard copy/paste

" Tab and Indentation Settings
" --------------------------------------------------------------------------
set shiftwidth=4               " Indentation level
set tabstop=4                  " Tab width
set expandtab                  " Use spaces instead of tabs
set autoindent                 " Enable auto-indenting
set smarttab                   " Enhanced tab behavior
set smartindent                " Enable smart indentation
set formatoptions-=cro         " Stop newline continuation of comments

" Enhance User Experience
" --------------------------------------------------------------------------
set listchars=tab:▸\ ,eol:¬    " Visualize tabs and end-of-line characters
set timeoutlen=500             " Set timeout length for mappings
set updatetime=300             " Faster completion
set cmdheight=2                " Additional command-line space
set modelines=0                " Security setting
set hidden                     " Enable hidden buffers
set encoding=utf-8             " Display encoding
set fileencoding=utf-8         " File encoding
set showtabline=4              " Always show tabline
set visualbell                 " Disable audible bell; use visual
set ttyfast                    " Enable faster rendering

" Status Line Customization
" --------------------------------------------------------------------------
set statusline=                " Clear previous status line settings
set statusline+=\ %F\ %M\ %Y\ %R\ " Display file info
set statusline+=%=             " Separator for left/right sides
set statusline+=ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%% " Right side info
set laststatus=2               " Always display status line

" Enhanced File Type Handling
" --------------------------------------------------------------------------
filetype on                    " Enable filetype detection
filetype plugin on             " Enable filetype plugins
filetype indent on             " Enable filetype-based indentation

" Customize Filetype Settings
" --------------------------------------------------------------------------
augroup filetype_settings
    autocmd!
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType perl setlocal tabstop=4 shiftwidth=4 expandtab foldmethod=marker
    autocmd FileType python,go setlocal tabstop=2 shiftwidth=2 expandtab ai
    autocmd FileType yaml,json setlocal tabstop=2 shiftwidth=2
    autocmd FileType css,html setlocal shiftwidth=1 tabstop=1
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Auto Commands for Navigation and Behavior
" --------------------------------------------------------------------------
augroup custom_autocommands
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
    autocmd BufNewFile,BufRead *.define setf define
    autocmd FileType c,cpp,rust,sh set shiftwidth=2 expandtab
augroup END

" Cursor and Split Behavior
" --------------------------------------------------------------------------
set splitbelow                 " Horizontal splits open below
set splitright                 " Vertical splits open to the right
augroup cursor_behavior
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Backup and Undo Settings
" --------------------------------------------------------------------------
if version >= 703
    set undodir=~/.config/nvim/backup   " Undo file directory
    set undofile                        " Persistent undo
    set undoreload=10000                " Increase undo steps after file reload
endif
set nobackup                            " Disable backup files

" Vimscript Enhancements
" --------------------------------------------------------------------------
command! Bclose call <SID>BufcloseCloseIt() " Custom buffer close command
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        new
    endif
    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" ==========================================================================
" End of Neovim Configuration
" ==========================================================================
