"           _                    
"    __   _(_)_ __ ___  _ __ ___ 
"    \ \ / / | '_ ` _ \| '__/ __|
"     \ V /| | | | | | | | | (__ 
"    (_)_/ |_|_| |_| |_|_|  \___|
"
"    Ben Kadel

let mapleader = "-"
let maplocalleader = "-"

"# Help And Notes {{{
    "gv = is start visual mode with same selection as before
    "
    "VIM German or French
    ":digraphs
    "CTRL + V then number 
    "252 = ü
    "246 = ö
    "235 = ë
    "OR
    "CTRL + K then draw it like
    "CTRL + K e: = ë
    "CTRL + K u: = ü
    "
    " OMG important
    " To find every line matching a pattern in a given range
    " and perform a normal command on those lines use g
    " so...
    "  <,>g/pattern/exe "normal! I#"
    "  example
    "  <,>g/^\d/exe "normal! I$"
    "   for every line in range that starts with a digiti run the normal command
    "   that puts a $ infront of each line
    "
    " To use string replacement to add newline character
    "  do usual string search and replace (sed)
    "   then use this character instead of \n 
    "   to get this character type:
    "   CTRL + v, then hit ENTER
    " https://stackoverflow.com/questions/71323/how-to-replace-a-character-by-a-newline-in-vim
    "
    " use :Ag keyword
    "   to serach for strings in all files below
    "   grep (use Ag instead of grep and vimgrep)
    "
    " :tabonly
    "   only but for tabs
    " :tabnew
    "   new tab empty
    "
    " :%s/pattern//gn
    " Find how many times a search pattern exists in file
    "
    " Below is how to profile in vim to see what is being slow
    " :profile start profile.log
    " :profile func *
    " :profile file *
    " "At this point do slow actions
    " :profile pause
    " :noautocmd qall!
    "
    " Very useful link for creating vim plugins:
    " https://gist.github.com/nelstrom/1056049/784e252c3de653e204e9e128653010e19fbd493f
    " Guide to making vim plugins
    " https://blog.semanticart.com/2017/01/05/lets-write-a-basic-vim-plugin/
    "
    ":redir @a
    ":function
    ":redir END
    " paste register a 
    "
    " :g/PATTERN/d
    " 	- deletes lines with pattern in it
    "
    " %!grep app
    " %!echo 'dfasd'
    " 	- perform the command on the current file as stdin
    "
    " Using surrond:
    " 	ys - standard
    " 	e.g. ysiw"    puts " around word
    " 	e.g. yss}     puts } around the line
    "	e.g. ds{	  deletes the surrondings
    " :set syntax=sh
    "
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
    " % to find bracket pair
    " will jump to the pair of the bracket
    "
    " :set wrap!
    " 	- toggle line wrap
    "
    " za - toggle fold , zR - open all folds , zM - close all folds
    "    Vim folding commands
    " ---------------------------------
    " zf#j creates a fold from the cursor down # lines.
    " zf/ string creates a fold from the cursor to string .
    " zj moves the cursor to the next fold.
    " zk moves the cursor to the previous fold.
    " za toggle a fold at the cursor.
    " zo opens a fold at the cursor.
    " zO opens all folds at the cursor.
    " zc closes a fold under cursor. 
    " zm increases the foldlevel by one.
    " zM closes all open folds.
    " zr decreases the foldlevel by one.
    " zR decreases the foldlevel to zero -- all folds will be open.
    " zd deletes the fold at the cursor.
    " zE deletes all folds.
    " [z move to start of open fold.
    " ]z move to end of open fold.
    "
    " CTAGS:
    " https://andrew.stwrt.ca/posts/vim-ctags/
    " ----------------------
"#}}}

"# Sets {{{
    syntax on
    filetype plugin indent on
    set nocompatible
    set relativenumber
    set noerrorbells
    set nowrap
    set number
    set splitbelow splitright
    set backupdir=~/swpfiles
    set directory=~/swpfiles
    set shiftwidth=4
    set noswapfile
    "set complete-=i
    set showcmd
    set showmatch
    set incsearch
    set hlsearch
    set foldmethod=marker
    set modifiable
    set ignorecase
    set linebreak
    set scrolloff=3
    set list
    set listchars=tab:>-,eol:$,space:·
    "Below is the amount of characters to use for tabs
    set tabstop=4
    "Below turns tabs into spaces (uses tabstop to define num of spaces)
    set expandtab
    set nostartofline
    set backspace=indent,eol,start
    set clipboard=unnamed

    "Ignore certain folders in vimgrep aka :grep
    set wildignore+=app/build/**

    "sets the AG quickfix K window to open in new tab instead
    set switchbuf+=newtab

    " NOTE: Below is to enable lightline properly and airline(popular)
    set laststatus=2
    set noshowmode

    "set spell spelllang=en_gb
    "set autoindent
    "set smartindent
    "syntax, indent
    "set foldlevelstart=20
    "set encoding=utf-8
    "scriptencoding utf-8
    "set cmdheight=2
    "OPTIONAL ABOVE is used to make the command bar bigger
"#}}}

"# Plugins {{{
    " +++++ Plugins using plug.vim - Plugin Manager +++++
    " Call :PlugInstall to install plugins
    " Call :PlugClean to delete removed/commented out plugins
    " +++++++++++++++++++++++++++++++++++++++++++++++++++
    call plug#begin('~/.vim/plugged')
    Plug 'w0rp/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'kshenoy/vim-signature'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'valloric/youcompleteme'
    Plug 'ycm-core/lsp-examples'
    Plug 'udalov/kotlin-vim'
    Plug 'ap/vim-css-color'
    Plug 'severin-lemaignan/vim-minimap'
    Plug 'dracula/vim'
    Plug 'tpope/vim-surround'
    Plug 'Kardelio/myvimplugin'
    call plug#end()

    "https://github.com/ycm-core/lsp-examples
    "IMPORTANT install other language servers
    
    "NOTE - For dev plugins use runtimepath
    "set runtimepath+=/Users/ldev507/git/benvimplugin.vim
    
    "REMOVED - 
    "Plug 'tpope/vim-commentary' 
    "Plug 'nicwest/vim-http'
    "Plug 'junegunn/vim-emoji'
    "Plug 'junegunn/goyo.vim'
"#}}}

"# Plugin Config {{{
    "NOTE - dracula
    color dracula

    "NOTE - youcompleteme
    let g:ycm_min_num_of_chars_for_completion = 1
    let s:lsp = '/Users/ldev507/git/lsp-examples'
    set completeopt-=preview
    let g:ycm_language_server = [
      \   { 'name': 'kotlin',
      \     'filetypes': [ 'kotlin' ], 
      \     'cmdline': [ expand( '$HOME/.vim/plugged/lsp-examples/kotlin/KotlinLanguageServer/server/build/install/server/bin/kotlin-language-server' ) ],
      \   },
      \ ]
    let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
    let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/.ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf=0
    let g:ycm_goto_buffer_command = 'new-or-existing-tab'
    "let g:ycm_goto_buffer_command = 'new-tab'

    "NOTE - nerdtree
    let g:NERDTreeMapActivateNode='l'
    let NERDTreeShowHidden=1

    "NOTE - airline
    let g:airline#extensions#ale#enabled = 1
    let g:airline_section_y = airline#section#create(['%b %B'])

    "NOTE - vim-minimap
    "let g:minimap_toggle='<leader>m'

    "NOTE - fzf
    function! s:GotoOrOpen(command, ...)
        for file in a:000
            if a:command == 'e'
                exec 'e ' . file
            else
                exec "tab drop " . file
            endif
        endfor
    endfunction
    command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)
    let g:fzf_action = {
                \ 'enter': 'split',
                \ 'ctrl-t': 'tab split',
                \ 'space': 'GotoOrOpen tab' }
                "\ 'space': 'tab split' }
    let g:fzf_buffers_jump=1
    command! -bang -nargs=* BasicFzf
      \ call fzf#run(fzf#vim#with_preview({'source': 'find . -not -path "*/\.*" -type f', 'right': '50%', 'window': '30split'})) 
    command! -bang -nargs=* FullFzf
      \ call fzf#vim#files(<q-args>,fzf#vim#with_preview('right:50%'))
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

    "NOTE - ale
    let g:ale_sign_column_always = 1
"#}}}

"# Maps And Commands {{{

    "# All {{{
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
        noremap ; :FullFzf<CR>
        noremap <leader>; :GFiles<CR>
    "#}}}

    "# Normal {{{
        nnoremap yf :let @" = expand("%")<CR>
        nnoremap <leader>m i# ___ {{{<esc>o#}}}<esc>O<tab><esc>
        nnoremap £ i#
        nnoremap <leader>i :set cursorline!<CR>
        nnoremap <leader>r :NERDTreeToggle<CR>
        nnoremap <leader>1 :NERDTreeFind<CR>
        nnoremap <silent> <leader>v :NERDTreeFind<CR>
        nnoremap <leader>s :call ToggleSpecialCharsVisibility()<CR>
        nnoremap <leader>ss :call Shellcheck()<CR>
        nnoremap <leader>h :vertical resize -5<CR> 
        nnoremap <leader>j :resize -5<CR>
        nnoremap <leader>k :resize +5<CR> 
        nnoremap <leader>l :vertical resize +5<CR> 
        nnoremap n nzz
        "nnoremap dd "dY"_dd
        nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
        nnoremap / /\v
        nnoremap <leader>x :exec '!'.getline('.')<CR>
       " nnoremap <leader>x :bd<CR>
        nnoremap aa ggVG
        nnoremap <leader>a ggVG
        nnoremap <leader>n :call ToggleNumbers()<CR>
        nnoremap <leader>nn :%s/\n//g<CR>
        nnoremap <leader>d :%s/ //g<CR>
        nnoremap <space> zazz
        nnoremap o o<esc>
        nnoremap O O<esc>
        nnoremap <Left> :tabp<CR>
        nnoremap <Right> :tabn<CR>
        nnoremap <Up> :echoe "Use k"<CR>
        nnoremap <Down> :echoe "Use j"<CR>
        nnoremap Y 0y$
        nnoremap <leader>sv :source ~/.vimrc<cr>
        nnoremap <C-e> 5<C-e>
        nnoremap <C-y> 5<C-y>
        nnoremap <leader>gd :YcmCompleter GoTo<CR>
        nnoremap <leader>gf :YcmCompleter FixIt<CR>
    "#}}}

    "# Insert {{{
        inoremap £ #
        inoremap :tick: ✅
        inoremap :skull: 💀
        inoremap :cross: ❌
        inoremap :question: ❓
    "#}}}

   "# Visual {{{
        vnoremap > >gv
        vnoremap < <gv
        vnoremap d "dYgv"_d
        vnoremap <C-e> 5<C-e>
        vnoremap <C-y> 5<C-y>
        vnoremap <leader>c y<esc>Go<esc>p:.!pbcopy<cr> 
   "#}}}

   "# X {{{
       xnoremap <down> :m '>+1<CR>gv=gv
       xnoremap <up> :m '<-2<CR>gv=gv
       xnoremap <right> <Esc>`<<C-v>`>odp`<<C-v>`>lol
       xnoremap <left> <Esc>`<<C-v>`>odhP`<<C-v>`>hoh
   "#}}}

   "# CMap - Remapping within the command line {{{
       cmap Q! q!
   "#}}}

   "# Commands {{{
       command! -bang -nargs=* Todo
                   \ call Todos() 
       command Q q
       command WQ wq
       command Wq wq
   "#}}}

"#}}}

"# Autocmds {{{
    "Disable the annoying auto comment on new line feature
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
    au BufNewFile,BufRead Jenkinsfile setf groovy
    au BufNewFile,BufRead Fastfile setf ruby
    au BufRead *.quiz set fdm=marker
    "au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"

    "has - function to check if vim feature is enabled (vim --version)
    if has("autocmd")
        augroup templates
            autocmd BufNewFile *.html 0r ~/.vim/temps/skel.html
            autocmd BufNewFile *.sh 0r ~/.vim/temps/skel.sh
            autocmd BufNewFile *.java 0r ~/.vim/temps/skel.java
            autocmd BufNewFile *.cpp 0r ~/.vim/temps/skel.cpp
        augroup END
    endif
"#}}}

"# Highlights {{{
    hi CursorLine ctermbg=darkblue ctermfg=white
    hi Search term=standout guibg=red guifg=red ctermbg=Magenta ctermfg=white
    hi DELETE term=standout guibg=white guifg=red ctermbg=white ctermfg=red
    hi TODO term=standout guifg=blue guibg=white ctermbg=blue ctermfg=white
    hi NOTE term=standout guifg=blue guibg=white ctermbg=green ctermfg=red
    hi NEXT term=standout guifg=red guibg=green ctermbg=blue ctermfg=red
    hi IMPORTANT term=bold ctermbg=red ctermfg=white
    hi OPTIONAL term=bold ctermbg=green ctermfg=white
    call matchadd('TODO','^.*TODO.*$')
    call matchadd('NOTE','^.*NOTE.*$')
    call matchadd('NEXT', '^.*NEXT.*$')
    "call matchadd('NEXT', 'NEXT')
    call matchadd('IMPORTANT', '^.*IMPORTANT.*$')
    call matchadd('DELETE', '^.*DELETE.*$')
    call matchadd('OPTIONAL', '^.*OPTIONAL.*$')

    "*cterm-colors*
    "NR-16   NR-8    COLOR NAME 
    "0       0       Black
    "1       4       DarkBlue
    "2       2       DarkGreen
    "3       6       DarkCyan
    "4       1       DarkRed
    "5       5       DarkMagenta
    "6       3       Brown, DarkYellow
    "7       7       LightGray, LightGrey, Gray, Grey
    "8       0*      DarkGray, DarkGrey
    "9       4*      Blue, LightBlue
    "10      2*      Green, LightGreen
    "11      6*      Cyan, LightCyan
    "12      1*      Red, LightRed
    "13      5*      Magenta, LightMagenta
    "14      3*      Yellow, LightYellow
    "15      7*      White
"#}}}

"# Functions {{{
    function EnterHTMLMode()
        nnoremap bo i<b><cr><c-t><esc>
        nnoremap bc i<cr><c-d></b><esc>
    endfunction

    function ExitHTMLMode()
        nunmap bo
        nunmap bc
    endfunction

    function Present()
        set foldlevelstart=2
    endfunction

    function Keys()
        echom "===== Bens Keys ====="
        echom "za - toggle fold , zR - open all folds , zM - close all folds"
        echom "r - open NERDTree , ; - for fzf Files , -; - for fzf GFiles"
        echom "ma - mark at a , 'a go to a , dma delete mark at a"
        echom "z= - spell fix, ]s and [s move between mistake, zg mark spell as ok"
        let ok = input("Ok?")
        set cmdheight=1
    endfunction

    function Html()
        0r ~/.vim/temps/html.html
    endfunction

    function Welcome(name)
        echom "hello: ".a:name . "tes"
        echom a:name
    endfunction

    function ToggleSpecialCharsVisibility()
        set list!
    endfunction
    function ToggleNumbers()
        set number!
        set relativenumber!
    endfunction

    function Vrc()
        echom "Opening ~/.VIMRC"
        sp $HOME/.vimrc
    endfunction

    function GetCurrentLine()
        let ln = line('.')
        echom "Current line is: "ln
        echom "Register a: "@a
        let ok = input("Ok?")
        set cmdheight=1
    endfunction

    function Todos()
        echom "Todos:"
        .!todo
    endfunction

    function Shellcheck()
        echom "Running Shellcheck *"
        norm ggVGdd
        .!shellcheck *
    endfunction

    " The Silver Searcher
    if executable('ag')
      " Use ag over grep
      set grepprg=ag\ --nogroup\ --nocolor
      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      "let g:ctrlp_user_command = 'ag %s --ignore="*/build/*" -l --nocolor -g ""'
      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
    endif
"#}}}

"# Look at this stuff {{{
    "function! ToggleComment(comment_char)
    "    if getline(".") =~ "^" . a:comment_char
    "        execute ".s/^" . a:comment_char . "//g"
    "    else
    "        execute ".s/^/" . a:comment_char . "/g"
    "    endif
    "endfunction

    "autocmd FileType vim nnoremap <buffer> gc :call ToggleComment('"')<CR>
    "autocmd FileType javascript,typescript nnoremap <buffer> gc :call ToggleComment("\\/\\/")<CR>
    "autocmd FileType php,sh,zsh,bash,markdown nnoremap <buffer> gc :call ToggleComment("#")<CR>
"#}}}
