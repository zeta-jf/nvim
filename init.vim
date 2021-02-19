let mapleader=" "
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

for f in split(glob('~/.config/plugconf/*.vim'), '\n')
  exe 'source' f
endfor

set statusline+=%{fugitive#statusline()}

set rtp+=~/.fzf
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :Ag<CR>
inoremap jk <esc>
nnoremap tt :CocCommand explorer<CR>
noremap n nzz
noremap N Nzz
" Fugitive Config:
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gs :G<CR>
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=4
set softtabstop=4
" when indenting with '>', use 2 spaces width
set shiftwidth=4 number
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" split screen
"
map Sh :set nosplitright<CR>:vsplit<CR>
map Sl :set splitright<CR>:vsplit<CR>
map Sk :set nosplitbelow<CR>:split<CR>
map Sj :set splitbelow<CR>:split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>
" Zoom
"
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>
map tk :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

set encoding=UTF-8
set relativenumber
set cursorline
set wrap
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set smartcase

set scrolloff=5

noremap K 5k
noremap J 5j

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-peekaboo'

Plug 'morhetz/gruvbox'
Plug 'gcmt/wildfire.vim'

Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'doums/darcula'
call plug#end()
"hello world"
colorscheme snazzy
set termguicolors
" colorscheme gruvbox
set background=dark

syntax enable

map <F5> :setlocal spell! spelllang=en_us<CR>
highlight clear SpellBad
highlight SpellBad cterm=underline gui=undercurl ctermfg=Red guifg=#ff0000
highlight clear SpellCap
highlight SpellCap cterm=underline gui=undercurl guifg=#ff8800 ctermfg=Yellow
highlight clear SpellRare
highlight SpellRare cterm=underline gui=undercurl
highlight clear SpellLocal
highlight SpellLocal cterm=underline gui=undercurl

set termguicolors
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
