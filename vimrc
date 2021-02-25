if has('vim_starting')
    set encoding=utf-8
    scriptencoding utf-8

    if !has('nvim')
        set nocompatible
    endif

    let s:is_windows = has('win16') || has('win32') || has('win64')
    let s:is_cygwin = has('win32unix')
    function! IsWindows()
        return s:is_windows
    endfunction
    function! IsMac()
        return !s:is_windows && !s:is_cygwin
            \ && (has('mac') || has('macunix') || has('gui_macvim') ||
            \ (!executable('xdg-open') &&
            \ system('uname') =~? '^darwin'))
    endfunction
    function! IsLinux()
        return !IsWindows() && !IsMac()
    endfunction
    function! IsPutty()
        return !empty($PUTTY)
    endfunction

    if IsWindows()
        let $VIMHOME = $HOME.'/vimfiles'
    else
        let $VIMHOME = $HOME.'/.vim'
    endif

endif

call plug#begin($VIMHOME.'/bundle/')

if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
" Fast python completion (use ncm2 if you want type info or snippet support)
Plug 'ncm2/ncm2-jedi'
" Words in buffer completion
Plug 'ncm2/ncm2-bufword'
" Filepath completion
Plug 'ncm2/ncm2-path'


Plug '~/projects/diffmind/vim'
Plug 'kalekseev/vim-coverage.py', {'do': ':UpdateRemotePlugins'}
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'joshdick/onedark.vim'
Plug 'Shougo/vimproc', {'do': 'make'}
" Plug 'Shougo/neosnippet.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'  "used to replace camel case with snake case
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-dadbod', {'on': ['DB']}
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-signify'
Plug 'thinca/vim-visualstar'
Plug 'gorkunov/smartpairs.vim' " select in pairs using vvvv
Plug 'benjifisher/matchit.zip'
Plug 'bkad/CamelCaseMotion'
Plug 'AndrewRadev/splitjoin.vim'  " gS, gJ mappings
Plug 'FooSoft/vim-argwrap', {'on': ['ArgWrap']}
Plug 'Shougo/echodoc'
Plug 'davidhalter/jedi-vim'
Plug 'jmcomets/vim-pony', {'for': 'python'}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'thinca/vim-qfreplace', {'on': 'Qfreplace'}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'kana/vim-niceblock'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', {'for': ['html', 'typescript.tsx', 'javascript.jsx']}
Plug 'vim-test/vim-test'
Plug 'skywind3000/asyncrun.vim'
Plug 'honza/vim-snippets'
Plug 'ianks/vim-tsx', {'for': ['typescript', 'typescript.tsx']}
Plug 'mhartington/nvim-typescript', {'do': './install.sh' } " 'for': ['typescript', 'typescript.tsx', 'javascript', 'javascript.jsx'],
Plug 'Galooshi/vim-import-js', {'for': ['typescript', 'typescript.tsx', 'javascript', 'javascript.jsx']}
Plug 'wellle/targets.vim'
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim', {'on': ['Goyo']}
Plug 'junegunn/limelight.vim', {'on': ['Goyo']}
Plug 'kalekseev/direnv.vim', {'branch': 'fixes'}
Plug 'airblade/vim-rooter', {'on': ['Rooter']}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

call plug#end()

filetype plugin indent on


" reset my autocmd group
augroup MyAutoCmd
    autocmd!
augroup END


"* * * * * * * * * * * * * * * * * SETUP * * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" turn on syntax highlighting
syntax on

" load local rc files
set exrc
set secure

" set regexpengine=1  "work faster on macos
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
if IsWindows() || IsPutty()
    set showbreak=...
else
    set showbreak=↪..
endif

" wrap lines
set wrap

" don't break words
set linebreak

" listchars
set list listchars=tab:»·

" add some line space for easy reading
" set linespace=4

" disable visual bell
if !has('nvim')
    set visualbell t_vb=
endif

" always show statusline
set laststatus=2

" hide buffers when not displayed
set hidden

" remap leader
let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
nnoremap <Space> <Nop>

" russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,№;#

" turn off needless toolbar on gvim/mvim
set guioptions-=T
set guioptions-=m
" off scrollbar
set guioptions-=rL
" no guitablabel
set guioptions-=e
set guioptions+=c


" indent settings
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent

" fold based on indent
set foldmethod=indent

" deepest fold is 3 levels
set foldnestmax=3

" dont fold by default
set nofoldenable

" make cmdline tab completion similar to bash
set wildmode=longest,list,full

" enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
set wildignore=*.module.scss.d.ts,*.aux,*.log,*.class,*.o,*.obj,*~,.git,*.pyc,*/.hg/*

" don't continue comments when pushing o/O
set formatoptions-=o

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" some stuff to get the mouse going in term
set mouse=n
if !has('nvim')
    set ttymouse=xterm2
endif

" BACKUP
" https://begriffs.com/posts/2019-07-19-history-use-vim.html
" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
    " consolidate the writebackups -- not a big
    " deal either way, since they usually get deleted
    set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//
" END BACKUP

if has('nvim')
    set viminfo+=n$VIMHOME/.viminfo.shada
else
    set viminfo+=n$VIMHOME/.viminfo
endif

" store undo
if has('persistent_undo')
    set undodir=$VIMHOME/undo,.
    set undofile
endif

" split to right
set splitright
set splitbelow

" reload when files modified outside of vim
set autoread

" fast terminal connection
if !has('nvim')
    set ttyfast
endif

" yank use system clipboard
set clipboard=unnamed

" ignore case only if contains upper case
set ignorecase
set smartcase
if has('nvim')
    set inccommand=nosplit
endif

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

" for echodoc
set noshowmode

" don't show messages on completition
if has("patch-7.4.314")
    set shortmess+=c
endif

" theme
set background=dark
if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has("termguicolors")
    set termguicolors
endif


" colorscheme
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
let g:airline_theme = 'onedark'
colorscheme onedark

set colorcolumn=80

"* * * * * * * * * * * * * * * * * MAPPING * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

" edit vimrc
nnoremap <Leader>ev :<C-u>edit ~/.vim/vimrc<CR>

" imap jj <Esc>

" switch between two files
map <Leader><Leader> <C-^>

" use arrow keys for windows size change
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

" key mapping for saving file
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

" write with sudo
cmap w!! %!sudo tee > /dev/null %

" remove trailing whitespace
nmap <leader>t :%s/\s\+$<CR>

" indent
nmap < <<
nmap > >>
xmap < <gV
xmap > >gV

" reselect pasted text
nmap <Leader>v V`]

" move selected lines
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

command! CountSearch execute '%s///gn'
command! CopyFilename execute 'let @+=expand("%:t")'
command! CopyFilepath execute 'let @+=expand("%:p")'
command! -range ApplyQMacros execute '<line1>,<line2>normal! @q'


"* * * * * * * * * * * * * * * * * PLUGINS * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

"vim-argwrap
nnoremap <silent>gW :<C-u>:ArgWrap<CR>

"editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" vim-signify
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_change = '~'
let g:signify_disable_by_default = 1


" CamelCaseMotion
"==============================================================================
nmap <silent> W <Plug>CamelCaseMotion_w
xmap <silent> W <Plug>CamelCaseMotion_w
omap <silent> W <Plug>CamelCaseMotion_w
nmap <silent> B <Plug>CamelCaseMotion_b
xmap <silent> B <Plug>CamelCaseMotion_b
omap <silent> B <Plug>CamelCaseMotion_b


" vim-javascript
"==============================================================================
let g:javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1


" NERDTree
"==============================================================================
silent! nmap <silent> <leader>p :NERDTreeToggle<CR>
nmap <silent> <C-f> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.module.scss.d.ts']
let NERDTreeQuitOnOpen = 1



" tComment
"==============================================================================
map <Space>/ :TComment<CR>


" vim-niceblock
"==============================================================================
xmap I <Plug>(niceblock-I)
xmap A <Plug>(niceblock-A)


" tagbar
"==============================================================================
let g:tagbar_autoclose = 1
nmap <silent> <F9> :TagbarToggle<CR>


" vim-airline
"==============================================================================
let g:airline_detect_paste = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#error_symbol = '✗ '
let g:airline#extensions#ale#warning_symbol = '⚠ '

let g:airline_powerline_fonts = 1
if !IsMac()
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.paste = 'Þ'
endif


" ale
"==============================================================================
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': ['flake8'],
            \   'scss': ['stylelint'],
            \   'typescript': ['eslint', 'tsserver'],
            \}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1
let g:ale_python_flake8_change_directory = 0
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'vue': ['eslint'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'python': ['isort', 'black'],
\   'markdown': ['prettier'],
\   'nix': ['nixpkgs-fmt'],
\}


nmap <silent> <leader>pe <Plug>(ale_previous_wrap)
nmap <silent> <leader>ne <Plug>(ale_next_wrap)
" nnoremap <Leader>f <Plug>(ale_fix)


" git and diff
"==============================================================================
autocmd MyAutoCmd BufReadPost fugitive://* set bufhidden=delete
command! -bang -nargs=+ Sgrep execute 'silent Ggrep<bang> <args>' | copen
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>
set diffopt+=internal,algorithm:patience


" delimitMate
"==============================================================================
"<CR> remaped for neocomplete, don't forget add delimitMateCr
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1


" echodoc
"==============================================================================
let g:echodoc_enable_at_startup = 1


" ncm2
"==============================================================================
autocmd BufEnter * call ncm2#enable_for_buffer()
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
set completeopt=noselect,noinsert,menuone

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" jedi-vim
"==============================================================================
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = 2
let g:jedi#documentation_command = "<leader>d"
let g:jedi#goto_assignments_command = "gD"
let g:jedi#goto_command = "gd"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#rename_command = "<leader>jr"

" LeaderF
"
let g:Lf_PreviewResult = { 'File': 1, 'Colorscheme': 1 }
let g:Lf_PreviewCode = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = "<C-p>"
let g:Lf_Gtagslabel = 'ctags'
let g:Lf_PreviewInPopup = 1
noremap <leader>l :<C-U><C-R>=printf("Leaderf! mru %s", "")<CR><CR>
noremap <leader>b :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>a :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>
nmap <leader>f :<C-U>Leaderf rg<CR>
noremap <leader>c :<C-U>Leaderf colorscheme<CR>


" indentline
"==============================================================================
let g:indentLine_setConceal = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 8
let g:indentLine_noConcealCursor=""
let g:indentLine_faster = 1


" typescript
"==============================================================================
let g:nvim_typescript#diagnostics_enable = 0


" rooter
let g:rooter_use_lcd = 1
" let g:rooter_silent_chdir = 1
let g:rooter_manual_only = 1

" direnv
let g:direnv_silent_load = 1

" test
let test#python#runner = 'pytest'
let test#strategy = "asyncrun_background"

"* * * * * * * * * * * * * * * * * EXTRA * * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

let g:racer_cmd = $HOME.'/.cargo/bin/racer'
let g:racer_experimental_completer = 1
autocmd MyAutoCmd FileType rust nmap gd <Plug>(rust-def)
autocmd MyAutoCmd FileType rust nmap gs <Plug>(rust-def-split)
autocmd MyAutoCmd FileType rust nmap gx <Plug>(rust-def-vertical)
autocmd MyAutoCmd FileType rust nmap K <Plug>(rust-doc)


" disable C-c mapping from SQLComplete
let g:omni_sql_no_default_maps = 1

au FileType sql setl formatprg=pg_format\ -

" filetype specific settings
autocmd MyAutoCmd FileType html setlocal ts=2 sw=2 sta et sts=2 ai
autocmd MyAutoCmd FileType javascript setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110
autocmd MyAutoCmd FileType vue setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110
autocmd MyAutoCmd FileType json setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110
autocmd MyAutoCmd FileType typescript setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110 omnifunc=TSComplete
autocmd MyAutoCmd FileType python setlocal omnifunc=jedi#completions
autocmd MyAutoCmd FileType typescript.tsx setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110 omnifunc=TSComplete
autocmd MyAutoCmd FileType python let g:argwrap_tail_comma = 1
autocmd MyAutoCmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim
autocmd MyAutoCmd FileType typescript.tsx runtime! ftplugin/html/sparkup.vim

" cuda
autocmd MyAutoCmd BufRead,BufNewFile *.cuh set ft=cuda

" save on focus lost
autocmd MyAutoCmd FocusLost * :silent! wall

" don't show trailing spaces in insert mode
autocmd MyAutoCmd InsertEnter * :set listchars-=trail:·
autocmd MyAutoCmd InsertLeave * :set listchars+=trail:·

" js, jsx
autocmd MyAutoCmd BufRead,BufNewFile *.js call s:FTjs()


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

function! BreakpointToggle(lnum, cmd)
    let line = getline(a:lnum)
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).a:cmd)
    normal k
    if &modifiable && &modified | write | endif
endfunction

nnoremap <leader>uu :call GenUUID()<CR>
func! GenUUID()
  let cmd = 'uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "[:cntrl:]"'
  silent exec ":normal a" . system(cmd)
endfunc


" Distinguish between javascript, jsx
func! s:FTjs()
  let n = 1
  while n < 10 && n < line("$")
    if getline(n) =~ "\\v'react'|'preact'"
      set filetype=javascript.jsx
      return
    endif
    let n = n + 1
  endwhile
endfunc


nnoremap <silent><Leader>g :<C-u>DiffMind<CR>
autocmd FileType diffmind call s:dm_my_settings()
function! s:dm_my_settings() abort
    nnoremap <silent><buffer> <CR> :call DiffMindAction(line('.'), 'enter')<CR>
    nnoremap <silent><buffer> q :<C-u>DiffMindQuit<CR>
endfunction


" windows
nnoremap <c-w>z <C-W>\| <C-W>_

" vue
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

autocmd TermClose * q

" Reload .vimrc automatically.
autocmd MyAutoCmd BufWritePost .vimrc,vimrc,init.vim
    \ source $MYVIMRC | redraw

" let $NVIM_NODE_HOST_DEBUG = 1
" let $NVIM_NODE_LOG_FILE='nvim-node.log'
" let $NVIM_NODE_LOG_LEVEL='warn'
