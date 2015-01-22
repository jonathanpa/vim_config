set nocompatible  " We don't want vi compatibility.

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

syntax on

" autocmd VimEnter * call fuf#addMode('tab')

set nu  " Line numbers on

set autoindent
set smarttab
set expandtab
set hlsearch
set incsearch

set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.

command Path echo expand('%:p')
command Trim %s/\s\+$//e

imap jj <Esc>

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
map <F2> :match ExtraWhitespace /\s\+$/<CR>
map <F3> :Trim<CR>

map <F5> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
map <F6> :TagbarToggle<CR>

map <C-a> :CtrlP<CR>
map <C-z> :CtrlPBuffer<CR>
map <C-j> :CtrlPTag<CR>

map <C-b> :MRU<CR>

map <C-h> :Path<CR>

map <C-c> :TComment<CR>

map \p :RunSpec<CR>
map \t :RunSpecLine<CR>
map \g :RerunSpec<CR>

map ,gs :Gstatus<CR>
map ,gca :Gcommit -v<CR>
map ,gdf :Gdiff<CR>
map ,gb :Gblame<CR>

map ,[ :cp<CR>
map ,] :cn<CR>
map ,{ :cpf<CR>
map ,} :cnf<CR>

map <C-k> gT
map <C-l> gt

map <C-e> :Errors<CR>
map <C-w>t :tabnew<CR>

map ,o :only<CR>
map ,O :tabonly<CR>

let g:syntastic_enable_signs=1

set laststatus=2

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType * set ai sw=2 sts=2 et
augroup END

let g:molokai_original=1
colorscheme molokai

set cursorline
hi CursorLine cterm=underline

set foldmethod=indent
set foldlevel=2

" Don't update folds in insert mode.
aug NoInsertFolding
  au!
  au InsertEnter * let b:oldfdm = &l:fdm | setl fdm=manual
  au InsertLeave * let &l:fdm = b:oldfdm
aug END

let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'marks']

set colorcolumn=80
hi ColorColumn ctermbg=235 guibg=#403D3D

" Vimux
map <F8> :call VimuxRunCommand('')<CR>
map <F9> :call VimuxCloseRunner()<CR>

map ,v :let g:VimuxRunnerType = "window"<CR>:let VimuxUseNearest = 1<CR>
map ,V :unlet g:VimuxRunnerType<CR>:unlet VimuxUseNearest<CR>:call VimuxOpenRunner()<CR>:call VimuxCloseRunner()<CR>

map ,w :TurboSpecLoad<CR>
map ,p :TurboSpec<CR>
map ,t :TurboSpecLine<CR>
map ,g :TurboSpecAgain<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-g><Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-g><Down> :TmuxNavigateDown<CR>
nnoremap <silent> <C-g><Up> :TmuxNavigateUp<CR>
nnoremap <silent> <C-g><Right> :TmuxNavigateRight<CR>
nnoremap <silent> <C-g>b :TmuxNavigatePrevious<CR>

let g:ctrlp_extensions = ['tag']

