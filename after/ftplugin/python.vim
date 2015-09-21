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

" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

set colorcolumn=110
" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=Black guibg=red
match WhitespaceEOL /\s\+$/

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


nnoremap <silent> <buffer> <F7> :call BreakpointToggle(line('.'), "import pdb; pdb.set_trace() ### XXX BREAKPOINT")<CR>
nnoremap <silent> <buffer> <F6> :call Flake8()<CR>

highlight SpellBad term=underline
