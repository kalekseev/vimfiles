if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
    \ 'build': {
        \ 'unix': 'make -f make_unix.mak',
        \ 'mac': 'make -f make_mac.mak',
    \ },
\ }

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet.vim'
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

"HTML
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck


"VIM SETUP

syntax on                       "turn on syntax highlighting
set backspace=indent,eol,start  "allow backspacing over everything in INS mode
set history=1000                "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
set incsearch                   "find the next match as we type the search
set hlsearch                    "hilight searches by default
set number                      "add line numbers
set showbreak=...
set wrap linebreak nolist
set linespace=4                 "add some line space for easy reading
set visualbell t_vb=            "disable visual bell
set laststatus=2                "always show statusline
set hidden                      "hide buffers when not displayed
let mapleader=','

"russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"turn off needless toolbar on gvim/mvim
set guioptions-=T
set guioptions-=m

"indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,.git,*.pyc "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"backup directory
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.
set viminfo+=n~/.vim/.viminfo

if has("persistent_undo")
    set undodir=~/.vim/undo,.
    set undofile
endif


"theme
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
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
    endif
endif


"KEYS MAPPING

"toggle paste
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>

" disable arrow keys
noremap <Up> <C-W>+
noremap <Down> <C-W>-
noremap <Left> <C-W><
noremap <Right> <C-W>>

"make <c-n> clear the highlight as well as redraw
nnoremap <leader>m :nohls<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>

"write with sudo
cmap w!! %!sudo tee > /dev/null %

"remove trailing whitespace
nnoremap <leader>t :%s/\s\+$<CR>

command! -bang -nargs=+ Sgrep execute 'silent Ggrep<bang> <args>' | copen


"PLUGINS CONFIGURATION

"silver searcher
nnoremap <leader>a :Ag! <C-w><cr>

"NERDTree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

"ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-file=is:tags"

"tagbar
let g:tagbar_autoclose = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

"statusline
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

"synastic
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pyflakes']

"auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"vim-javascript
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1

"delimitMate
let delimitMate_expand_cr = 1

"neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1

"neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>""

"ctrlp
set wildignore+=*.aux,*.log,*.class

let g:ctrlp_custom_ignore = {
\    'dir': '\v[\/](\.git|\.hg|\.svn|target)$',
\    'file': '\v\.(exe|so|dll|class|aux|log|jar)$',
\ }

"unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank')

let g:unite_source_history_yank_enable = 1
"nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>
nnoremap ,b :Unite -quick-match buffer<cr>
nnoremap <silent> <C-h> :Unite history/yank<cr>

"indentLine
let g:indentLine_char = '┊'
let g:indentLine_noConcealCursor=""
let g:indentLine_faster = 1

"easymotion
map <leader>f <Plug>(easymotion-f)


"EXTRA FUNCTIONALITY

"jump to last cursor position when opening a file
"don't do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"cuda
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
