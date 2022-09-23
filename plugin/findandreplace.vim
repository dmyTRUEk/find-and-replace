" check vim version and some other magick:
if exists('findandreplace_loaded') || &cp || version < 700
    finish
endif
let findandreplace_loaded = 1


nnoremap <Plug>(findandreplace_n)    :call findandreplace#AskAndReplaceAllNormal()<CR>
nnoremap <Plug>(findandreplace_x) m` :call findandreplace#AskAndReplaceAllVisual()<CR> ``


if !exists('g:findandreplace_disable_remaps') || g:findandreplace_disable_remaps == 0
    " keybinds:
    nnoremap <F2> <Plug>(findandreplace_n)
    xnoremap <F2> <Plug>(findandreplace_x)
endif

