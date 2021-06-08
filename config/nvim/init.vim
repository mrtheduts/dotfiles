" mrtheduts' vimrc
" inspired by Doug Black's https://dougblack.io/words/a-good-vimrc.html

" Plugins {{{
if has('nvim')

    call plug#begin()

    " Aerojump - Easier (fuzzy) navigation in file
    " https://github.com/ripxorip/aerojump.nvim
    Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

    " Breezy - vim theme
    " https://github.com/fneu/breezy
    Plug 'fneu/breezy'

    " Conquer Of Completion - Language Server Protocol
    " https://github.com/neoclide/coc.nvim

    Plug 'neoclide/coc.nvim', {
    \ 'branch': 'release'
    \ }
    " Coc plugins I use {{{

        " - Spell-checker (multiple languages)
        "   https://github.com/iamcco/coc-spell-checker

        " - Snippet engine - need plugin with snippets
        "   https://github.com/neoclide/coc-snippets

        " - Formatter for JS, TS, CSS and JSON files
        "   https://github.com/neoclide/coc-prettier

        " - Git integration (primarily in statusbar)
        "   https://github.com/neoclide/coc-git

        " - ESLint integration (for JS)
        "   https://github.com/neoclide/coc-eslint

        " - Emmet completion support (needs emmet-vim)
        "   https://github.com/neoclide/coc-eslint

        " - Dictionaries for spell-checker
        "   https://github.com/iamcco/coc-cspell-dicts

        " - Editing support for LaTeX documents (needs TexLab)
        "   https://github.com/fannheyward/coc-texlab

        " - Python support
        "   https://github.com/neoclide/coc-python

        " - JSON support
        "   https://github.com/neoclide/coc-json

        " - HTML support
        "   https://github.com/neoclide/coc-html

        " - CSS support
        "   https://github.com/neoclide/coc-css

        " - CMake support
        "   https://github.com/voldikss/coc-cmake

        " - C-family support
        "   https://github.com/clangd/coc-clangd

    "   }}}

    " CtrlP - Fuzzy File Search
    " https://github.com/ctrlpvim/ctrlp.vim
    Plug 'ctrlpvim/ctrlp.vim'

    " Doorboy - Autoclose brackets
    " https://github.com/itmammoth/doorboy.vim/
    Plug 'itmammoth/doorboy.vim'

    " Goyo - Distraction free vim
    " https://github.com/junegunn/goyo.vim
    Plug 'junegunn/goyo.vim'

    " IndentLine - Show indent lines
    " https://github.com/Yggdroot/indentLine
    Plug 'Yggdroot/indentLine'

    " Markdown-Preview - Preview it in your browser
    " https://github.com/facelessuser/MarkdownPreview
    Plug 'iamcco/markdown-preview.nvim', {
        \ 'do': 'cd app & yarn install'
    \ }

    " NERDtree - File system explorer for the Vim editor
    " https://github.com/preservim/nerdtree
    Plug 'preservim/nerdtree'

    " Nerdtree git integration
    " https://github.com/Xuyuanp/nerdtree-git-plugin
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Targets - more text target objects for vim
    " https://github.com/wellle/targets.vim
    Plug 'wellle/targets.vim'

    " vim-Airline - Status line for vim
    " https://github.com/vim-airline/vim-airline/
    Plug 'vim-airline/vim-airline'
    " https://github.com/vim-airline/vim-airline-themes
    Plug 'vim-airline/vim-airline-themes'

    " vim-Closetag - Autoclose (X)HTML tags
    " https://github.com/alvan/vim-closetag
    Plug 'alvan/vim-closetag'

    " vim-Commentary - Comment stuff out
    " https://github.com/tpope/vim-commentary
    Plug 'tpope/vim-commentary'

    " vim-clang-format
    " https://github.com/rhysd/vim-clang-format
    Plug 'rhysd/vim-clang-format'

    " vim-DevIcons - File icons inside vim
    " https://github.com/ryanoasis/vim-devicons
    Plug 'ryanoasis/vim-devicons'

    " vim-Easymotion - Jump to target inside file
    " https://github.com/easymotion/vim-easymotion
    Plug 'easymotion/vim-easymotion'

    " vim-Eunuch - Sugar for UNIX shell commands
    " https://github.com/tpope/vim-eunuch
    Plug 'tpope/vim-eunuch'

    " vim-Fugitive - Git wrapper for vim
    " https://github.com/tpope/vim-fugitive
    Plug 'tpope/vim-fugitive'

    " vim-Grepper - Use Ag (grep inside multiple files) inside nvim
    " https://github.com/mhinz/vim-grepper/
    Plug 'mhinz/vim-grepper'

    " vim-Hexokinase - Asynchronously displays colour previews
    " https://github.com/RRethy/vim-hexokinase
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    " vim-LSP-CXX-Highlight - Syntax colour from LSP data
    " https://github.com/jackguo380/vim-lsp-cxx-highlight
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    " vim-Mundo - Visualize vim undo tree
    " https://github.com/simnalamburt/vim-mundo
    Plug 'simnalamburt/vim-mundo'

    "vim-Nerdtree-Syntax-Highlight - Colour syntax for NERDTree
    " https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " vim-Pencil - Different word wrappers for writing
    " https://github.com/reedes/vim-pencil
    Plug 'reedes/vim-pencil'

    " vim-Polyglot - A Collection of syntax highlights for Vim
    " https://github.com/sheerun/vim-polyglot
    Plug 'sheerun/vim-polyglot'

    " vim-Snippets - snippets for coc-snippets
    " https://github.com/honza/vim-snippets
    Plug 'honza/vim-snippets'

    " vim-Surround - Surround text object with everything
    " https://github.com/tpope/vim-surround
    Plug 'tpope/vim-surround'

    " winresizer - Easier way to resize windows
    " https://github.com/simeji/winresizer
    Plug 'simeji/winresizer'

    call plug#end()

endif
" }}}

" Colour {{{

    " Enable syntax processing
    syntax enable

if has('nvim')

    set background=light

    " True Color output
    set termguicolors

    " Set theme
    colorscheme breezy
    let g:airline_theme='deus'

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

    " Set tab space the same as the line above
    set smarttab

" }}}

" UI Layout {{{

    " Show relative line number
    :set number relativenumber

    " Show relative lines only on current file
    :augroup numbertoggle
    :  autocmd!
    :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    :augroup END

    " Show command in bottom bar
    set showcmd

    " Highlight current line
    set cursorline

    " Load filetype-specific ident files
    filetype indent on

    " Visual autocomplete for command menu
    set wildmenu

    " Redraw only when we need to
    set lazyredraw

    " Highlight matching [{()}]
    set showmatch

    " DEFAULT MODE INDICATOR FINALLY OFF
    set noshowmode

    " Scrolloff - cursor trigger scroll sooner
    set scrolloff=20

if has('nvim')

    " Add coc status on statusline
    set statusline^=%{coc#status()}

    " Prevents snippets to conceal latex commands as single characters
    let g:tex_conceal = ""

endif
" }}}

" Searching {{{

    " Search as characters are entered
    set incsearch

    " Highlight matches
    set hlsearch

" }}}

" Folding {{{

    " Enable folding
    set foldenable

    " Open most folds by default
    set foldlevelstart=10

    " 10 nested fold max
    set foldnestmax=10

    " Default fold based on indent level
    set foldmethod=indent

" }}}

" Remaping {{{

    " CRITICAL ZONE {{{

        " jk is esc
        inoremap jk <esc>

        " <leader> is comma
        let mapleader=","

    " }}}

    " Splits {{{

        " Jump easily between splits
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
        " Make all splits equally divided
        nnoremap <leader>= <C-w>=

        " Vertical Split
        nnoremap <leader>V :vsp<CR>
        " Horizontal Split
        nnoremap <leader>S :sp<CR>

        " Close split
        map <C-c> :close<CR>

    " }}}

    " Buffers {{{

        " Switch between buffers easily with tab and shift+tab
        nnoremap <A-TAB> :bnext<CR>
        nnoremap <S-TAB> :bprev<CR>

        " Close opened buffer without closing window
        map <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>

        " Close quickfixes (some splits) with esc
        augroup vimrcQfClose
            autocmd!
            autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
        augroup END

    " }}}

    " Misc {{{

    if has('nvim')

        " Enable 'Writer Mode'
        nnoremap <Leader>WM :PencilSoft<CR>:Goyo<CR>

    endif

        " Clipboard mapping
        " Copy and paste to/from system clipboard
        noremap <Leader>y "+y
        noremap <Leader>p "+p

        " Turn off search highlight
        nnoremap <leader>/ :nohlsearch<CR>

    " }}}

" }}}

" Misc {{{

    " Enable line for file-specifc configuration
    set modelines=1

    " Enable persistent undo so that undo history persists across vim sessions
    set undofile
    set undodir=~/.config/nvim/undo

" }}}

" Plugins Config {{{

    " Aerojump {{{
    if has('nvim')

        " Fuzzy search in file
        nmap <space><space> <plug>(AerojumpDefault)
        nmap <space>b <plug>(AerojumpBolt)

    endif
    " }}}

    " Conquer of Completion {{{
    if has('nvim')

        " Misc configs {{{

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

            " Always show the signcolumn, otherwise it would shift the text each time
            " diagnostics appear/become resolved.
            if has("patch-8.1.1564")
              " Recently vim can merge signcolumn and number column into one
              set signcolumn=number
            else
              set signcolumn=yes
            endif

            " Highlight symbol under cursor on CursorHold
            autocmd CursorHold * silent call CocActionAsync('highlight')

        " }}}

        " Remaping {{{

            " Completion maps {{{

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
                if has('nvim')
                  inoremap <silent><expr> <c-space> coc#refresh()
                else
                  inoremap <silent><expr> <c-@> coc#refresh()
                endif

                " Make <CR> auto-select the first completion item and notify coc.nvim to
                " format on enter, <cr> could be remapped by other vim plugin
                inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

                " Use <C-l> for trigger snippet expand.
                imap <C-l> <Plug>(coc-snippets-expand)

                " Use <C-j> for select text for visual placeholder of snippet.
                vmap <C-j> <Plug>(coc-snippets-select)

                " Use <C-j> for both expand and jump (make expand higher priority.)
                imap <C-j> <Plug>(coc-snippets-expand-jump)

                " Use <leader>x for convert visual selected code to snippet
                xmap <leader>x  <Plug>(coc-convert-snippet)

                " }}}

            " Go to file/doc {{{

                " Use K to show documentation in preview window
                nnoremap <silent> K :call <SID>show_documentation()<CR>

                function! s:show_documentation()
                    if (index(['vim','help'], &filetype) >= 0)
                        execute 'h '.expand('<cword>')
                    else
                        call CocAction('doHover')
                    endif
                endfunction

                " Remap keys for gotos
                nmap <silent> gd <Plug>(coc-definition)
                nmap <silent> gy <Plug>(coc-type-definition)
                nmap <silent> gi <Plug>(coc-implementation)
                nmap <silent> gr <Plug>(coc-references)


            " }}}

            " Coc actions/commands {{{

                " Symbol renaming.
                nmap <leader>rn <Plug>(coc-rename)

                " Applying codeAction to the selected region.
                " Example: `<leader>aap` for current paragraph
                xmap <leader>a  <Plug>(coc-codeaction-selected)
                nmap <leader>a  <Plug>(coc-codeaction-selected)

                " Remap keys for applying codeAction to the current buffer.
                nmap <leader>ac  <Plug>(coc-codeaction)
                " Apply AutoFix to problem on the current line.
                nmap <leader>qf  <Plug>(coc-fix-current)

                " Remap <C-f> and <C-b> for scroll float windows/popups.
                if has('nvim-0.4.0') || has('patch-8.2.0750')
                  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
                  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
                  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
                  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
                  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
                  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
                endif
                
                " Using CocList
                " Show all diagnostics
                nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
                " Manage extensions.
                nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
                " Show commands
                nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

                " TeXLab build shortcut
                autocmd FileType plaintex nnoremap <buffer> <silent> <leader>lb :<C-u>CocCommand latex.Build<cr>

                " clangd swap between header and file
                autocmd FileType c,cpp nnoremap <buffer> <silent> <leader>H :<C-u>CocCommand clangd.switchSourceHeader<cr>

            " }}}

        " }}}

    endif
    " }}}

    " EditorConfig {{{
    if has('nvim')

        " Work well with fugitive and over ssh
        let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

    endif
    " }}}

    " NERDTree settings {{{
    if has('nvim')

        " NERDTree remaping
        map <C-A-n> :NERDTreeToggle<cr>

        let g:NERDTreeWinSize = 45

        let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
        let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

        " Open nerdtree if nvim opened a directory
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

        " Close nerdtree when file is opened
        let NERDTreeQuitOnOpen = 1

    endif

    " }}}

    " CtrlP settings {{{
    if has('nvim')

        " Default mapping and command call
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'

        " Will start its search on:
        " r - nearest ancestor of the current file that contains a .git
        " a - the directory of current file
        let g:ctrlp_working_path_mode = 'ra'

        " Ignore these files (Mac and Linux patterns)
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
        \ }

        " Top files from top to bottom
        let g:ctrlp_match_window = 'bottom,order:ttb'

        " Open file in new buffer
        let g:ctrlp_switch_buffer = 1

        " '... [It's possible to] change the working directory during
        " a vim session and make ctrlp respect that change' ~ dougblack
        let g:ctrlp_working_path_mode = 0

        " Tweak CtrlP speed with Ag
        " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

    endif
    " }}}

    " Doorboy {{{
    if has('nvim')

        " Add $ as a bracket in LaTeX files
        let g:doorboy_additional_quotations = {
            \ 'tex': ['$']
        \ }

        " No more '//' in JS
        let g:doorboy_nomap_quotations = {
            \ 'javascript': ['/']
        \ }

    endif
    " }}}

    " IndentLine {{{
    if has('nvim')

        " Starts disabled
        let g:indentLine_enabled = 0

        " Shortcut to enable it
        nnoremap <Leader>I :IndentLinesToggle<CR>

        " Set indent chars list
        let g:indentLine_char_list = ['|', '¦', '┆', '┊']

    endif
    " }}}

    " Mundo {{{
    if has('nvim')

        " Window appears on the right side
        let g:mundo_right = 1

        " Diff appears on the bottom
        let g:mundo_preview_bottom = 1

        " No auto preview
        let g:mundo_auto_preview = 0

        " Remap to toggle Gundo
        map <C-A-u> :MundoToggle<CR>

    endif

    " }}}

    " Nerdtree-git {{{
    if has('nvim')

        " Use nerdfonts
        " let g:NERDTreeGitStatusUseNerdFonts = 1

    endif
    " }}}

    " vim-Airline {{{
    if has('nvim')

        " Enable top tabline
        let g:airline#extensions#tabline#enabled = 1

        " Enable powerline fonts
        let g:airline_powerline_fonts = 1

        " Enable coc integration
        let g:airline#extensions#coc#enabled = 1

    endif

    " }}}

" vim-Clang-format {{{
if has('nvim')

    let g:clang_format#detect_style_file=1
    let g:clang_format#auto_format=1

endif
" }}}

    " vim-Closetag {{{
    if has('nvim')

        " Enable autoclose for specific files
        let g:closetag_filenames = '*.js,*.html,*.xhtml,*.phtml,*.tsx,*.jsx'
        " Enable self-closing tags - JS is not here by default
        let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

    endif
    " }}}

    " vim-Easymotion {{{
    if has('nvim')

        " Jump char across-windows
        nmap <Leader>f <Plug>(easymotion-overwin-f)

        " s{char}{char} to move to {char}{char}
        nmap <Leader>s <Plug>(easymotion-overwin-f2)

        " v will match v and V, but V will match only V
        let g:EasyMotion_smartcase = 1

    endif
    " }}}

    " vim-Grepper {{{
    if has('nvim')

        " Mapping to Grepper on opened buffers
        nnoremap <leader>g :Grepper -tool ag -buffer<cr>
        " Map to Grepper with Ag
        nnoremap <leader>G :Grepper -tool ag<cr>

    endif

    " }}}

    " vim-Hexokinase {{{
    if has('nvim')

        " Hexokinase's preview type
        let g:Hexokinase_highlighters = [ 'backgroundfull' ]

    endif
    " }}}

" }}}

" File-specific settings {{{

" Angular (typescript and html) {{{
if has('nvim')

endif
" }}}
 
"   C/C++ {{{
"
    " Change default indent size
    autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType c   setlocal shiftwidth=2 tabstop=2 softtabstop=2

    if has('nvim')

        " C++ syntax highlighting
        let g:cpp_class_scope_highlight = 1
        let g:cpp_member_variable_highlight = 1
        let g:cpp_class_decl_highlight = 1

    endif
"   }}}

" }}}

" Open this file with folded Sections
" vim:foldmethod=marker:foldlevel=0
