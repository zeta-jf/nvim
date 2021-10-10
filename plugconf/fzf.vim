
" fzf:
set rtp+=~/.fzf
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :Ag<CR>
let g:fzf_preview_window = ['right:45%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right:45%', 'ctrl-/'), <bang>0)
nnoremap <silent>       <c-g>     :Ag<cr>
nnoremap <silent>       <c-p>     :Files<cr>
nnoremap <silent>       <c-h>     :History<cr>
nnoremap <silent>       <c-f>     :BLines<cr>

let $FZF_DEFAULT_COMMAND="rg --files --hidden"
let g:fzf_preview_window = ['right:51%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

