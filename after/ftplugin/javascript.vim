set ts=4 sw=4 sta et sts=4 ai

nnoremap <silent> <buffer> <F7> :call BreakpointToggle(line('.'), "debugger;")<CR>
