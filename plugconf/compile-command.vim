function GoCompileAndRun()
    silent !clear
    let result = system("go run " .  bufname("%") . " 2>&1")

    " Open a new split and set it up
    vsplit __GO_Result__
    normal! ggdG
    setlocal filetype=goresult
    setlocal buftype=nofile

    " Insert result
    call append(0, split(result, '\v\n'))
endfunction

autocmd FileType go nnoremap <buffer> <leader>r :call GoCompileAndRun()<cr>
