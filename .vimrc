set nocompatible

" visual aids
set ruler laststatus=2 number title hlsearch backspace=2 incsearch hidden showcmd scrolloff=10

" tab completion
set wildmode=longest,list,full wildmenu

" remove 'esc' delay
set ttimeoutlen=50

" make things modern
set t_Co=256
syntax on
set encoding=utf-8

" make help open from the bottom
autocmd filetype help wincmd J

" custom esc map
inoremap kj <esc>:noh<CR>

" tab stuff
"set tabstop=4 shiftwidth=4 expandtab autoindent
set cindent autoindent

" toggle whitespace
nnoremap <leader>l :set list!<CR>

" kernel printk's
nnoremap <leader>kk o<esc>0Cprintk(KERN_INFO "KAIJ %s:%d Caller:%pS\n",__FUNCTION__,__LINE__,__builtin_return_address(0));<esc>F\i
nnoremap <leader>ks o<esc>0Cprintk(KERN_INFO "KAIJ %s:%d Caller:%pS : %s\n",__FUNCTION__,__LINE__,__builtin_return_address(0));<esc>F)i, 
nnoremap <leader>kr o<esc>0Cprintk(KERN_INFO "KAIJ %s:%d Caller:%pS ret:%d\n",__FUNCTION__,__LINE__,__builtin_return_address(0), ret);<esc>F\i
nnoremap <leader>kf o<esc>0Cprintf("KAIJ %s:%d Caller:%pS\n",__FUNCTION__,__LINE__,__builtin_return_address(0));<esc>F\i
nnoremap <leader>ke o<esc>0C/*KAIJ*/{char asdf[500];snprintf(asdf,500,"echo USRSP KAIJ %s:%d Caller:%pS >> /dev/kmsg",__FUNCTION__,__LINE__,__builtin_return_address(0));system(asdf);}<esc>FSa

" configure cscope
source ~/cscope_maps.vim

" open file in same directory
nnoremap <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" cut/paste to custom clipboard file
vnoremap <leader>y "yy:tabe ~/.cl<CR>VGd"yPGdd:w!<CR>:bd<CR>
nnoremap <leader>p :r ~/.cl<CR>

" enable mouse scrolling
"set mouse=a

" enable ALT mappings
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw

" page up/down
noremap <A-j> <C-f>
noremap <A-k> <C-b>

" center searches on screen
nnoremap n nzz
nnoremap N Nzz
nnoremap # #zz
nnoremap * *zz

hi CursorLine guibg=Grey40

nnoremap . @@
nnoremap @@ .
