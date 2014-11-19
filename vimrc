" by qucaihui
" @date 2014-09-29
let mapleader=','

" don't bother with vi compatibility
set nocompatible

" vundle {{{
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off 
if has("unix")
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')  
endif

Bundle 'gmarik/vundle'

Bundle "tomtom/tcomment_vim"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Bundle 'PDV--phpDocumentor-for-Vim'
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR>

Bundle "Mark--Karkat"
" <leader>m, <leader>n

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = 'f'

Bundle 'bling/vim-airline'

" 多光标操作
Bundle 'terryma/vim-multiple-cursors'

Bundle "tpope/vim-surround"
" cs,ds,ys


Bundle 'ervandew/supertab'

Bundle 'matrix.vim--Yang'

Bundle 'Townk/vim-autoclose'

Bundle 'godlygeek/tabular'

Bundle 'The-NERD-tree'
noremap <leader>d :NERDTreeToggle<CR>

Bundle 'majutsushi/tagbar'

Bundle 'altercation/vim-colors-solarized'
colorscheme solarized
set background=dark
let g:solarized_termtrans=1

" }}}

filetype plugin indent on     " required!

" seneral settings
syntax enable          " enable syntax highlighting
set nobomb             " utf8 bomb
set showcmd
set number             " show line numbers
set ruler              " show where you are
set modeline           " 启用Modeline,详见http://vim.wikia.com/wiki/Modeline_magic
set scrolloff=3        " 光标移动到buffer的顶部和底部时保持3行距离
set textwidth=0        " Linebreak
set nowrap             " no wrap
set backspace=2        " 设置回格键正常处理
set clipboard+=unnamed " Yanks go on clipboard instead.
set directory-=.       " don't store swapfiles in the current directory
" set wildmenu           " show a navigable menu for tab completion
set wildmode=longest,list,full
set autochdir          " 自动修改vim当前目录为文件所在目录
set tags=tags;         " tags文件搜索

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" search
set smartcase
set hlsearch
" set incsearch

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" indent
set smartindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

" fold
set foldenable
set foldmethod=marker

" no scroll bar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" auto reload vimrc where editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" keyboard shortcuts {{{
nnoremap <silent> <leader>nn :set nonumber!<CR>:set foldcolumn=0<CR>       " F2开启/关闭行号显示
nnoremap <silent> <leader>cl :nohlsearch<CR>                " 快速清除高度搜索

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" reload .vimrc
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" }}}

" 解决gbk时消息乱码问题
if has("gui_running")
    set langmenu=zh_cn.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_cn.utf-8
endif

" vim600: sw=4 ts=4 fdm=marker syn=vim