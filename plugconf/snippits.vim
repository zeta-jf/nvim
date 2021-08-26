autocmd Filetype * inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter> 
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F*hi 
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F*i
autocmd Filetype * inoremap ,1 () <++><Esc>F)i
autocmd Filetype * inoremap ,2 [] <++><Esc>F]i
autocmd Filetype * inoremap ,3 {} <Esc>F}i<Enter><Enter><Esc>ki
