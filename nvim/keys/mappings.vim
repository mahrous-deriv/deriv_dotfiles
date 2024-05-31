" MAPPINGS {{{
    " Set the backslash as the leader key.
    let mapleader = '\'

    " Press \ `` to jump back to the last cursor position.
    nnoremap <leader>\ ``

    " Press \p to print the current file to the default printer from a Linux operating system.
    " View available printers:   lpstat -v
    " Set default printer:       lpoptions -d <printer_name>
    " <silent> means do not display output.
    nnoremap <silent> <leader>p :%w !lp<CR>

    " Easy <ESC>.
    inoremap jk <Esc>
    inoremap kj <Esc>

    " Searching
    nnoremap / /\v
    vnoremap / /\v 

    " Press the space bar to type the : character in command mode.
    nnoremap <space> :

    " Pressing the letter o will open a new line below the current one.
    " Exit insert mode after creating a new line above or below the current line.
    nnoremap o o<esc>
    nnoremap O O<esc>

    " Center the cursor vertically when moving to the next word during a search.
    nnoremap n nzz
    nnoremap N Nzz

    " Yank from cursor to the end of line.
    nnoremap Y y$

    " You can split the window in Vim by typing :split or :vsplit.
    " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l

    " Resize split windows using arrow keys by pressing:
    " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
    noremap <c-up> <c-w>+
    noremap <c-down> <c-w>-
    noremap <c-left> <c-w>>
    noremap <c-right> <c-w><

    " Easy CAPS
    inoremap <M-w> <ESC>viwUi
    nnoremap <M-w> viwU<Esc>

    " TAB in general mode will move to text buffer
    nnoremap <TAB> :bnext<CR>

    " SHIFT-TAB will go back
    nnoremap <S-TAB> :bprevious<CR>
  
    " switch tab {{{
        noremap <leader>1 1gt
        noremap <leader>2 2gt
        noremap <leader>3 3gt
        noremap <leader>4 4gt
        noremap <leader>5 5gt
        noremap <leader>6 6gt
        noremap <leader>7 7gt
        noremap <leader>8 8gt
        noremap <leader>9 9gt
        noremap <leader>0 :tablast<CR>
    " }}}

    " remove searchs highlight
    noremap <silent><leader>/ :nohls<CR>

    " Select all
    map <leader>sa ggvG$

    " Quickly save the current file
    nnoremap <leader>w :w<CR>

    " Formatting
    map <leader>q gqip

    " Uncomment this to enable by default:
    " set list 
    " To enable by default
    " Or use or leader key + l to toggle on/off
    " Toggle tabs and EOL
    map <leader>l :set list!<CR> 

    " You can't stop me
    cmap w!! w !sudo tee %

    " close the current buffer {{{
    map <leader>bd :Bclose<cr>:tabclose<cr>gT
  
  " SIMPLE SURROUND {{{
        vmap " S"
        vmap ' S'
        vmap ` S`
        vmap [ S[
        vmap ( S(
        vmap { S{
        vmap } S}
        vmap ] S]
        vmap ) S)
  " }}}

    " RELATIVE NUMBER {{{
        set relativenumber
        augroup CursorLineOnlyInActiveWindow
            autocmd!
            autocmd InsertLeave * setlocal relativenumber
            autocmd InsertEnter * setlocal norelativenumber
            autocmd BufEnter * setlocal cursorline
            autocmd BufLeave * setlocal nocursorline
        augroup END
        function! NumberToggle()
            if(&relativenumber == 1)
                set norelativenumber number
            else
                set relativenumber
            endif
        endfunc
        nnoremap <C-n> :call NumberToggle()<CR>
    " }}}

" }}}
