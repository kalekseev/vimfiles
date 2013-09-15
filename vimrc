"necessary on some Linux distros for pathogen to properly load bundles
filetype off

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"Use Vim settings, rather then Vi settings (much better!).
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set fileencodings=ucs-bom,utf-8,default,cp1251

" disable arrow keys
noremap <Up> <C-W>+
noremap <Down> <C-W>-
noremap <Left> <C-W><
noremap <Right> <C-W>>

"statusline setup
"fugitive branch name in statusline
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

"auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

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

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"backup directory
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.
set viminfo+=n~/.vim/.viminfo

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set background=dark
    colorscheme solarized

    set guitablabel=%M%t
    set lines=30
    set columns=84

    "set guifont=Inconsolata\ 14
    set guifont=Consolas\ 12
    set colorcolumn=80
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        set background=dark
        colorscheme solarized
        set colorcolumn=80
    else
        colorscheme default
    endif
endif

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
""nnoremap <silent> <C-f> :call FindInNERDTree()<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

"make <c-n> clear the highlight as well as redraw
nnoremap <leader>m :nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"toggle paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"tagbar
let g:tagbar_autoclose = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

"airline
let g:airline_theme="solarized"
let g:airline_fugitive=1
let g:airline_syntastic=1
let g:airline_detect_paste=1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇  '
let g:airline_paste_symbol = 'ρ'

if has("persistent_undo")
    set undodir=~/.vim/undo,.
    set undofile
endif

set completeopt=menuone,longest,preview

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestEnhanced = 1

"Octave syntax
"augroup filetypedetect
"au! BufRead,BufNewFile *.m,*.oct set filetype=octave
"augroup END

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
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_python_checkers = ['pyflakes']


function! BreakpointToggle(lnum, cmd)
    let line = getline(a:lnum)
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).a:cmd)
    normal k
    if &modifiable && &modified | write | endif
endfunction

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction
