if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
\    'build': {
\        'unix': 'make -f make_unix.mak',
\        'mac': 'make -f make_mac.mak',
\    },
\ }

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'xaviershay/tslime.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'ludovicchabant/vim-lawrencium'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'kalekseev/splitjoin.vim', 'scala'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'thinca/vim-visualstar'

NeoBundleLazy 'vim-scripts/matchit.zip'
NeoBundleLazy 'Shougo/neosnippet'
NeoBundleLazy 'rking/ag.vim'
NeoBundleLazy 'mitsuhiko/vim-python-combined'
NeoBundleLazy 'amirh/HTML-AutoCloseTag'
NeoBundleLazy 'pangloss/vim-javascript', { 'build': { 'unix': 'cp ftdetect/* ~/.vim/ftdetect/' } }
NeoBundleLazy 'elzr/vim-json', { 'build': { 'unix': 'cp ftdetect/* ~/.vim/ftdetect/' } }
NeoBundleLazy 'wting/rust.vim', { 'build': { 'unix': 'cp ftdetect/* ~/.vim/ftdetect/' } }
NeoBundleLazy 'derekwyatt/vim-scala', { 'build': { 'unix': 'cp ftdetect/* ~/.vim/ftdetect/' } }
NeoBundleLazy 'hail2u/vim-css3-syntax'
NeoBundleLazy 'thinca/vim-qfreplace'
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'thinca/vim-unite-history'
NeoBundleLazy 'gregsexton/MatchTag'
NeoBundleLazy 'gorodinskiy/vim-coloresque'
NeoBundleLazy 'mbbill/undotree'
NeoBundleLazy 'majutsushi/tagbar'
NeoBundleLazy 'kana/vim-niceblock'
NeoBundleLazy 'tsukkee/unite-help'
NeoBundleLazy 'add20/vim-conque'
NeoBundleLazy 'kana/vim-smartchr'


call neobundle#end()

filetype plugin indent on

NeoBundleCheck




"* * * * * * * * * * * * * * * * * SETUP * * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" turn on syntax highlighting
syntax on

" allow backspacing over everything in INS mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

" show incomplete cmds down the bottom
set showcmd

" show current mode down the bottom
set showmode

" add line numbers
set number

" start wrapped lines with the string
set showbreak=↪..

" wrap lines
set wrap

" don't break words
set linebreak

" listchars
set list listchars=tab:»·

" add some line space for easy reading
set linespace=4

" disable visual bell
set visualbell t_vb=

" always show statusline
set laststatus=2

" hide buffers when not displayed
set hidden

" remap leader
let mapleader = "\<Space>"

" russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" turn off needless toolbar on gvim/mvim
set guioptions-=T
set guioptions-=m
" off scrollbar
set guioptions-=rL
" no guitablabel
set guioptions-=e


" indent settings
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent

" fold based on indent
set foldmethod=indent

" deepest fold is 3 levels
set foldnestmax=3

" dont fold by default
set nofoldenable

" make cmdline tab completion similar to bash
set wildmode=list:longest

" enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
set wildignore=*.aux,*.log,*.class,*.o,*.obj,*~,.git,*.pyc

" dont continue comments when pushing o/O
set formatoptions-=o

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" backup
set nobackup
set nowritebackup
set noswapfile
set backupdir-=.
set autowrite

set viminfo+=n~/.vim/.viminfo

" store undo
if has("persistent_undo")
    set undodir=~/.vim/undo,.
    set undofile
endif

" split to right
set splitright
set splitbelow

" reload when files modified outside of vim
set autoread

" fast terminal connection
set ttyfast

" yank use system clipboard
set clipboard=unnamed

" ignore case only if contains upper case
set ignorecase
set smartcase

" incremental search
set incsearch

" match highlight
set hlsearch

" search from the top at the end
set wrapscan

" don't redraw while macro execution
set lazyredraw

" toggle paste
set pastetoggle=<F2>

if has("gui_running")
    set guifont=Consolas\ 12
else
    set t_Co=16
    " dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
    endif
endif

" theme
colorscheme solarized
set background=dark
set colorcolumn=80

" encoding
set termencoding=utf-8

" set dropdown to match solarized light
highlight Pmenu ctermfg=254 ctermbg=241
highlight PmenuSel ctermfg=254 ctermbg=136 cterm=bold

" better MatchParen color for solarized
hi MatchParen cterm=bold ctermbg=none ctermfg=DarkMagenta

" html indent
let g:html_indent_inctags = "html,body,head,tbody,li,p"

" reset my autocmd group
augroup MyAutoCmd
    autocmd!
augroup END

" save of focus lost
au FocusLost * :silent! wall

"set cursorline
"augroup cline
    "au!
    "au WinLeave,InsertEnter * set nocursorline
    "au WinEnter,InsertLeave * set cursorline
"augroup END

" don't show trailing spaces in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
augroup END

"* * * * * * * * * * * * * * * * * MAPPING * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" edit vimrc
nnoremap <Leader>ev :<C-u>edit $MYVIMRC<CR>

" replace selected text
vnoremap r "_dP

" toggle paste
nmap <F2> :set invpaste paste?<CR>

" switch between two files
map <Leader><Leader> <C-^>

" disable arrow keys
map <Up> <C-W>+
map <Down> <C-W>-
map <Left> <C-W><
map <Right> <C-W>>

" make <c-m> clear the highlight as well as redraw
nmap <leader>m :nohls<CR>

" map Q to something useful
map Q gq

command! -bang Q q<bang>
command! -bang QA q<bang>
command! -bang Qa q<bang>

" make Y consistent with C and D
nmap Y y$

" key mapping for window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" key mapping for saving file
nmap <C-s> :w<CR>

" write with sudo
cmap w!! %!sudo tee > /dev/null %

" remove trailing whitespace
nmap <leader>t :%s/\s\+$<CR>

" indent
nmap < <<
nmap > >>
xmap < <gV
xmap > >gV

" use sane regexes
nmap / /\v
vmap / /\v

" reselect pasted text
nmap <Leader>v V`]

nmap <Leader>r cgn
"nnoremap <C-j> :m+<CR>==
"nnoremap <C-k> :m-2<CR>==
"nnoremap <C-h> <<
"nnoremap <C-l> >>
"inoremap <C-j> <Esc>:m+<CR>==gi
"inoremap <C-k> <Esc>:m-2<CR>==gi
"inoremap <C-h> <Esc><<`]a
"inoremap <C-l> <Esc>>>`]a
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv
vnoremap <C-h> <gv
vnoremap <C-l> >gv

map ; :

" https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
nnoremap <silent> <leader>0 :call clearmatches()<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=Magenta
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=Red
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=DarkBlue
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=Cyan
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=Green
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=DarkYellow



"* * * * * * * * * * * * * * * * * PLUGINS * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

"signify
"==============================================================================
if neobundle#tap('vim-signify')
    let g:signify_vcs_list = [ 'git', 'hg' ]
    let g:signify_sign_change = '~'
    let g:signify_disable_by_default = 1

    call neobundle#untap()
endif


" CamelCaseMotion
"==============================================================================
if neobundle#tap('CamelCaseMotion')
    nmap <silent> W <Plug>CamelCaseMotion_w
    xmap <silent> W <Plug>CamelCaseMotion_w
    omap <silent> W <Plug>CamelCaseMotion_w
    nmap <silent> B <Plug>CamelCaseMotion_b
    xmap <silent> B <Plug>CamelCaseMotion_b
    omap <silent> B <Plug>CamelCaseMotion_b

    call neobundle#untap()
endif


" silver searcher
"==============================================================================
if neobundle#tap('ag.vim')
    call neobundle#config({
    \    'autoload': {
    \       'commands': ['Ag', 'AgAdd', 'AgFromSearch']
    \    }
    \ })

    nmap <leader>a :Ag! <C-w><cr>

    call neobundle#untap()
endif


" vim-javascript
"==============================================================================
if neobundle#tap('vim-javascript')
    call neobundle#config({
    \    'autoload': {
    \       'filetypes': 'javascript',
    \       'filename_patterns': '\.js$'
    \    }
    \ })

    let javascript_enable_domhtmlcss = 1
    let g:javascript_conceal = 1

    call neobundle#untap()
endif


" vim-scala
"==============================================================================
if neobundle#tap('vim-scala')
    call neobundle#config({
    \    'autoload': {
    \       'filetypes': 'scala',
    \       'filename_patterns': '\.scala$'
    \    }
    \ })

    call neobundle#untap()
endif


" vim-css3-syntax
"==============================================================================
if neobundle#tap('vim-css3-syntax')
    call neobundle#config({
    \    'autoload': {
    \       'filetypes': ['css', 'scss', 'html']
    \    }
    \ })

    call neobundle#untap()
endif


" vim-json
"==============================================================================
if neobundle#tap('vim-json')
    call neobundle#config({
    \    'autoload': {
    \       'filetypes': 'json',
    \       'filename_patterns': '\.json$'
    \    }
    \ })

    call neobundle#untap()
endif


" rust.vim
"==============================================================================
if neobundle#tap('rust.vim')
    call neobundle#config({
    \    'autoload': {
    \       'filetypes': 'rust',
    \       'filename_patterns': '\.rs$'
    \    }
    \ })

    call neobundle#untap()
endif


" vim-python-combined
"==============================================================================
if neobundle#tap('vim-python-combined')
    call neobundle#config({
    \    'autoload': {
    \       'filetypes': 'python'
    \    }
    \ })

    call neobundle#untap()
endif


" HTML-AutoCloseTag
"==============================================================================
if neobundle#tap('HTML-AutoCloseTag')
    call neobundle#config({
    \    'autoload': {
    \       'filetypes': 'html'
    \    }
    \ })

    call neobundle#untap()
endif


" NERDTree
"==============================================================================
if neobundle#tap('nerdtree')
    silent! nmap <silent> <leader>p :NERDTreeToggle<CR>
    nmap <silent> <C-f> :NERDTreeFind<CR>

    call neobundle#untap()
endif


" vim-niceblock
"==============================================================================
if neobundle#tap('vim-niceblock')
    call neobundle#config({
    \    'autoload': {
    \       'mappings': '<Plug>'
    \    }
    \ })
    xmap I <Plug>(niceblock-I)
    xmap A <Plug>(niceblock-A)

    call neobundle#untap()
endif



" tagbar
"==============================================================================
if neobundle#tap('tagbar')
    call neobundle#config({
    \    'autoload': {
    \        'commands': ['TagbarToggle']
    \    }
    \ })

    let g:tagbar_autoclose = 1

    nmap <silent> <F9> :TagbarToggle<CR>

    call neobundle#untap()
endif


" airline
"==============================================================================
if neobundle#tap('vim-airline')
    let g:airline_theme = "solarized"
    let g:airline_detect_paste = 1
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'Þ'

    call neobundle#untap()
endif


" syntastic
"==============================================================================
if neobundle#tap('syntastic')
    let g:syntastic_enable_signs = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_style_error_symbol = '✗'
    let g:syntastic_style_warning_symbol = '⚠'
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_python_checkers = ['pyflakes']

    call neobundle#untap()
endif


" fugitive
"==============================================================================
if neobundle#tap('vim-fugitive')
    " auto-clean fugitive buffer
    autocmd MyAutoCmd BufReadPost fugitive://* set bufhidden=delete
    command! -bang -nargs=+ Sgrep execute 'silent Ggrep<bang> <args>' | copen


    call neobundle#untap()
endif


" delimitMate
"==============================================================================
if neobundle#tap('delimitMate')
    "<CR> remaped for neocoplete, don't forget add delimitMateCr
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1

    call neobundle#untap()
endif


" MatchTag
"==============================================================================
if neobundle#tap('MatchTag')
    call neobundle#config({
    \    'autoload': {
    \        'filetypes': ['html', 'xml']
    \    }
    \ })

    call neobundle#untap()
endif


" vim-coloresque
"==============================================================================
if neobundle#tap('vim-coloresque')
    call neobundle#config({
    \    'autoload': {
    \        'filetypes': ['html', 'css', 'scss', 'sass', 'vim', 'less']
    \    }
    \ })

    call neobundle#untap()
endif


" undotree
"==============================================================================
if neobundle#tap('undotree')
    call neobundle#config({
    \    'autoload': {
    \        'commands': ['UndotreeToggle']
    \    }
    \ })

    call neobundle#untap()
endif


" vim-qfreplace
"==============================================================================
if neobundle#tap('vim-qfreplace')
    call neobundle#config({
    \    'autoload': {
    \        'commands': ['Qfreplace']
    \    }
    \ })

    call neobundle#untap()
endif


" vim-qfreplace
"==============================================================================
if neobundle#tap('vim-quickrun')
    call neobundle#config({
    \    'autoload': {
    \        'commands': ['QuickRun'],
    \        'mappings' : '<Plug>(quickrun)',
    \    }
    \ })

    let g:quickrun_no_default_key_mappings = 1

    nmap <F5> <Plug>(quickrun)
    vmap <F5> <Plug>(quickrun)

    call neobundle#untap()
endif


" matchit.zip
"==============================================================================
if neobundle#tap('matchit.zip')
    call neobundle#config({
    \    'autoload': {
    \        'filetypes': ['html', 'xml']
    \    }
    \ })

    call neobundle#untap()
endif


" neosnippet
"==============================================================================
if neobundle#tap('neosnippet')
    call neobundle#config({
    \    'autoload': {
    \        'commands': ['NeoSnippetEdit', 'NeoSnippetSource'],
    \        'depends' : ['Shougo/neosnippet-snippets', 'Shougo/neocomplete'],
    \        'filetypes': 'snippet',
    \        'insert': 1,
    \        'unite_sources': ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
    \    }
    \ })

    function! neobundle#tapped.hooks.on_source(bundle)
        let g:neosnippet#enable_snipmate_compatibility = 1
        let g:neosnippet#snippets_directory = '~/.vim/snippets'
        xmap <Leader>s     <Plug>(neosnippet_expand_target)

        imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)"
                    \: pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)"
                    \: "\<TAB>""
    endfunction
    call neobundle#untap()
endif


" neocomplete
"==============================================================================
if neobundle#tap('neocomplete')
    let g:neocomplete#enable_at_startup = 1
    " use smartcase
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_camel_case = 1
    " minimum syntax keyword length
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " Set auto completion length.
    let g:neocomplete#auto_completion_start_length = 2
    " Set minimum keyword length.
    let g:neocomplete#min_keyword_length = 3


    "imap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    imap <expr> <CR> pumvisible() ? neocomplete#close_popup() . "\<CR>" : '<Plug>delimitMateCR'

    call neobundle#untap()
endif


" ctrlp
"==============================================================================
if neobundle#tap('ctrlp.vim')
    let g:ctrlp_custom_ignore = {
    \    'dir': '\v[\/](\.git|\.hg|\.svn|target)$',
    \    'file': '\v\.(exe|so|dll|class|aux|log|jar)$',
    \ }

    call neobundle#untap()
endif


" unite
"==============================================================================
if neobundle#tap('unite.vim')
    let g:unite_source_history_yank_enable = 1

    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])

    nmap <Leader>b :Unite -start-insert buffer<cr>
    nmap <Leader>h :Unite history/yank<cr>

    call neobundle#untap()
endif


" sneak
" =============================================================================
if neobundle#tap('vim-sneak')
    let g:sneak#s_next = 1
    let g:sneak#streak = 1

    call neobundle#untap()
endif


" indentline
"==============================================================================
if neobundle#tap('indentLine')
    let g:indentLine_char = '┊'
    let g:indentLine_noConcealCursor=""
    let g:indentLine_faster = 1

    call neobundle#untap()
endif


" vim-smartchr
"==============================================================================
if neobundle#tap('vim-smartchr')
    call neobundle#config({
    \    'autoload': {
    \        'insert': 1
    \    }
    \ })

    imap <expr> , smartchr#one_of(', ', ',')
    augroup MyAutoCmd
        autocmd FileType scala
            \ inoremap <buffer> <expr> - smartchr#loop('-', ' -> ', ' <- ')
            \| inoremap <buffer> <expr> : smartchr#loop(': ', ':', ' :: ')
            \| inoremap <buffer> <expr> . smartchr#loop('.', ' => ')
    augroup END

    call neobundle#untap()
endif


" vim-conque
" =============================================================================
if neobundle#tap('vim-conque')
    call neobundle#config({
    \    'autoload': {
    \        'commands' : 'ConqueTerm'
    \    }
    \ })

    call neobundle#untap()
endif


"* * * * * * * * * * * * * * * * * EXTRA * * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" Reload .vimrc automatically.
autocmd MyAutoCmd BufWritePost .vimrc,vimrc
    \ NeoBundleClearCache | source $MYVIMRC | redraw


" jump to last cursor position when opening a file
" don't do it when writing a commit log entry
autocmd MyAutoCmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" cuda
autocmd MyAutoCmd BufRead,BufNewFile *.cuh set ft=cuda

function! BreakpointToggle(lnum, cmd)
    let line = getline(a:lnum)
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).a:cmd)
    normal k
    if &modifiable && &modified | write | endif
endfunction


if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
