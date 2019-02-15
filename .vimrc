" ------ Vim Tips ------
" Words currently highlighted (see hi): NEXT IMPORTANT NOTE
"
" Use Ctrl+V to go into block visual, then Select the lines you want then press dd to delete comments or...
" SHIFT+i to insert in block type the comment chars and then ESC and wait...!
"
" ALSO in functions use dots like php to do string insertion
"
" Use ma to make a marker called a at line
" Use `a to jump to a 
" Use dma to delete marker
"
" Use zf to fold with args e.g. zf3j folds and next 3 lines
" Use zd to delete a fold
" 
" use this to read in bash things
" :read !ls
" 
" Also use V to select full line
" Use I to insert at the start
" Use A to append at the end
"
" When all selected then type
" :norm Iblahblah
" runs a command from norm on all lines
"
" ----------------------

syntax on
set relativenumber
set splitbelow splitright
"set autoindent
set smartindent
set shiftwidth=4
set complete-=i
set showcmd
set cursorline
set showmatch
set incsearch
set tabstop=4
set hlsearch
set foldmethod=indent
set foldlevelstart=20
"set list
" ABOVE enables the viewing of line breaks and indents

set nostartofline
"set cmdheight=2
" ABOVE is used to make the command bar bigger
set backspace=indent,eol,start
nnoremap £ i#
inoremap £ #

let mapleader = "-"
let maplocalleader = "-"

" +++++ Plugins using plug.vim - Plugin Manager +++++
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'udalov/kotlin-vim'
Plug 'dracula/vim'
call plug#end()

" Call :PlugInstall to install plugins
" Call :PlugClean to delete removed/commented out plugins
" +++++++++++++++++++++++++++++++++++++++++++++++++++
"
" FOR YOUCOMPLETEME
let g:ycm_min_num_of_chars_for_completion = 1

color dracula

" FOR NERDTREE
let g:NERDTreeMapActivateNode='l'
nnoremap r :NERDTreeToggle<CR>
noremap <C-o> :NERDTreeToggle<CR>

" FOR FZF Use ; :Files then ctrl-x
noremap ; :Files<CR>
noremap <leader>; :GFiles<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

map <F7> mzgg=G`z
" NOTE: Below is to enable lightline properly and airline(popular)
set laststatus=2
set noshowmode
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" PLUGIN indent_guides
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level=1
"let g:indent_guides_auto_colors = 0

hi Search term=standout guibg=red guifg=red ctermbg=Magenta ctermfg=white
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=DarkGray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=Gray
hi NOTE term=standout guifg=blue guibg=white ctermbg=white ctermfg=blue
call matchadd('NOTE','NOTE')
hi NEXT term=standout guifg=red guibg=green ctermbg=blue ctermfg=red
call matchadd('NEXT', 'NEXT')
hi IMPORTANT term=bold ctermbg=red ctermfg=black
call matchadd('IMPORTANT', 'IMPORTANT')

" ===== FUNCTIONS =====

function EnterHTMLMode()
	:nnoremap bo i<b><cr><c-t><esc>
	:nnoremap bc i<cr><c-d></b><esc>
endfunction

function ExitHTMLMode()
	:nunmap bo
	:nunmap bc
endfunction

function Present()
	set foldlevelstart=2
endfunction

function Keys()
	echom "===== Bens Keys ====="
	echom "za - toggle fold , zR - open all folds , zM - close all folds"
	echom "r - open NERDTree , ; - for fzf Files , -; - for fzf GFiles"
	let ok = input("Ok?")
	set cmdheight=1
endfunction

nnoremap <leader>h :call Keys()<CR>

":call Yo()
:function Yo()
:	echom "LOG"
:endfunction

:function Html()
:	0r ~/.vim/temps/html.html
:endfunction

:function Welcome(name)
:	echom "hello: ".a:name . "tes"
:	echom a:name
:endfunction

"a: tells vim this in in the arguement scope
":function Comment(from,to)
":	echom a:from
":	echom a:to
":	a:from,a:to/^/#
":endfunction
" Instead use CTRL+V, SHIFT+I enter char and then ESC
"
" =====================


inoremap {<CR> {<Esc>o}<Esc>O
"inoremap <leader><Space> <Esc>/<++><Enter>"_c4l
"autocmd FileType html inoremap ;p <p></p><Space><++><Esc>FpT>i

nnoremap / /\v
vnoremap / /\v

nnoremap aa ggVG
nnoremap <leader>a ggVG

nnoremap <space> za

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
:command Q q
:command WQ wq
nnoremap Y 0y$
:cmap Q! q!

au VimEnter * echo "za - toggle fold , zR - open all folds , zM - close all folds , r - open NERDTree , ; - for fzf Files , -; - for fzf GFiles"
"

:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
au BufNewFile,BufRead Jenkinsfile setf groovy

set clipboard=unnamed
:vnoremap <leader>c y<esc>Go<esc>p:.!pbcopy<cr> 
":vnoremap <C-c> :w !pbcopy<CR><CR> 
":noremap <C-v> :r !pbpaste<CR><CR>
:vnoremap <leader>d :echo "tsststr"
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jj <esc>

nnoremap <leader>r :resize 60<CR>

nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh 0r ~/.vim/temps/skel.sh
	augroup END
endif


