"set background=dark
"let g:solarized_termcolors=256
colorscheme molokai
"colorscheme solarized
"colorscheme murphy
set ignorecase

set smarttab  
set tabstop=4  
set shiftwidth=4  
set expandtab  

set nocompatible
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
"let g:molokai_original = 1

source $VIMRUNTIME/vimrc_example.vim

set noundofile
set nobackup
set mouse=v

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese 

" Disable splash
set shortmess=atI

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

map <silent> <leader>wq :call SuperWrite()<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*<left><left><left><left><left><left>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>

vmap /      y/\<<C-R>"\><cr>
nmap ,/     /\<<C-R><C-W>\><cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
noremap <silent> <Leader>mf :%s/,/，/ge<bar>%s/\./。/ge<bar>:%s/!/！/ge<cr>

" Map make Scratch buffer
nnoremap <Leader>ss :Ss<CR>

" Map return to b for visual mode
nnoremap <Leader>ia :let @a="\n"<CR>

" Map space to open/close folder
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Map the Widnows Close in normal mode
noremap zx :bd<cr><cr>
noremap zz :q<cr><cr>

" Map abbr
iabbr clog console.log();<esc>hi<C-o>:call getchar(0)<CR>
iabbrev adn and
iabbrev mian main
iabbrev waht what
iabbrev tehn then

" Build tags file
nmap <Leader>tag <Esc>:!ctags -R *<CR>

" Taglist usage
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 0
let Tlist_GainFocus_On_ToggleOpen = 1
map <silent> <F9> :TlistToggle<CR>
map <silent> <Leader>p :NERDTreeToggle<CR>
map <silent> <Leader>vv :cclose<CR>
map <silent> <Leader>vn :cnext<CR>
map <silent> <Leader>vp :cprev<CR>

" Zen coding
"let g:user_emmet_expandabbr_key = '<Tab>'
"let g:use_zen_complete_tag = 1

" CD to current file path
nnoremap <silent> <Leader>cd :lcd %:p:h<CR>

" No auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" For php $keyword select
autocmd bufenter *.php :set iskeyword+=\$

" For vimrc source and edit
nnoremap <Leader>rc     :source $VIM/vimrc<CR>
nnoremap <Leader>erc    :e $VIM/vimrc<CR>

if has("cscope")
    set cscopetag
    set csto=0

    if filereadable("cscope.out")
        cs add cscope.out  
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set cst
    set csverb

    nmap <silent> <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <silent> <Leader>l :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <silent> <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <silent> <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <silent> <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    "nmap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    "nmap <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    "nmap <Leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>

    unmap <Leader>ss

endif

function! Do_CsTag()
    if(executable('cscope') && has("cscope") )
        silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs,*.php >> cscope.files"
        silent! execute "!cscope -b"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endf

function! SuperWrite()
    write !sudo tee % > /dev/null
    " Or with :silent (but that doesn't seem to work for everyone)
    "silent write !sudo tee %
    edit!
endf
