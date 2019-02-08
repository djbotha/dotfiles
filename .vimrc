"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              VIM-PLUG PLUGINS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install vim plug on new machine
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Adds commands for surrounding chars
Plug 'tpope/vim-surround'

" Status line
Plug 'vim-airline/vim-airline'

" Commenting shortcuts
Plug 'tpope/vim-commentary'

" Afterglow Theme
Plug 'danilo-augusto/vim-afterglow'

" Firacode Font Ligatures
Plug 'tonsky/firacode'

" Latex Support 
Plug 'lervag/vimtex'

" Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             END VIM-PLUG PLUGINS                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VIM-CONFIG                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4 character tabstop
set tabstop=2
" 4 spaces per tab when editing
set softtabstop=2
" 80 columns per line
set textwidth=80
" autoindent on newline
set autoindent
" tabs are spaces
set expandtab
" Add | as indentation character
" set listchars=tab:\|\ 
" list tab characters
" set list
" relative line numbers
set relativenumber
" line numbers
set number
" highlight current line
set cursorline
" visual autocomplete for command bar
set wildmenu
" don't redraw when executing macros or registers
set lazyredraw
" highlight matching brackets
set showmatch
" yank to system clipboard
set clipboard=unnamed
" enable mouse
set mouse=a
" show last run command in right hand corner
set showcmd
" terminal background settings
set t_ut=
" enable syntax processing
syntax enable
" use case insensitive search
set ignorecase
" use case sensitive search when using capitals
set smartcase
" highlight search results
set hlsearch
" disable buggy latex error highlighting
let g:tex_no_error=1
" moves vim ~ files to ./vim-temp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" undo directory
set undodir=~/.vim/undodir
" read undo history from file
set undofile
" set , as leader
let mapleader = ","
" show 5 lines above and below cursor when scrolling
set scrolloff=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               END VIM-CONFIG                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 AUTOCOMMANDS                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make a highlight file for user-defined types. 
autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
autocmd BufRead,BufNewFile *.[ch] endif
autocmd Filetype nasm setlocal ts=2 sw=2 softtabstop=2 expandtab
autocmd FileType git set keywordprg=git\ show

" highlights bg in red if over column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" SIMPL
au BufRead,BufNewFile *.simpl setfiletype simpl
au FileType simpl set autoindent expandtab softtabstop=4 shiftwidth=4 tabstop=4 textwidth=80
au FileType tex setlocal tw=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              END AUTOCOMMANDS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  VIM-REMAPS                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move to beginning of line
nnoremap B ^
" move to end of line
nnoremap E $
" edit vimrc
nnoremap <leader>ve :edit ~/.vimrc<CR>
" source vimrc
nnoremap <leader>vs :source ~/.vimrc<CR>
" edit zshrc
nnoremap <leader>ze :edit ~/.zshrc<CR>
" source zshrc
nnoremap <leader>zs :source ~/.zshrc<CR>
" remap move between screens
nnoremap <c-l> <C-w>l
" remap move between screens
nnoremap <c-h> <C-w>h
" remap move between screens
nnoremap <c-j> <C-w>j
" remap move between screens
nnoremap <c-k> <C-w>k
" save
nnoremap <leader>w  :w<CR>
" save & quit
nnoremap <leader>wq  :wq<CR>
" close current buffer
nnoremap <leader>x  :bd<CR>
" insert newline and return to normal mode
nmap <CR> o<Esc>
" insert newline above and return to normal mode
nmap <leader><CR> O<Esc>
" press space to clear search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" autocomplete braces
inoremap {<TAB> {<CR>}<Esc>O
" autocomplete c comments
inoremap // /*  */<Esc><BS><BS>i
"Type ss<TAB> to get return EXIT_SUCCESS
inoremap ss<TAB> return EXIT_SUCCESS;<Esc>
"Type ctemp to insert c boilerplate code
inoremap ctemp #include <stdio.h><CR>#include <stdlib.h><CR><CR>int main(int argc, char *argv[])<CR>{<CR>}<Esc>Oreturn EXIT_SUCCESS;<ESC>O
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             END VIM-REMAPS                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
