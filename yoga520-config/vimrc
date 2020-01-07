" mrtheduts' vimrc
" inspired by Doug Black's https://dougblack.io/words/a-good-vimrc.html

" Plugins {{{
if has('nvim')

    call plug#begin('~/.local/share/nvim/plugged')

    " Grepper - Use Ag (grep inside multiple files) inside nvim
    Plug 'mhinz/vim-grepper'

    " CtrlP - Fuzzy File Search
    Plug 'ctrlpvim/ctrlp.vim'

    " Gundo - View vim undo tree
    Plug 'sjl/gundo.vim'

    " Conquer Of Completion
    Plug 'neoclide/coc.nvim', {
    \ 'branch': 'release'
    \ }

    " Aerojump - Easier (fuzzy) navigation in file
    Plug 'philip-karlsson/aerojump.nvim', { 
    \ 'do': ':UpdateRemotePlugins' 
    \ }

    " Airline - Status line for vim
    Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'

    " One Half - colour scheme
    Plug 'sonph/onehalf', {
    \ 'rtp': 'vim/'
    \ }

    " A Collection of language packs for Vim
    " One to rule them all
    Plug 'sheerun/vim-polyglot'

    " Markdown live preview
    Plug 'iamcco/markdown-preview.nvim', { 
    \ 'do': 'cd app & yarn install'
    \ }

    " C++ highlight with a lsp
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    " Git wrapper
    Plug 'tpope/vim-fugitive'

    " Commenting Plugin
    Plug 'scrooloose/nerdcommenter'

    " Nerdtree file navigator
    Plug 'scrooloose/nerdtree'

    call plug#end()

endif
" }}}

" Colour {{{
if has('nvim')
    colorscheme onehalfdark
	let g:airline_theme='onehalfdark'
endif
" }}}

" Misc {{{

    " Leader is comma
    let mapleader=","

    " Enable syntax processing
    syntax enable

    " Enable line for file-specifc configuration
    set modelines=1

    " WARNING
    " jk is esc
    inoremap jk <esc>

    " Save session
    nnoremap <leader>s :mksession<CR>

    " Add coc status on statusline
    set statusline^=%{coc#status()}

    " Scrolloff
    set scrolloff=20

    " Necessary for NerdComenter
    filetype plugin on

    " Clipboard mapping
    " Copy and paste to/from system clipboard
    noremap <Leader>y "+y
    noremap <Leader>p "+p

" }}}

" Splits {{{

    " Jump between splits more easily
    " Up
    nnoremap <C-k> <C-w>k
    " Down
    nnoremap <C-j> <C-w>j
    " Right
    nnoremap <C-l> <C-w>l
    " Left
    nnoremap <C-h> <C-w>h

    " Increase split window height
    nnoremap <Leader>k <C-w>+
    " Decrease split window height
    nnoremap <Leader>j <C-w>-
    " Increase split window width
    nnoremap <Leader>l <C-w>>
    " Decrease split window width
    nnoremap <Leader>h <C-w><

" }}}

" Language Server Protocol {{{

if has('nvim')

    " Without it, TextEdit might fail
    set hidden

    " Some servers have issues with backup files
    set nobackup
    set nowritebackup

    " Better display for messages
    set cmdheight=2

    " You will have bad experience for diagnostic messages 
    " when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped
    " by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
endif

" }}}

" Spaces & Tabs {{{

    " Number of visual spaces per TAB
    set tabstop=4

    " Number of spaces in tab when editing
    set softtabstop=4

    " Tabs are spaces
    set expandtab

    " Set shift width to 4 spaces
    set shiftwidth=4

    " Set autoindent on
    set autoindent

    set smarttab

" }}}

" UI Layout {{{

    " Show line numbers
    set number

    " Show command in bottom bar
    set showcmd

    " Highlidht current line
    set cursorline

    " Load filetype-specific ident files
    filetype indent on

    " Visual autocomplete for command menu
    set wildmenu

    " Redraw only when we need to
    set lazyredraw

    " Highlight matching [{()}]
    set showmatch

    " Default mode indicator FINALLY OFF
    set noshowmode

" }}}

" Searching {{{

    " Search as characters are entered
    set incsearch

    " Highlight matches
    set hlsearch

    " Turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>

" }}}

" Folding {{{

    " Enable folding
    set foldenable

    " Open most folds by default
    set foldlevelstart=10

    " 10 nested fold max
    set foldnestmax=10

    " Space open/closes folds
    nnoremap <space> za

    " Fold based on indent level
    set foldmethod=indent

" }}}

" Line Shortcuts {{{

    " Move vertically by visual line
    nnoremap j gj
    nnoremap k gk

    " Move to beginning/end of line
    nnoremap B ^
    nnoremap E $

    " $/^ doesn't do anything
    nnoremap $ <nop>
    nnoremap ^ <nop>

" }}}

" Buffer {{{

    " Switch between buffers easily with tab and shift+tab
    nnoremap <TAB> :bnext<CR>
    nnoremap <S-TAB> :bprev<CR>

" }}}

" Aerojump {{{

if has('nvim')
    nmap <leader>fs <plug>(AerojumpSpace)
    nmap <leader>fb <plug>(AerojumpBolt)
endif

" }}}

" Airline {{{

if has('nvim')
    " Enable top tabline
    let g:airline#extensions#tabline#enabled = 1

    " Enable powerline fonts
    let g:airline_powerline_fonts = 1

    " Enable coc integration
    let g:airline#extensions#coc#enabled = 1
endif

" }}}

" Gundo {{{

if has('nvim')
    nnoremap <leader>u :GundoToggle<CR>
endif

" }}}

" Grepper {{{

" Mapping to Grepper
if has('nvim')
    nnoremap <leader>g :Grepper -tool git<cr>
    nnoremap <leader>G :Grepper -tool ag<cr>

    nmap gs <plug>(GrepperOperator)
    xmap gs <plug>(GrepperOperator)

endif

" }}}

" CtrlP settings {{{

if has('nvim')
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0

    " Tweak CtrlP speed with Ag
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" }}}

" Nerdtree settings {{{

if has('nvim')
    map <C-n> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
endif

" }}}

" Ctags {{{

if has('nvim')
    " Generate them with ctags and add them here
    set tags+=$HOME/Git/unicamp/EmuParadise
endif

" }}}

" Open this file with folded Sections
" vim:foldmethod=marker:foldlevel=0
