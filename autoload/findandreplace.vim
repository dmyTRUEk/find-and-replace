func! findandreplace#AskAndReplaceAllNormal()
    " save current cursor position
    let l:saved_winview = winsaveview()
    let l:selected_text = expand("<cword>")
    call inputsave()
    let l:replace_by = input('Replace by: ', l:selected_text)
    call inputrestore()
    if l:replace_by == l:selected_text
        echo "  Inputed text is same, exiting..."
    elseif l:replace_by != ""
        silent execute ':%s/\<' . l:selected_text . '\>/' . l:replace_by . '/g'
        echo "  Successfully replaced."
    else
        echo "Inputed text is empty, exiting..."
        " TODO: do nothing or
        "       replace without asking or
        "       ask if they are sure?
        return
    endif
    " restore cursor position
    call winrestview(l:saved_winview)
endf


func! findandreplace#AskAndReplaceAllVisual()
    " TODO?: add check if its not visual mode, then exit with msg: "not a visual mode"
    let l:mode = visualmode()
    if l:mode ==# "v"
        " Visual mode
        " save current cursor position
        let l:saved_curpos = getcurpos()
        let [l:line_start, l:column_start] = getpos("'<")[1:2]
        let [l:line_end  , l:column_end  ] = getpos("'>")[1:2]
        if l:line_start != l:line_end
            if getpos('.')[1] == l:line_start
                echom "Many lines selected, exiting..."
            endif
            return
        endif
        let l:cursor_on_end = getpos("'<")[2] <= getpos("'`")[2]
        let l:selected_text = getline(l:line_start)[l:column_start-(l:cursor_on_end ? 1 : 2) : l:column_end-(l:cursor_on_end ? 2 : 1)]
        call inputsave()
        let l:replace_by = input('Replace by: ', l:selected_text)
        call inputrestore()
        if l:replace_by == l:selected_text
            echo "  Inputed text is same, exiting..."
        elseif l:replace_by != ""
            " TODO: super rare bug: if trying to rename to smt that contains \)
            "       maybe try to replace all \) -> \\) before replacing?
            "       also maybe the same is for \( ?
            " round brackets here bcof possible spaces
            silent execute ':%s/\(' . l:selected_text . '\)/' . l:replace_by . '/g'
            " restore cursor position
            call setpos(".", [l:saved_curpos[0], l:saved_curpos[1], l:saved_curpos[4], "none"])
            echom "  Successfully replaced."
        endif

    elseif l:mode == "V"
        " Visual line mode
        " TODO: or maybe better without `AskAndReplaceAllVisual`?
        echom "AskAndReplaceAll not implemented for VISUAL LINE mode"

    elseif l:mode == "\<C-v>"
        " Visual block mode
        " TODO: or maybe better without `AskAndReplaceAllVisual`?
        echom "AskAndReplaceAll not implemented for VISUAL BLOCK mode"

    else
        " Unknown visual mode
        echom "UNKNOWN VISUAL mode"
    endif
endf

