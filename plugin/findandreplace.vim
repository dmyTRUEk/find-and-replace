" check vim version and some other magick:
if exists('findandreplace_loaded') || &cp || version < 700
    finish
endif
let findandreplace_loaded = 1


command! FindAndReplaceN call findandreplace#AskAndReplaceAllNormal()
command! FindAndReplaceX call findandreplace#AskAndReplaceAllVisual()


if !exists('g:findandreplace_disable_remaps') || g:findandreplace_disable_remaps == 0
    " keybinds:
    nnoremap <F2> :FindAndReplaceN<CR>
    xnoremap <F2> :<C-U>FindAndReplaceX<CR>
endif

