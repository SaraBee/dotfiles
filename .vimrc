" SaraBee's vimrc

" Couldn't get this to work, but leaving it here so I can try again later
" Install vim-plug if not found 
" if empty(glob('~/.vim/autoload/plug.vim'))
"	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sleuth'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'vim-syntastic/syntastic'
call plug#end()

autocmd!
set nocompatible
set encoding=utf-8

" Backups, undo, views
set backup
silent execute '!mkdir -p $HOME/.vim/tmp/backup'
set backupdir=$HOME/.vim/tmp/backup// " backups
" Make Vim able to edit crontab files again.
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
set directory=$HOME/.vim/tmp/swap//   " swap files
silent execute '!mkdir -p $HOME/.vim/tmp/views'
set viewdir=$HOME/.vim/tmp/views//    " view files
set undofile
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
set undodir=~/.vim/tmp/undo// " undofiles

au BufWinLeave * silent! mkview   " make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview " make vim load view (state) (folds, cursor, etc)

au BufWritePost .vimrc so ~/.vimrc

" * Tab-related - The first three are currently automatically handled by
" vim-sleuth
" set shiftwidth=4
" set softtabstop=4
" set tabstop=4
set expandtab
set tags=tags;/

" * Basics
syntax on                          " syntax highlighting is nifty! let's turn it on!
set showcmd                        " show partially-typed commands in the status line
set hidden
set laststatus=2                   "always show status line

" * Leader
let mapleader = ","

" * General Options
set history=1000                   " keeps a thousand lines of history
set magic                          " allows pattern matching with special characters
set backspace=2                    " make backspace work like normal
set visualbell                     " visual bell instead of annoying beeping
if has("mouse")
    set mouse=a                    " enable full mouse support in the console
endif
if has('mouse_sgr')                " fixing mouse click when the line gets too long
    set ttymouse=sgr
endif
set virtualedit=onemore            " end of the line? what's that?

" * Search & Replace
set ignorecase                     " make searches case-insensitive
set smartcase                      " unless they contain upper-case letters ;)
set incsearch    		           " show the `best match so far' as search strings are typed
set gdefault                       " assume the /g flag on :s substitutions
set hlsearch                       " highlight search items

set wrap linebreak textwidth=0     " set vim to soft wrap lines
set formatoptions=qrn1
set autoindent
set shiftround

" absolute line numbers in insert mode, relative otherwise for easy movement
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set autochdir " cd into directory of opened file
set autoread " when a file is changed outside of vim, automatically read it again
set splitright " split new windows on the right of the current one
set splitbelow " split new windows below the current one
set fillchars=diff:⣿,vert:│
set title " why this doesn't happen by default is a mystery
let &titleold=fnamemodify(&shell, ":t") " string to restore the title to when exiting Vim
set colorcolumn=+1
set wildmenu                       " enables a menu at the bottom of the vim/gvim window
set wildmode=longest,list          " complete on tab to longest match, present match list on second tab
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files"
set ttyfast                        " enable support for higher speed terminal connections
set showmatch                      " show brace matching
set matchtime=3                    " for 3 milliseconds
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set shortmess=aoOtI           " list of flags to make messages shorter

set wildchar=<TAB>            " have command-line completion <Tab>
" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do by default),
" and ~ convert case over line breaks; also have the cursor keys wrap in insert mode
set whichwrap=h,l,~,[,]

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" invisible characters to show
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Overriding some colors
highlight LineNr ctermfg=DarkGrey guifg=DarkGrey
highlight Statement ctermfg=LightGrey guifg=LightGrey
highlight CursorLineNr ctermfg=LightGrey guifg=LightGrey

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" unhighilight search items with ,<space>
nnoremap <leader><space> :noh<cr>

" toggle invisible characters
nnoremap <leader>l :set list!<cr>

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" flip syntax on and off
nmap <leader>sw :syntax off<CR>:syntax on<CR>

" strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Easier linewise reselection
map <leader>v V`]

" reselect visual block after indent change
vnoremap < <gv
vnoremap > >gv

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#enabled = 1

" tmuxline
let g:airline#extensions#tmuxline#enabled = 1

" Syntastic options
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" * Text Formatting -- Specific File Formats

" recognize anything at all with a .txt extension as being human-language text
augroup filetype
    autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END
" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human,markdown set formatoptions+=t textwidth=78
" set 2 space tabs for html and ruby
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent
" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro
" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent
" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" courtesy of ycatamoto
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

