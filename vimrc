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
NeoBundleLazy 'Shougo/neosnippet', { 'depends': ['Shougo/neocomplete'] }
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'rking/ag.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'xaviershay/tslime.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'mbbill/undotree'
NeoBundle 'mitsuhiko/vim-python-combined'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'ludovicchabant/vim-lawrencium'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kris89/vim-multiple-cursors'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'wting/rust.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'elzr/vim-json'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'

" HTML
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'

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
set showbreak=...

" wrap lines
set wrap

" don't break words
set linebreak

" hide listchars
set nolist

" add some line space for easy reading
set linespace=4

" disable visual bell
set visualbell t_vb=

" always show statusline
set laststatus=2

" hide buffers when not displayed
set hidden

" remap leader
let mapleader=','

" russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" turn off needless toolbar on gvim/mvim
set guioptions-=T
set guioptions-=m

" indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

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

" backup directory
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.
set viminfo+=n~/.vim/.viminfo

" store undo
if has("persistent_undo")
    set undodir=~/.vim/undo,.
    set undofile
endif

" split to right
set splitright

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

" toggle paste
set pastetoggle=<F2>

" theme
colorscheme solarized
set background=dark
set colorcolumn=80

if has("gui_running")
    set guitablabel=%M%t
    set lines=30
    set columns=84
    set guifont=Monospace\ 12
else
    set t_Co=16
    " dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
    endif
endif




"* * * * * * * * * * * * * * * * * MAPPING * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" toggle paste
nnoremap <F2> :set invpaste paste?<CR>

" disable arrow keys
noremap <Up> <C-W>+
noremap <Down> <C-W>-
noremap <Left> <C-W><
noremap <Right> <C-W>>

" make <c-m> clear the highlight as well as redraw
nnoremap <leader>m :nohls<CR>

" map Q to something useful
noremap Q gq

" make Y consistent with C and D
nnoremap Y y$

" key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" key mapping for saving file
nmap <C-s> :w<CR>

" write with sudo
cmap w!! %!sudo tee > /dev/null %

" remove trailing whitespace
nnoremap <leader>t :%s/\s\+$<CR>

command! -bang -nargs=+ Sgrep execute 'silent Ggrep<bang> <args>' | copen




"* * * * * * * * * * * * * * * * * PLUGINS * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" silver searcher
"==============================================================================
if neobundle#tap('ag.vim')
    nnoremap <leader>a :Ag! <C-w><cr>

    call neobundle#untap()
endif


" NERDTree
"==============================================================================
if neobundle#tap('nerdtree')
    silent! nmap <silent> <leader>p :NERDTreeToggle<CR>
    nnoremap <silent> <C-f> :NERDTreeFind<CR>

    call neobundle#untap()
endif


" tagbar
"==============================================================================
if neobundle#tap('tagbar')
    let g:tagbar_autoclose = 1

    nnoremap <silent> <F9> :TagbarToggle<CR>

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
    autocmd BufReadPost fugitive://* set bufhidden=delete

    call neobundle#untap()
endif


" vim-javascript
"==============================================================================
if neobundle#tap('vim-javascript')
    let javascript_enable_domhtmlcss = 1
    let g:javascript_conceal = 1

    call neobundle#untap()
endif


" delimitMate
"==============================================================================
if neobundle#tap('delimitMate')
    let delimitMate_expand_cr = 1

    call neobundle#untap()
endif


" neosnippet
"==============================================================================
if neobundle#tap('neosnippet')
    call neobundle#config({
    \    'autoload': {
    \        'commands': ['NeoSnippetEdit', 'NeoSnippetSource'],
    \        'filetypes': 'snippet',
    \        'insert': 1,
    \        'unite_sources': ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
    \    }
    \ })

    function! neobundle#tapped.hooks.on_source(bundle)
        let g:neosnippet#enable_snipmate_compatibility = 1

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

    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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

    nnoremap <leader>b :Unite -quick-match buffer<cr>
    nnoremap <silent> <C-h> :Unite history/yank<cr>

    call neobundle#untap()
endif


" easymotion
"==============================================================================
if neobundle#tap('vim-easymotion')
    let g:EasyMotion_leader_key = '<Space>'

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




"* * * * * * * * * * * * * * * * * EXTRA * * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" jump to last cursor position when opening a file
" don't do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" cuda
au BufRead,BufNewFile *.cuh set ft=cuda

au BufRead,BufNewFile *.xml,*.py,*.rb,*.R call SetRunCommand()
function! SetRunCommand()
  if &ft == 'xml'
    noremap <F5> <ESC>:w<CR>:execute "!xmllint --valid --noout %"<CR>
  elseif &ft == 'python'
    noremap <F5> <ESC>:w<CR>:execute "!python %"<CR>
    noremap <F8> <ESC>:w<CR>:execute "!python3 %"<CR>
  elseif &ft == 'ruby'
    noremap <F5> <ESC>:w<CR>:execute "!ruby %"<CR>
  elseif &ft == 'r'
    noremap <F5> <ESC>:w<CR>:execute "!Rscript %"<CR>
  endif
endfunction

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
