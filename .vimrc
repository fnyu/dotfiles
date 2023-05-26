set nocompatible
set backspace=indent,eol,start
set vb t_vb=
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set noautochdir
set hls
set nowrap
set shortmess+=I
set hidden
set ignorecase
set smartcase
set incsearch
set noinfercase

filetype off
call plug#begin('~/.vim/plugged')
Plug 'haystackandroid/snow'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go'
call plug#end()

colorscheme snow
syntax on
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set wildignore=.git,.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,tags,*.tags
filetype on
filetype plugin on
filetype indent on

augroup PHP
    au!
    au FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

augroup Python
    au!
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal completeopt-=preview "turn off the preview window
    au FileType python setlocal isk-=-
augroup END

augroup Javascript
    au!
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

augroup Html
    au!
    au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

augroup Css
    au!
    au FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
augroup END

augroup Xml
    au!
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

augroup Yaml
    au!
    au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Text
    au!
    au FileType text,markdown setlocal textwidth=74 formatoptions+=1
    au FileType text,markdown,gitcommit setlocal complete+=k infercase
    au FileType text,markdown,gitcommit setlocal isk-=-

    au FileType text,markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END

let g:SuperTabClosePreviewOnPopupClose=1

autocmd BufWinEnter * silent NERDTreeMirror
