""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"              ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"              ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"              ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║     
"              ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"              ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"              ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/gruvbox.vim
source $HOME/.config/nvim/themes/iceberg.vim

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" VIMSCRIPT {{{
    " Enable the marker method of folding.
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END

    " If the current file type is HTML, set indentation to 2 spaces.
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

    " If Vim version is equal to or greater than 7.3 enable undofile.
    " This allows you to undo changes to a file even after saving it.
    if version >= 703
        set undodir=~/.config/nvim/backup
        set undofile
        set undoreload=10000
    endif

    " You can split a window into sections by typing `:split` or `:vsplit`.
    " Display cursorline and cursorcolumn ONLY in active window.
    augroup cursor_off
        autocmd!
        autocmd WinLeave * set nocursorline nocursorcolumn
        autocmd WinEnter * set cursorline cursorcolumn
    augroup END

    " If GUI version of Vim is running set these options.
    if has('gui_running')

        let g:colors_name = 'onedark'
        " Set the background tone.
        set background=dark
        set transparency=10 

        " Set a custom font you have installed on your computer.
        " Syntax: <font_name>\ <weight>\ <size>
        set guifont=Monospace\ Regular\ 12

        " Display more of the file by default.
        " Hide the toolbar.
        set guioptions-=T

        " Hide the the left-side scroll bar.
        set guioptions-=L

        " Hide the the left-side scroll bar.
        set guioptions-=r

        " Hide the the menu bar.
        set guioptions-=m

        " Hide the the bottom scroll bar.
        set guioptions-=b

    endif

    " auto source when writing to .vimrc alternatively you can run :source $MYVIMRC
    au! BufWritePost $MYVIMRC source %      

    " remember last location{{{
    autocmd BufReadPost *
        \ if line("'\"")>0&&line("'\"")<=line("$") |
        \   exe "normal g'\"" |
        \ endif

    autocmd BufNewFile,BufRead *.define setf define
    autocmd FileType c,cpp,perl,rust,sh :set shiftwidth=2 expandtab
    autocmd FileType go :set tabstop=2 noexpandtab
    autocmd FileType lua :set shiftwidth=2 
    autocmd FileType python :set tabstop=2 shiftwidth=2 expandtab ai
    autocmd FileType ruby,javascript,xml :set tabstop=2 shiftwidth=2
    autocmd FileType html :set shiftwidth=1 tabstop=1
    autocmd FileType css :set shiftwidth=1 tabstop=1
    autocmd FileType yaml :set shiftwidth=2 tabstop=2
    autocmd FileType json :set shiftwidth=2 tabstop=2

    " Don't close window, when deleting a buffer
    command! Bclose call <SID>BufcloseCloseIt()
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

    " }}}
" }}}

" STATUS LINE {{{

    " Clear status line when vimrc is reloaded.
    set statusline=

    " Status line left side.
    set statusline+=\ %F\ %M\ %Y\ %R

    " Use a divider to separate the left side from the right side.
    set statusline+=%=

    " Status line right side.
    set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

    " Show the status on the second to last line.
    set laststatus=2

" }}}

set hidden                              " Required to keep multiple buffers open multiple buffers
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                  			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                          " Your working directory will always be the same as your working directory
set visualbell                          " Blink cursor on error instead of beeping (grr)
set modelines=0                         " Security
set listchars=tab:▸\ ,eol:¬             " Visualize tabs and newlines
set noswapfile                          " Disabiling .swp files
set ttyfast                             " Rendering
