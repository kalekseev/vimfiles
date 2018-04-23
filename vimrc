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

Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'  "used to replace camel case with snake case
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-signify'
Plug 'thinca/vim-visualstar'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'gorkunov/smartpairs.vim'
Plug 'xaviershay/tslime.vim'
Plug 'benjifisher/matchit.zip'
Plug 'bkad/CamelCaseMotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-jdaddy'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'FooSoft/vim-argwrap', {'on': ['ArgWrap']}
Plug 'justinmk/vim-sneak'
Plug 'Shougo/neomru.vim' |
            \ Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/unite-help'
Plug 'tsukkee/unite-tag'
Plug 'thinca/vim-unite-history'
Plug 'Shougo/echodoc'
if has('nvim')
    Plug 'davidhalter/jedi-vim' |
                \ Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} |
                \ Plug 'zchee/deoplete-jedi'
else
    Plug 'davidhalter/jedi-vim' |
                \ Plug 'Shougo/neocomplete'
endif
Plug 'rking/ag.vim', {'on': ['Ag', 'AgAdd', 'AgFromSearch']}
Plug 'jmcomets/vim-pony'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'thinca/vim-qfreplace', {'on': 'Qfreplace'}
Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'gregsexton/MatchTag'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'majutsushi/tagbar'
Plug 'kana/vim-niceblock'
Plug 't9md/vim-quickhl'
Plug 'rstacruz/sparkup', {
            \   'rtp': 'vim',
            \   'for': [
            \     'html',
            \     'xml',
            \     'htmldjango',
            \     'javascript.jsx',
            \     'typescript.tsx'
            \   ]
            \ }
Plug 'alfredodeza/pytest.vim'
Plug 'alfredodeza/coveragepy.vim'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sbdchd/neoformat', {
            \   'for': [
            \     'javascript',
            \     'typescript',
            \     'css',
            \     'scss',
            \     'python'
            \   ]
            \ }
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jremmen/vim-ripgrep'
Plug 'sheerun/vim-polyglot'
Plug 'ianks/vim-tsx'
Plug 'mhartington/nvim-typescript', {'do': ':UpdateRemotePlugins'}
Plug 'wellle/targets.vim'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'nixprime/cpsm', {'do': 'PY3=ON ./install.sh'}

call plug#end()

filetype plugin indent on


" reset my autocmd group
augroup MyAutoCmd
    autocmd!
augroup END


if has('nvim')
    let g:python_host_prog = $HOME.'/.local/venvs/neovim2/bin/python'
    let g:python3_host_prog = $HOME.'/.local/venvs/neovim3/bin/python'
endif


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
set linespace=4

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
set wildmode=list:longest

" enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
set wildignore=*.aux,*.log,*.class,*.o,*.obj,*~,.git,*.pyc,*/.hg/*

" don't continue comments when pushing o/O
set formatoptions-=o

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" some stuff to get the mouse going in term
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

" backup
set nobackup
set nowritebackup
set noswapfile
set backupdir-=.
set autowrite

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
set completeopt+=menuone
set completeopt-=preview

" don't show messages on completition
if has("patch-7.4.314")
    set shortmess+=c
endif

let g:netrw_liststyle=3

if has('gui_running')
    if IsWindows()
        set guifont=Consolas:h12:cRUSSIAN
    else
        set guifont=Consolas\ 12
    endif
    set langmenu=en_US.UTF-8
else
    if !has('nvim')
        set t_Co=16
    endif
endif

" theme
set background=dark
if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has("termguicolors")
    set termguicolors
endif


let g:gruvbox_italic=1
colorscheme gruvbox


set colorcolumn=80

" encoding
if !has('gui_running')
    if IsWindows()
        set termencoding=cp1251
    else
        set termencoding=
    endif
endif



"* * * * * * * * * * * * * * * * * MAPPING * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

" edit vimrc
nnoremap <Leader>ev :<C-u>edit ~/.vim/vimrc<CR>

" toggle paste
nmap <F2> :set invpaste paste?<CR>

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

" reselect pasted text
nmap <Leader>v V`]

" replace multiple
nmap <Leader>r cgn

" replace selected text
vnoremap <Leader>p "_dP

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


" format buffer
nnoremap <Leader>f :Neoformat<CR>
"* * * * * * * * * * * * * * * * * PLUGINS * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

"vim-json
let g:vim_json_syntax_conceal = 0
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
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen = 1



" NERDCommenter
"==============================================================================
map <Space>/ <Plug>NERDCommenterToggle
let NERDSpaceDelims = 1


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
if !has('nvim')
    let g:airline_theme = 'base16'
endif
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
            \   'javascript': ['eslint', 'flow'],
            \   'python': ['flake8'],
            \   'scss': ['stylelint'],
            \   'typescript': ['tslint', 'tsserver', 'typecheck'],
            \}
let g:ale_sign_error = '>>' " '✗'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

nmap <silent> <leader>pe <Plug>(ale_previous_wrap)
nmap <silent> <leader>ne <Plug>(ale_next_wrap)


" fugitive
"==============================================================================
autocmd MyAutoCmd BufReadPost fugitive://* set bufhidden=delete
command! -bang -nargs=+ Sgrep execute 'silent Ggrep<bang> <args>' | copen


" delimitMate
"==============================================================================
"<CR> remaped for neocomplete, don't forget add delimitMateCr
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1


" vim-quickrun
"==============================================================================
let g:quickrun_no_default_key_mappings = 1
map <F5> <Plug>(quickrun)


" vim-quickhl
"==============================================================================
nmap <Leader>1 <Plug>(quickhl-manual-this)
xmap <Leader>1 <Plug>(quickhl-manual-this)
nmap <Leader>0 <Plug>(quickhl-manual-reset)
xmap <Leader>0 <Plug>(quickhl-manual-reset)
nmap <Leader>2 <Plug>(quickhl-cword-toggle)


" echodoc
"==============================================================================
let g:echodoc_enable_at_startup = 1


" neocomplete
"==============================================================================
if has('nvim')
    "deoplete.nvim
    let g:deoplete#enable_at_startup = 1
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    imap <expr> <CR> pumvisible() ? deoplete#mappings#close_popup() . "\<CR>"
                \: '<Plug>delimitMateCR'
else
    let g:neocomplete#enable_at_startup = 1
    " use smartcase
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_camel_case = 1

    " use fuzzy completion
    let g:neocomplete#enable_fuzzy_completion = 1
    " minimum syntax keyword length
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " Set auto completion length.
    let g:neocomplete#auto_completion_start_length = 2
    let g:neocomplete#manual_completion_start_length = 0
    " Set minimum keyword length.
    let g:neocomplete#min_keyword_length = 3

    "imap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    imap <expr> <CR> pumvisible() ? neocomplete#close_popup() . "\<CR>"
                \: '<Plug>delimitMateCR'

    " <TAB>: completion.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ neocomplete#start_manual_complete()
    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}

    " <S-TAB>: completion back.
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
endif

" jedi-vim
"==============================================================================
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = 2
let g:jedi#documentation_command = "<leader>d"
let g:jedi#goto_assignments_command = "gd"
let g:jedi#goto_definitions_command = "gD"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#rename_command = "<leader>jr"


" ctrlp
"==============================================================================
let g:ctrlp_custom_ignore = {
\    'dir': '\v[\/](\.git|\.hg|\.svn|target|node_modules|bower_components|htmlcov)$',
\    'file': '\v\.(exe|so|dll|class|aux|log|jar)$',
\ }
let g:ctrlp_user_command = {
\   'types': {
\     1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
\     2: ['.hg', 'hg --cwd %s files --subrepos -I .'],
\   },
\   'fallback': 'rg %s --files --hidden --color=never --follow --glob "!.git/*" --glob "!.hg/*"'
\ }

let g:ctrlp_root_markers = ['.hgsub']  "hg subrepos root
"let g:ctrlp_use_caching = 0

"---------------------------------------------------------------------------
" denite.nvim
"

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
else
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#source('file_old', 'matchers',
      \ ['matcher_fuzzy', 'matcher_project_files'])
if has('nvim')
  call denite#custom#source('file_rec,grep', 'matchers',
        \ ['matcher_cpsm'])
endif
call denite#custom#source('file_old', 'converters',
      \ ['converter_relative_word'])

call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'",
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

" call denite#custom#option('default', 'prompt', '>')
" call denite#custom#option('default', 'short_source_names', v:true)
call denite#custom#option('default', {
      \ 'prompt': '>', 'short_source_names': v:true
      \ })

let s:menus = {}
let s:menus.vim = {
    \ 'description': 'Vim',
    \ }
let s:menus.vim.file_candidates = [
    \ ['    > Edit configuation file (init.vim)', '~/.config/nvim/init.vim']
    \ ]
call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.hg/', '__pycache__/',
      \   'env/', 'images/', '*.min.*', 'img/', 'fonts/'])

nmap <Leader>b :Denite buffer -mode=normal -reversed<cr>
nmap <Leader>h :Denite history/yank<cr>
nmap <Leader>a :DeniteCursorWord -auto-preview -vertical-preview grep<cr><cr>
nmap <Leader>s :Denite menu:shortcut<cr>
nmap <Leader>l :Denite file_mru<CR>
nmap <Leader>g :Denite grep<CR>


" sneak
" =============================================================================
let g:sneak#s_next = 1
let g:sneak#streak = 1


" indentline
"==============================================================================
if IsWindows() || IsPutty()
    let g:indentLine_char = '|'
else
    let g:indentLine_char = '┊'
endif
let g:indentLine_color_term = 8
let g:indentLine_noConcealCursor=""
let g:indentLine_faster = 1

" neoformat
"==============================================================================
"
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'stdin': 1,
            \ 'args': ['--line-length', '110', '-', '2>/dev/null'],
            \ }

let g:neoformat_enabled_javascript = ['prettiereslint']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_python = ['isort', 'black']
let g:neoformat_run_all_formatters = 1

" flow
"==============================================================================
"
let g:flow#enable = 0
let g:flow#showquickfix = 0


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

" filetype specific settings
autocmd MyAutoCmd FileType html setlocal ts=2 sw=2 sta et sts=2 ai
autocmd MyAutoCmd FileType javascript setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110
autocmd MyAutoCmd FileType json setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110
autocmd MyAutoCmd FileType typescript setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110
autocmd MyAutoCmd FileType python setlocal omnifunc=jedi#completions
autocmd MyAutoCmd FileType python let g:argwrap_tail_comma = 1
autocmd MyAutoCmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim
autocmd MyAutoCmd FileType typescript.tsx runtime! ftplugin/html/sparkup.vim

" cuda
autocmd MyAutoCmd BufRead,BufNewFile *.cuh set ft=cuda

" save on focus lost (gui only)
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

function! OpenCMD()
    if IsMac()
        return '-I {} open'
    else
        return '-i xdg-open'
    endif
endfunction

nnoremap <leader>o :!echo `hg burl`%\#%:t-<C-R>=line('.')<CR> \| xargs <C-R>=OpenCMD()<CR> {} > /dev/null<CR><CR>
vnoremap <leader>o <Esc>:!echo `hg burl`%\#%:t-<C-R>=line("'<")<CR>:<C-R>=line("'>")<CR> \| xargs <C-R>=OpenCMD()<CR> {} > /dev/null<CR><CR>gv


nnoremap <leader>uu :call GenUUID()<CR>
func! GenUUID()
  let cmd = 'uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "[:cntrl:]"'
  silent exec ":normal i" . system(cmd)
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


" Reload .vimrc automatically.
autocmd MyAutoCmd BufWritePost .vimrc,vimrc,init.vim
    \ source $MYVIMRC | redraw
