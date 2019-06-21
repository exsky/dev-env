" The overview to use the vim config 
"
" 1. Install `vim-plug`
"
"     curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" 2. Copy the setting to .vimrc
" 3. Write the setting to $HOME/.config/nvim/init.nvim
"
"    set runtimepath^=~/.vim runtimepath+=~/.vim/after
"    let &packpath = &runtimepath
"    source ~/.vimrc
"
" 4. If you use neovim, install `neovim` pakcage
"
"    pip install neovim
"
" 5. Open neovim/vim and type `:PlugInstall` and `":UpdateRemotePlugins`
"
" Runtime Path Manipulation
execute pathogen#infect()
syntax on
filetype plugin indent on

" Check pep8 while save file
autocmd BufWritePost *.py call flake8#Flake8()

if &compatible
    set nocompatible
endif

" Use vim-plugged as plugin manager
" Install plugin reference: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Python syntax
Plug 'yen3/vim-python-syntax'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"" Auto-complete plugin setting
if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-syntax'      " language syntax
Plug 'zchee/deoplete-jedi'     " Python
Plug 'davidhalter/jedi-vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'

"" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu

syntax enable
set background=dark
colorscheme Tomorrow-Night-Bright

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set ambiwidth=double

" Disable bleep!
set visualbell
set noerrorbells

set novisualbell
set tm=500

set backspace=indent,eol,start

" indent key mapping
nnoremap <tab> v>
nnoremap <s-tab> v<
vnoremap <tab> >gv
vnoremap <s-tab> <gv
nnoremap <silent> <F5> :NERDTree<CR>
nmap <F6) :NERDTreeToogle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1

" set python indention
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YAML setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Adjust split easier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-complete setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete:{{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set completeopt-=preview    "no scratch window

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" : "<Tab>"

" deoplete-jedi options (Python)
function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

let g:python3_host_prog = ChompedSystem('which python3')
""}}}
" UltiSnips :{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf: {{{
if has("gui_running") && has("mac")
let g:fzf_launcher = "/Users/yen3/.personal_scripts/fzf_macvim_start.sh %s"
endif

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'Function'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "\ 'hl+':     ['fg', 'Function'],
  "\ 'info':    ['fg', 'PreProc'],
  "\ 'prompt':  ['fg', 'Conditional'],
  "\ 'pointer': ['fg', 'Exception'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" key binding
autocmd VimEnter * command! Yen3Files
  \ call fzf#vim#files(<q-args>, {'left': '50%', 'options': '--reverse --prompt=""'})

autocmd VimEnter * command! Yen3Ag
  \ call fzf#vim#ag(<q-args>, {'left': '80%', 'options': '-e --reverse --prompt=""'})

autocmd VimEnter * command! Yen3AgCursorWord
  \ call fzf#vim#ag(<q-args>, {'left': '80%', 'options': '-e --reverse --prompt="" -q '. shellescape(expand('<cword>'))})

noremap <silent><C-P> :Yen3Files<CR>
noremap <silent><leader>s :Yen3Ag<CR>
noremap <silent><leader>ss :Yen3AgCursorWord<CR>
noremap <silent><leader>b :Buffers<CR>

" }}}
" Unite Outline: {{{
let g:unite_enable_split_vertically = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_use_short_source_names = 1
"" outline
nnoremap <leader>o :Unite -start-insert outline<CR>
" }}}


" vim: ft=vim foldmethod=marker foldcolumn=1
