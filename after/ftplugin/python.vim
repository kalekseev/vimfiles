set tw=78 ts=4 sw=4 sta et sts=4 ai

" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

set colorcolumn=110
" Execute a selection of code (very cool!)
" Use VISUAL to select a range and then hit ctrl-h to execute it.
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-e> :py EvaluateCurrentRange()


nnoremap <silent> <buffer> <F7> :call BreakpointToggle(line('.'), "breakpoint()  # XXX BREAKPOINT")<CR>
