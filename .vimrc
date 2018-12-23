filetype on
filetype plugin on
set nocompatible
set omnifunc=syntaxcomplete#Complete
set tags=./tags
set path+=**
set wildmenu
filetype indent on
autocmd FileType c,cpp set cindent "This allows for c-like indentation
set sw=4 "Set the sw for the auto indent to 4 spaces
set number "Show the line numbers on the left
set relativenumber
"Change the color of the text and turn on syntax highlighting
"color elflord
"color desert
"color torte
"colorscheme evening
"colorscheme slate
colorscheme murphy
syntax on "Turn on syntax highlighting
set showmatch "Show matching braces
set showmode "Show current mode
"When one of the chars is typed, the matching is typed and the cursor moves left
""inoremap ' ''<Left>
""inoremap " ""<Left>
""inoremap { {}<Left>
""inoremap ( ()<Left>
nnoremap <silent> gg :noh<CR>
"nnoremap <silent> <C-n> :bn<CR>
"nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-i> :bn<CR>
nnoremap <silent> <C-u> :bp<CR>
nnoremap <silent> <C-g> <C-]>

let g:netrw_liststyle = 3
let g:netrw_winsize = 15
nnoremap <silent> <C-e> :15Lexplore<CR>
set sr		"round to 'shiftwidth' for '<<' and '>>'
"let g:miniBufExplVSplit = 20	"Open MBE vertically, 20 chars wide
"let g:miniBufExplBRSplit = 0	"Open on the left
"let g:miniBufExplorerAutoStart = 0	"Do not auto start
"let g:miniBufExplStatusLineText = 'Buffers'
"nnoremap <silent> <C-t> :MBEToggle<CR> :MBEFocus<CR>	"Ctrl-t toggles MBE

colorscheme PerfectDark

set viminfo=%,'100,<50,s10,h,rA:,rB:

set incsearch
set hlsearch
set t_vb=
set ignorecase
set smartcase
set autoindent
set ai
set si
set wrap
set mouse=a
set tabstop=4
set shiftwidth=4
set showmatch
set pastetoggle=<F10>
"inoremap <C-v> <F10><C-r>+<F10>
"vnoremap <C-c> "+y
set clipboard=unnamedplus
set novisualbell
set backspace=indent,eol,start

autocmd BufNewFile,BufRead *.sv set syntax=verilog_systemverilog

set confirm

set showcmd

set laststatus=2
set statusline=%f\ -\ FileType:\ %y\ -\ Line\ %l/%L

" StatusLine stuff:
"if version >= 700
"	au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"	au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"endif


" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

set timeoutlen=1000 ttimeoutlen=10
set cursorcolumn
set cursorline
set splitbelow
set splitright

function! GoToNextIndent(inc)
	" Get the cursor current position
	let currentPos = getpos('.')
	let currentLine = currentPos[1]
	let matchIndent = 0

	" Look for a line with the same indent level without going out of the
	" buffer
	while !matchIndent && currentLine != line('$') + 1 && currentLine != -1
		let currentLine += a:inc
		let matchIndent = indent(currentLine) == indent('.')
	endwhile

	" If a line is found go to this line
	if (matchIndent)
		let currentPos[1] = currentLine
		call setpos('.', currentPos)
	endif
endfunction

" shift modifier for nav keys moves up/dwn between "blocks" of text, left/right
" between words (ignoring punctuation)
"nnoremap <silent> J :call GoToNextIndent(1)<CR>
"nnoremap <silent> K :call GoToNextIndent(-1)<CR>
nnoremap <silent> J }
vnoremap <silent> J }
omap <silent> J }
"nnoremap <silent> J 15j
"vnoremap <silent> J 15j
nnoremap <silent> K {
vnoremap <silent> K {
omap <silent> K {
"nnoremap <silent> K 15k
"vnoremap <silent> K 15k
nnoremap <silent> H B
vnoremap <silent> H B
omap <silent> H B
nnoremap <silent> L W
nnoremap <silent> L W
omap <silent> L W

noremap <silent> <C-<Space>> <Esc>

vnoremap iH <Esc>:silent! normal! wbvt_<CR>
"omap iH :normal viH<CR>
omap iH :silent! normal! wbvt_<CR>

vnoremap iL <Esc>:silent! normal! hevT_<CR>
"omap iL :normal viL<CR>
omap iL :silent! normal! hevT_<CR>

" ctrl modifier for nav keys moves up/dwn to ends of the file, left/right
" between ends of the line
nnoremap <silent> <C-H> ^
vnoremap <silent> <C-H> ^
omap <silent> <C-H> ^
nnoremap <silent> <C-J> G
vnoremap <silent> <C-J> G
omap <silent> <C-J> G
nnoremap <silent> <C-K> gg
vnoremap <silent> <C-K> gg
vnoremap <silent> <C-K> gg
nnoremap <silent> <C-L> $
vnoremap <silent> <C-L> $
omap <silent> <C-L> $

nnoremap qq :q<CR>

"nnoremap <silent> <C-N> :call GoToNextIndent(1)<CR>
"nnoremap <silent> <C-P> :call GoToNextIndent(-1)<CR>

nnoremap <silent> ; z.
nnoremap <silent> t zt
nnoremap <silent> T zb
nnoremap <silent> f <C-Y>
nnoremap <silent> F <C-E>
