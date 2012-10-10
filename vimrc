set nocompatible  " We don't want vi compatibility.

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

syntax on

autocmd VimEnter * call fuf#addMode('tab')

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

map <F2> :match ExtraWhitespace /\s\+$/<CR>
map <F3> :Trim<CR>

map <F5> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

map <C-a> :FufCoverageFile<CR>
map <C-z> :FufTab<CR>

map <C-b> :MRU<CR>

map <C-h> :Path<CR>

"qwerty
"map <C-l> gt
"map <C-k> gT

"azerty
map <C-m> gt
map <C-l> gT

map <C-e> :Errors<CR>

let g:syntastic_enable_signs=1

set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]\ %=

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,coffee,gemfile,vim,xml set ai sw=2 sts=2 et
augroup END


"For gnome-terminal
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
endif

colorscheme molokai

set cursorline
hi CursorLine cterm=underline

set foldmethod=syntax
set foldlevel=2

highlight ExtraWhitespace ctermbg=red guibg=red
