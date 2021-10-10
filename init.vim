" Leader Key:
"
let mapleader=" "
let maplocalleader="\\"

" Key Map:
"
noremap <F5> :setlocal spell! spelllang=en_us<CR>
noremap n nzz
noremap N Nzz
noremap K 5k
noremap J 5j
noremap H ^
noremap L $
" split screen
noremap Sh :set nosplitright<CR>:vsplit<CR>
noremap Sl :set splitright<CR>:vsplit<CR>
noremap Sk :set nosplitbelow<CR>:split<CR>
noremap Sj :set splitbelow<CR>:split<CR>
noremap tk :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>


noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

inoremap jk <esc>
nnoremap tt :CocCommand explorer<CR>
nnoremap <leader>p "0p

" Status Line:
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
set statusline+=%{fugitive#statusline()}

" Extensions:
"
let g:coc_global_extensions = ['coc-json', 'coc-java']
for f in split(glob('~/.config/nvim/plugconf/*.vim'), '\n')
  exe 'source' f
endfor


" Settings:
"
filetype plugin indent on
syntax enable
exec "nohlsearch"
set termguicolors
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4 number
set encoding=UTF-8
set relativenumber
set cursorline
set wrap
set wildmenu
set hlsearch
set incsearch
set smartcase
set scrolloff=5
set termguicolors
set background=dark
set ruler
set undofile
set undodir=~/.vim-undo
set dir=~/tmp,/tmp
set sidescroll=1
set sidescrolloff=7
set scrolloff=3
if has("nvim")
    set inccommand=nosplit
endif
highlight clear SpellBad
highlight SpellBad cterm=underline gui=undercurl ctermfg=Red guifg=#ff0000
highlight clear SpellCap
highlight SpellCap cterm=underline gui=undercurl guifg=#ff8800 ctermfg=Yellow
highlight clear SpellRare
highlight SpellRare cterm=underline gui=undercurl
highlight clear SpellLocal
highlight SpellLocal cterm=underline gui=undercurl


" Zoom:
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


" Plugins:
"
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-peekaboo'
Plug 'gcmt/wildfire.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'lambdalisue/suda.vim'
Plug 'preservim/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
call plug#end()


colorscheme snazzy
