set nocompatible              " be iMproved, required
filetype off                  " required
" jaa
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins here
Plugin 'altercation/vim-colors-solarized'

" A sane starting point
Plugin 'tpope/vim-sensible'

" File browser
Plugin 'tpope/vim-vinegar'

" Fuzzy search
Plugin 'kien/ctrlp.vim'

" commenting code
Plugin 'scrooloose/nerdcommenter'

" Rails stuff
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'thoughtbot/vim-rspec'

" Whitespace must die.
" Plugin 'ntpeters/vim-better-whitespace'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'junegunn/vim-emoji'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme solarized

nnoremap ZX ZQ

" Linters
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = [ 'haml_lint' ]

" Rspec shortcuts
let g:rspec_command = "!bundle exec rspec -- {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>p :call RunLastSpec()<CR>

"Highlight bad whitespace
highlight ExtraWhitespace ctermbg=028 guibg=darkblue

" Quick save mappings
inoremap <esc><esc> <esc>:w<cr>i
nnoremap <c-s> :w<cr>
" inoremap <c-s> <esc>:w<cr>i
" nnoremap <c-s> :w<cr>

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=80,100

" Numbers
set number
set numberwidth=5

" Whitespace
" set nowrap                    " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs
" au VimEnter * ToggleStripWhitespaceOnSave

" Searching
set ignorecase      " searches are case insensitive...
set smartcase       " ... unless they contain at least one capital letter

" Make Ctrl+P etc. usable
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.(git|hg|svn|sass-cache)|node_modules|bower_components|deps|_build|target)$'
  \ }

let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0

" Preferred file browsing layout.
let g:netrw_liststyle=3

" Highlighting 'patches'
:highlight DiffAdd term=reverse ctermbg=114 ctermfg=233 guibg=Magenta

autocmd QuickFixCmdPost *grep* cwindow

" Completion
set omnifunc=emoji#complete
let g:omni_sql_no_default_maps = 1
