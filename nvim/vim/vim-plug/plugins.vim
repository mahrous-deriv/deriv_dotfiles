" auto-install vim-plug {{{

  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif

" }}}

" PLUGINS {{{

  call plug#begin('~/.vim/autoload/plugged')

        " Automatically install missing plugins on startup {{{

          autocmd VimEnter *
              \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
              \|   PlugInstall --sync | q
              \| endif

        " }}}

    " Themes {{{

      " Airline and Airline themes {{{
      Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = ''
        let g:airline#extensions#tabline#right_sep = ''
        let g:airline#extensions#tabline#right_alt_sep = ''
        let g:airline#extensions#tabline#exclude_preview = 1
        let g:airline#extensions#tabline#show_buffers = 1
        let g:airline#extensions#tabline#tab_nr_type = 2
        let g:airline#extensions#bufferline#enabled = 1
        " Switch to your current theme
        let g:airline_theme = 'gruvbox'
        " Always show tabs
        set showtabline=2
      " }}}

      " Onedark theme
      Plug 'joshdick/onedark.vim'

      " Gruvbox theme
      Plug 'morhetz/gruvbox'

      " Iceberg theme
      Plug 'cocopon/iceberg.vim'

    " }}}

    " NERDTree {{{

        Plug 'preservim/nerdtree'
        let g:NERDTreeDirArrows = 0
        let g:nerdtree_tabs_open_on_gui_startup = 0
        nnoremap <leader>q :bp<cr>:bd #<cr>
        " let NERDTreeIgnore=['node_modules']
        nnoremap <leader>n :NERDTreeFocus<CR>
        " nnoremap <C-n> :NERDTree<CR>
        nnoremap <C-t> :NERDTreeToggle<CR>
        " On-demand loading
        " Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
        nnoremap <C-f> :NERDTreeFind<CR>
        " Start NERDTree when Vim is started without file arguments.
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

    " }}}

    " Auto pairs for '(' '[' '{' {{{

      Plug 'jiangmiao/auto-pairs'
        " let g:AutoPairsShortcutBackInsert = '<M-b>'
        " <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
        " <BS>  : Delete brackets in pair
        " <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
        " <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
        " <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
        " <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)

    " }}}

    " EasyAlign {{{

        " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
        Plug 'junegunn/vim-easy-align'
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)

    " }}}

    " multiplecursors {{{

      Plug 'terryma/vim-multiple-cursors'
        let g:multi_cursor_use_default_mapping=0
        " Default mapping
        let g:multi_cursor_next_key='<C-m>'
        let g:multi_cursor_prev_key='<C-p>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'

    " }}}

    " fugitive {{{

      Plug 'tpope/vim-fugitive'
        " :Gdiff  :Gstatus :Gvsplit
        " use zsh alias
        nnoremap <leader>gaa :Git add .<CR>
        nnoremap <leader>gc :Gcommit<CR>
        nnoremap <leader>gp :Gpush<CR>
        nnoremap <leader>gl :Gpull<CR>
        nnoremap <leader>gb :Gblame<CR>
        nnoremap <leader>gst :Gstatus<CR>
        nnoremap <leader>gd :Gdiff<CR>
        nnoremap <leader>glg :Glog<CR>

    " }}}

    " Full path fuzzy file, buffer, mru, tag, ... finder {{{
    Plug 'ctrlpvim/ctrlp.vim'
      " To invoke CtrlP in find file mode :CtrlP or :CtrlP [starting-directory]
      " Find buffer or find MRU file mode :CtrlPBuffer or :CtrlPMRU to invoke CtrlP
      " Search in Files, Buffers and MRU files at the same time :CtrlPMixed
      " for other commands :help ctrlp-commands and :help ctrlp-extensions

      set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
      set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

      let g:ctrlp_cmd = 'CtrlPMixed'               " search anything (in files, buffers and MRU files at the same time.)
      let g:ctrlp_by_filename = 1
      let g:ctrlp_working_path_mode = 'ra'         " search for nearest ancestor like .git, .hg, and the directory of the current file
      let g:ctrlp_match_window_bottom = 1          " show the match window at the top of the screen
      let g:ctrlp_max_height = 10                  " maxiumum height of match window
      let g:ctrlp_switch_buffer = 'Et'             " jump to a file if it's open already
      let g:ctrlp_use_caching = 1                  " enable caching
      let g:ctrlp_clear_cache_on_exit=1            " speed up by not removing clearing cache evertime
      let g:ctrlp_mruf_max = 250                   " number of recently opened files
      let g:ctrlp_open_new_file = 't'
      let g:ctrlp_open_multiple_files = 't'
      let g:ctrlp_open_new_file = 'r'
      let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.build|github.com|labix.org|bin|pkg)$',
          \ 'file': '\v(\.exe|\.so|\.dll|\.a|\.xls|\.csv|\.json|\.log|\.out|gs|gw|gm|tags|gotags|\/U)$',
          \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
          \ }
      let g:ctrlp_buftag_types = {
          \ 'go'         : '--language-force=go --golang-types=ftv',
          \ 'as'         : '--language-force=actionscript --actionscript-types=fpvc',
          \ 'actionscript': '--language-force=actionscript --actionscript-types=fpvc',
          \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
          \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
          \ 'objc'       : '--language-force=objc --objc-types=mpci',
          \ 'rc'         : '--language-force=rust --rust-types=fTm'
          \ }
      let g:ctrlp_prompt_mappings = {
          \ 'PrtBS()':              ['<bs>', '<c-]>'],
          \ 'PrtDelete()':          ['<del>'],
          \ 'PrtDeleteWord()':      ['<c-w>'],
          \ 'PrtClear()':           ['<c-u>'],
          \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
          \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
          \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
          \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
          \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
          \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
          \ 'PrtHistory(-1)':       ['<c-n>'],
          \ 'PrtHistory(1)':        ['<c-p>'],
          \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
          \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
          \ 'AcceptSelection("t")': ['<c-t>'],
          \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
          \ 'ToggleFocus()':        ['<s-tab>'],
          \ 'ToggleRegex()':        ['<c-r>'],
          \ 'ToggleByFname()':      ['<c-d>'],
          \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
          \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
          \ 'PrtExpandDir()':       ['<tab>'],
          \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
          \ 'PrtInsert()':          ['<c-\>'],
          \ 'PrtCurStart()':        ['<c-a>'],
          \ 'PrtCurEnd()':          ['<c-e>'],
          \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
          \ 'PrtCurRight()':        ['<c-l>', '<right>'],
          \ 'PrtClearCache()':      ['<F5>'],
          \ 'PrtDeleteEnt()':       ['<F7>'],
          \ 'CreateNewFile()':      ['<c-y>'],
          \ 'MarkToOpen()':         ['<c-z>'],
          \ 'OpenMulti()':          ['<D-o>'],
          \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
          \ }
    " }}}

    " nerdtree-git-plugin symbols {{{
    Plug 'Xuyuanp/nerdtree-git-plugin'
      let g:NERDTreeGitStatusIndicatorMapCustom = {
          \ "Modified"  : "✹",
          \ "Staged"    : "✚",
          \ "Untracked" : "✭",
          \ "Renamed"   : "➜",
          \ "Unmerged"  : "═",
          \ "Deleted"   : "✖",
          \ "Dirty"     : "✗",
          \ "Clean"     : "✔︎",
          \ "Unknown"   : "?"
          \ }
    " }}}

    " Asynchronous Lint Engine {{{

        Plug 'dense-analysis/ale'
        " fixing code :ALEFix
        " Go To Definition :ALEGoToDefinition
        " Finding references :ALEFindReferences
        " Hover information :ALEHover
        " Symbol search :ALESymbolSearch

    " }}}

    " CtrlSF {{{
    Plug 'dyng/ctrlsf.vim'
      command! CO CtrlSFOpen
      let g:ctrlsf_ackprg = 'rg'
      let g:ctrlsf_winsize = '30%'
      let g:ctrlsf_auto_close = 1
      let g:ctrlsf_ignore_dir = ['vendor', 'bower_components', 'node_modules']
    " }}}

    " easymotion {{{
    Plug 'Lokaltog/vim-easymotion'
      let g:EasyMotion_smartcase = 1
      " keep cursor colum when JK motion
      let g:EasyMotion_startofline = 0
      map <Leader><leader>h <Plug>(easymotion-linebackward)
      map <Leader><Leader>j <Plug>(easymotion-j)
      map <Leader><Leader>k <Plug>(easymotion-k)
      map <Leader><leader>l <Plug>(easymotion-lineforward)
      map <Leader><leader>. <Plug>(easymotion-repeat)
    " }}}
    
    " Better Syntax Support {{{
    Plug 'sheerun/vim-polyglot'
      " let g:polyglot_disabled = ['sensible']
    " }}}

    " syntastic {{{
    Plug 'vim-syntastic/syntastic'
      set statusline+=%#warningmsg#
      set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*

      let g:syntastic_check_on_wq=1
      let g:syntastic_auto_jump=1
      let g:syntastic_auto_loc_list=1
      let g:syntastic_error_symbol = "▶▶"
      let g:syntastic_warning_symbol = "⚠"

      let g:syntastic_sh_checkers = ['shellcheck']
      "let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
      " passive
      let g:syntastic_mode_map = { "mode": "active",
          \ "active_filetypes": ["ruby", "go", "python", "cpp", "rust"],
          \ "passive_filetypes": ["shell", "perl"] }
    " }}}

    " TComment {{{
    Plug 'tomtom/tcomment_vim'
    " }}}

    " Surround {{{
    Plug 'tpope/vim-surround'
    " }}}

    " Tagbar {{{
    Plug 'majutsushi/tagbar'
    " }}}

    " Ack {{{
    Plug 'mileszs/ack.vim'
    " }}}

    " NERDTree Tabs {{{
    Plug 'jistr/vim-nerdtree-tabs'
    " }}}

    " Sensible {{{
    Plug 'tpope/vim-sensible'
    " }}}

    " Lua FTPlugin {{{
    Plug 'xolox/vim-lua-ftplugin'
    " }}}

    " Misc {{{
    Plug 'xolox/vim-misc'
    " }}}

    " Gitv {{{
    Plug 'gregsexton/gitv'
    " }}}

    " GitGutter {{{
    Plug 'airblade/vim-gitgutter'
    " }}}

    call plug#end()

" }}}
