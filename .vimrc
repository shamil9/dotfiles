"Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugins
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'whatyouhide/vim-gotham'
Plugin 'ajh17/Spacegray.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/emmet-vim'
" Plugin 'Townk/vim-autoclose'
Plugin 'gregsexton/MatchTag'
"Plugin 'othree/html5.vim'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'
" Plugin 'beyondwords/vim-twig'
" Plugin 'pangloss/vim-javascript'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
if has ('gui_running')
"Plugin 'sjl/vitality.vim'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible
filetype off

set number
" set guifont=PragmataPro\ for\ Powerline:h16
set guifont=Hack:h15
" set guifont=Operator\ Mono:h15
" set guifont=Meslo\ LG\ L\ for\ Powerline:h14
set guioptions-=r
set laststatus=2
set noshowmode
set mouse=a
au FocusLost * :wa
set autowrite
set guioptions-=L
set autochdir
set relativenumber
set linespace=0
set noerrorbells visualbell t_vb=
set complete=.,w,b,u
set autowriteall
set tags=./tags,tags;$HOME


" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
 
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"Indent
set smartindent
set autoindent

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

set noswapfile
set cursorline

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

syntax on
"execute pathogen#infect()
if has('gui_running')
    colorscheme gruvbox
else
    colorscheme gruvbox
endif
let g:gruvbox_bold = 0
let g:gruvbox_contrast_light="soft"
let g:gruvbox_contrast_dark="soft"
set t_Co=256
set background=dark

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"Make NERDTree easier to toggle.
nmap <D-1> :NERDTreeToggle<cr>

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

" Alright... let's try this out
imap jj <esc>
cmap jj <esc>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>
 
"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"Split management
nnoremap <C-k>j <C-W><C-J>
nnoremap <C-k>k <C-W><C-K>
nnoremap <C-k>l <C-W><C-L>
nnoremap <C-k>h <C-W><C-H>
nmap <C-l> :vsp<CR>
nmap <C-j> :sp<CR>

"autocomplete
imap <C-Space> <C-N>

" Automatically read a file that has changed on disk
set autoread

" System default for mappings is now the "," character
let mapleader = ","
nmap <Space> :

" Disable encryption (:X)
set key=

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"Airline
let g:airline#extensions#tabline#enabled = 1
"if has('gui_running')
"    let g:airline_powerline_fonts = 1
"else
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
"endif
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']

"CtrlP
nmap <C-p> :CtrlP<CR>
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-Tab> :CtrlPMRUFiles<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_custom_ignore = {'dir': '/node_modules/'}
let g:ctrlp_custom_ignore = {'dir': '/var/'}

"Ultsnips
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" PHP Namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>m <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>m :call PhpInsertUse()<CR>


"tips and tricks
"ctrl+] //jump to defenition
"ctrl+6 //toggle last editing point
