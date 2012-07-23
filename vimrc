"necessary on some Linux distros for pathogen to properly load bundles
filetype off

source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
"load pathogen managed plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
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
" set keymap=russian-jcukenwin 
" set iminsert=0
" set imsearch=0
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set fileencodings=ucs-bom,utf-8,default,cp1251

"try to make possible to navigate within lines of wrapped lines
""nmap <Down> gj
""nmap <Up> gk
""set fo=l

" disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

"statusline setup
"fugitive branch name in statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P 

set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T
set guioptions-=m

"auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,.git,*.pyc "stuff to ignore when tab completing

"display tabs and trailing spaces
"set list
"set listchars=tab:\ \ ,extends:>,precedes:<
" disabling list because it interferes with soft wrap

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

"Command-T configuration
"let g:CommandTMaxHeight=10
"let g:CommandTMatchWindowAtTop=1

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set background=dark
    colorscheme solarized

    set guitablabel=%M%t
    set lines=30
    set columns=84

    "set guifont=Inconsolata\ 14
    set guifont=Consolas\ 14
    set colorcolumn=80
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set molokai colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme molokai
    else
        colorscheme default
    endif
endif

"highlight ColorColumn ctermbg=gray guibg=#252627
"highlight ColorColumn ctermbg=NONE guibg=#252627

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
""nnoremap <silent> <C-f> :call FindInNERDTree()<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

"make <c-n> clear the highlight as well as redraw
nnoremap <leader>m :nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"map to CommandT TextMate style finder
nnoremap <leader>t :CommandT<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"don't load pi_paren
let loaded_matchparen=1
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

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

"let g:SuperTabDefaultCompletionType = 'context'
let g:vimwiki_list = [{'path': '~/Dropbox/.stuff/vimwiki/',
                       \ 'path_html': '~/tmp/vimwiki_html/'}]
let g:vimwiki_browsers = ['firefox', 'chromium-browser']

"ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"tagbar
let g:tagbar_autoclose = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

"Octave syntax
augroup filetypedetect
au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

"vim-commentary add octave support
autocmd FileType octave set commentstring=%\ %s
autocmd FileType ruby-sinatra set commentstring=#\ %s
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

au BufRead,BufNewFile *  call SetRunCommand()
function! SetRunCommand()
  if &ft == 'xml'
    noremap <F5> <ESC>:w<CR>:execute "!xmllint --valid --noout %"<CR>
  elseif &ft == 'python'
    noremap <F5> <ESC>:w<CR>:execute "!python %"<CR>
    noremap <F6> <ESC>:w<CR>:execute "!pep8 %"<CR>
  elseif &ft == 'ruby'
    noremap <F5> <ESC>:w<CR>:execute "!ruby %"<CR>
  endif
endfunction
