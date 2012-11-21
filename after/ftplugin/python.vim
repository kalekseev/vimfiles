" The magical turn-Vim-into-a-Python-IDE vim resource file!
"
" Mostly taken from http://www.sontek.net/category/Vim.aspx
" Other bits culled from various sources, Canonical guys, or made up by me.
"
" Julian Edwards 2008-05-30

" Wrapping and tabs.
set tw=78 ts=4 sw=4 sta et sts=4 ai

" More syntax highlighting.
let python_highlight_all = 1

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
"set omnifunc=pythoncomplete#Complete
"inoremap <Nul> <C-x><C-o>

" Get this plugin from http://www.vim.org/scripts/script.php?script_id=1112
" Pressing "K" takes you to the documentation for the word under the cursor.
autocmd filetype python source ~/.vim/bundle/pydoc/plugin/pydoc.vim

" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=Black guibg=red
match WhitespaceEOL /\s\+$/

" `gf` jumps to the filename under the cursor.  Point at an import statement
" and jump to it!
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Generate tags with: ctags -R -f ~/.vim/tags/python27.ctags /usr/lib/python2.7/
" ctrl-[ to go to the tag under the cursor, ctrl-T to go back.
set tags+=$HOME/.vim/tags/python27.ctags

" Execute a selection of code (very cool!)
" Use VISUAL to select a range and then hit ctrl-h to execute it.
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-e> :py EvaluateCurrentRange()


fun! BreakpointToggle(lnum, cmd)
    let line = getline(a:lnum)
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).a:cmd)
    normal k
    if &modifiable && &modified | write | endif
endfunction

nnoremap <silent> <buffer> <F7> :call BreakpointToggle(line('.'), "import ipdb; ipdb.set_trace() ### XXX BREAKPOINT")<CR>
nnoremap <silent> <buffer> <F12> :call BreakpointToggle(line('.'), "import pdb; pdb.set_trace() ### XXX BREAKPOINT")<CR>
highlight SpellBad term=underline
"ctermfg=Gray
" vim:syntax=vim
