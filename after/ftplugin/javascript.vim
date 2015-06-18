set ts=2 sw=2 sta et sts=2 ai

nnoremap <silent> <buffer> <F7> :call BreakpointToggle(line('.'), "debugger;")<CR>
