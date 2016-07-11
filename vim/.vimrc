"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the personal vim config used by stdrickforce.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"

" Enable plugins
Bundle 'Lokaltog/vim-powerline'
" Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Shougo/neocomplcache'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
" "Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
" Bundle 'groenewege/vim-less'
" Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
" Bundle 'puppetlabs/puppet-syntax-vim'
" Bundle 'rstacruz/sparkup'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'solarnz/thrift.vim'
" Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-markdown'
" Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/nginx.vim'
" Bundle 'vim-scripts/AutoClose'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
set nocompatible               " must be first line
set background=dark            " Assume a dark background

" General
set fencs=utf-8,gb2312,gbk     " Sets the default encoding
filetype plugin indent on      " Automatically detect file types.
syntax on                      " syntax highlighting
set autochdir                  " always switch to the current file directory.

set nospell                    " spell checking off
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore        " allow for cursor beyond last character
set history=1000               " Store a ton of history (default is 20)

set noswapfile
set backup                     " backups are nice ...
set backupdir=~/.vim/backup
set undofile                   " persistent undo
set undolevels=1000            " maximum number of changes that can be undone
set undoreload=10000           " maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo

" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

" set clipboard
set clipboard+=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
    if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/jellybeans.vim"))
        colorscheme jellybeans
    endif
    set guioptions-=T          " remove the toolbar
    set guioptions-=L          " remove the left scrollbar
    set guioptions-=r          " remove the right scrollbar
else
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        color solarized                    " load a colorscheme
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
    endif
    set term=builtin_xterm         " Make terminal stuff works
    set t_Co=256
endif

set tabpagemax=15             " only show 15 tabs
set showmode                  " display the current mode

set cursorline                " highlight current line

if has('cmdline_info')
    set ruler                      " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                    " show partial commands in status line and selected characters/lines in visual mode
endif

set laststatus=2
set backspace=indent,eol,start " Backspace for dummys
set linespace=0                " No extra spaces between rows
set nu                         " Line numbers on
set showmatch                  " Show matching brackets/parenthesis
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present
set wildmenu                   " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap to
set scrolljump=5               " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor
set nofoldenable               " Disable fold code
set gdefault                   " The /g flag on :s substitutions by default
set hidden                     " Change buffer - without saving
set magic                      " Set magic on, for regular expressions
set autoread                   " Auto reload file on change
set list
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\  " Highlight problematic whitespace


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap            " wrap long lines
set linebreak       " set linebreak
set textwidth=0     " sets the text width
set autoindent      " Auto indent
set smartindent     " Smart indet
set expandtab       " tabs are spaces, not tabs
set smarttab        " Smart tab
set shiftwidth=4    " use indents of 4 spaces
set tabstop=4       " an indentation every four columns
set softtabstop=4   " let backspace delete indent
" Remove trailing whitespaces and ^M chars
"autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','

" Fast editing of the .vimrc
map <leader>v :e ~/.vimrc<cr>

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" Remap VIM 0
map 0 ^

inoremap jk <Esc>

" Paste mode toggle
nnoremap <leader>pp :setlocal paste!<cr>

" Use the arrows to something usefull
nnoremap <right> :bn!<cr>
nnoremap <left> :bp!<cr>

" Tab
noremap gn :tabnew<space>
noremap gj :tabprevious<cr>
noremap gk :tabnext<cr>
noremap gc :tabclose<cr>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" In visual mode when you press * or # to search for the current selection
" "vnoremap <silent> * :call VisualSearch('f')<CR>
" "vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
" "vnoremap <silent> gv :call VisualSearch('gv')<CR>

" Close the current buffer
map <leader>d :Bclose<cr>

" Close all the buffers
map <leader>D :1,300 bd<cr>:q<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map  [F $
imap [F $
map  [H g0
imap [H g0

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Save and return to normal mode on FocusLost
au FocusLost * :silent! wall                 " Save on FocusLost
au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins {
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
    let g:NERDShutUp=1
    let b:match_ignorecase = 1

" OmniComplete
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
            \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
            \endif
    endif

    hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

    " some convenient mappings
    inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menu,preview,longest

" Ctags
    set tags=./tags;/,~/.vimtags

" NerdTree
    map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1

" Tabularize {
    if exists(":Tabularize")
      nmap <leader>a= :Tabularize /=<CR>
      vmap <leader>a= :Tabularize /=<CR>
      nmap <leader>a: :Tabularize /:<CR>
      vmap <leader>a: :Tabularize /:<CR>
      nmap <leader>a:: :Tabularize /:\zs<CR>
      vmap <leader>a:: :Tabularize /:\zs<CR>
      nmap <leader>a, :Tabularize /,<CR>
      vmap <leader>a, :Tabularize /,<CR>
      nmap <leader>a<Bar> :Tabularize /<Bar><CR>
      vmap <leader>a<Bar> :Tabularize /<Bar><CR>

      " The following function automatically aligns when typing a
      " supported character
      inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

      function! s:align()
          let p = '^\s*|\s.*\s|\s*$'
          if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
              let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
              let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
              Tabularize/|/l1
              normal! 0
              call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
          endif
      endfunction

    endif

" Session List
    set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>

" JSON
    nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" Ctrlp
    let g:ctrlp_working_path_mode = 'rc'
    nnoremap <C-o> :CtrlPBuffer<CR>
    nnoremap <C-m> :CtrlPMRU<CR>
    nnoremap <C-e> :CtrlPClearCache<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.DS_Store$\|\.pyc$' }

" Tagbar
    nnoremap <silent> <leader>t :TagbarToggle<CR>

" Fugitive
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>

" Neocomplcache
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_enable_auto_delimiter = 1

    " AutoComplPop like behavior.
    let g:neocomplcache_enable_auto_select = 0

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    " Plugin key-mappings.
    "imap <C-k> <Plug>(neocomplcache_snippets_expand)
    "smap <C-k> <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    " <C-h>, <BS>: close popup and delete backword char.
    " inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    " inoremap <expr><C-y>  neocomplcache#close_popup()
    " inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

" Syntastic
    execute pathogen#infect()

    let g:syntastic_auto_jump=1
    let g:syntastic_check_on_open=1

    " python
    let g:syntastic_python_checkers = ['flake8']
    let g:syntastic_python_flake8_args = '--ignore=E402'

    " php
    let g:syntastic_php_checkers = ['php']

    " javascript
    let g:syntastic_javascript_checkers = ['jshint']

    " golang
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

    let g:syntastic_ignore_files = [".*\.html$"]

" Powerline
    let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indent Fixes
    autocmd FileType css,less,javascript,php,yaml,jedi set shiftwidth=2
    autocmd FileType css,less,javascript,php,yaml,jedi set tabstop=2
    autocmd FileType css,less,javascript,php,yaml,jedi set softtabstop=2
    autocmd FileType css,less,javascript,php,yaml,jedi setlocal noexpandtab nolist cc=120

    autocmd FileType json set noexpandtab tabstop=4

" Python
    " Highlight 80 column
    autocmd FileType python setlocal cc=80

" Less
    autocmd BufRead,BufNewFile *.less set filetype=less

" Jedi
    autocmd BufRead,BufNewFile *.jedi set filetype=jedi

" Thrift
    autocmd BufRead,BufNewFile *.thrift set filetype=thrift

" Json
    autocmd BufRead,BufNewFile *.json set filetype=json

" Nginx
    autocmd BufRead,BufNewFile /etc/nginx/* set filetype=nginx
    autocmd BufRead,BufNewFile /usr/local/etc/nginx/* set filetype=nginx

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Funtion define
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search selection
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Close buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
        \ if expand("<afile>:p:h") !=? $TEMP |
        \   if line("'\"") > 1 && line("'\"") <= line("$") |
        \     let JumpCursorOnEdit_foo = line("'\"") |
        \     let b:doopenfold = 1 |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
        \        let b:doopenfold = 2 |
        \     endif |
        \     exe JumpCursorOnEdit_foo |
        \   endif |
        \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv" |
        \   if(b:doopenfold > 1) |
        \       exe  "+".1 |
        \   endif |
        \   unlet b:doopenfold |
        \ endif
augroup END


" python fold
set foldmethod=indent


" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" Auto add .py header.
function! PyHeader()

    let n = 1
    while n < 3
        let line = getline(n)
        if line =~ '\S*coding\S*'
            return
        endif
        let n = n + 1
    endwhile

    call append(0, '#!/usr/bin/env python')
    call append(1, '# -*- coding: utf-8 -*-')
    call append(2, '')
    call append(3, '__author__ = "stdrickforce"  # Tengyuan Fan')
    call append(4, '# Email: <stdrickforce@gmail.com> <tfan@xingin.com>')
    call append(5, '')
    echohl WarningMsg | echo "Successful in adding the header." | echohl None
endf

au bufnewfile,bufread *.py call PyHeader()

" Auto compile .cpp file.
function! CompileCpp()
    exec "w"
    exec "cclose"
    if &filetype == 'cpp'
        set makeprg=g++\ -o\ %<\ %
    endif
    silent make
    exec "normal :"

    let myfile=expand("%:r")
    if filereadable(myfile)
        execute "! ./%< && rm ./%<"
    else
        cope5
    endif
endf

" Auto compile .java file.
function! CompileJava()
    exec "w"
    exec "!javac %"
    exec "!java %<"
endf

function! Run()
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'php'
        exec "!php %"
    elseif &filetype == 'cpp'
        call CompileCpp()
    elseif &filetype == 'java'
        call CompileJava()
    endif
endf

nnoremap cc :call Compile()<CR>
nnoremap rr :call Run()<CR>