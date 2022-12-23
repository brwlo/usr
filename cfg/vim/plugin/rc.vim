" rc.vim
scripte utf-8

" settings
let DAT=system("printf '%s' $dat/vim")
"cal system("mkdir -p $mnt/ssd4/home/dat/bkp $mnt/ssd4/home/dat/swp $mnt/ssd4/home/dat/und")
cal system("mkdir -p $ram/vim/bkp $ram/vim/swp $ram/vim/und")
let DAT=system("printf '%s' $ram/vim/")
let CFG=system("printf '%s' $cfg/vim/")
let &runtimepath=CFG.','.DAT.','.&runtimepath

se bk wb udf
let &dir=DAT."/swp//"
let &bdir=DAT."/bkp/"
let &udir=DAT."/und/"
if has('nvim')|let &shada='s10,<0,!,''100,h,n'.DAT.'/shada'
el |let &viminfo='''100,h,n'.DAT.'/viminfo'|en

se acd bri hid hls noai et nowrap
se enc=utf-8
se isk-=#
se ls=2
se stal=0
se swb=useopen
se ts=2
se sts=2
se sw=2
se siso=1
se scrolloff=0
if has('nvim')|let &scbk=-1|en

"appearance
let &fillchars='fold: '
if has('statusline')
	let &stl ='%<%f'
	let &stl.='[%{(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?",B":"")}]'
	let &stl.='%m%r%h%='
	let &stl.='%14.((%l/%L,%c%V)%) %p%% :: %P'|en
hi CursorColumn	ctermbg=darkred  ctermfg=yellow   cterm=bold 
hi CursorLine   ctermbg=darkred  ctermfg=yellow   cterm=bold 
hi Folded       ctermbg=yellow   ctermfg=darkgray
hi Search       ctermbg=yellow   ctermfg=black
hi StatusLine   ctermbg=black    ctermfg=green    cterm=bold
hi StatusLineNC ctermbg=black    ctermfg=red      cterm=bold
hi TermCursor                    ctermfg=green
hi VertSplit    ctermbg=white    ctermfg=black
syntax on | filetype plugin indent on

"funcs/cmds
fu! RegDel()
let Regs=split('abcdefghijklmnopqrstuvwxyz0123456789"-/+*','\zs')
for i in Regs | cal setreg(i,'') | endfo
endf

" mappings
let mapleader=' '
nn  <leader>p a<c-r>=system('printf "%s" "`xo`"')<cr>
nn  ç         :
nn  <leader>l :n<cr>
nn  <leader>, :N<cr>
nn  <leader>j :bn<cr>
nn  <leader>k :bp<cr>
nn  gl        :se cul!<cr>
nn  gL        :se cuc!<cr>
nn  j         gj
nn  k         gk
nn  Y         y$
nn  <leader>a <c-^>
nn  <leader>n :noh<cr>
nn  <leader>w :w<cr>
nn  <leader>L :se list! nu! rnu!<cr>
nn  <leader>W :se wrap!<cr>
nn  <leader>d a<c-r>=system('printf %s `D`')<cr>
nn  <leader>t a<c-r>=system('printf "%s" `t`')<cr>
nn  <a-f>     :FZF
nn  <leader><leader> :pwd<cr>
cno <a-h>     <left>
cno <a-j>     <down>
cno <a-k>     <up>
cno <a-l>     <right>
cno <a-s-h>   <s-left>
cno <a-s-l>   <s-right>

"autocmds
aug rc-au | au!
	au BufAdd,BufEnter,BufRead,BufNewFile * exe "ru! syntax/*.syntax.vim"
	" fix cursor bug?
"	au VimEnter * if &term!='linux' | se gcr& | en
"	au VimLeave * se gcr=a:block-blinkon0
aug end

"plugins
" netrw
let g:netrw_home=DAT.'/vim/netrw'
let g:netrw_sepchr=0x01
let g:netrw_xstrlen=0
" " ranger
" aug rc_plugins_ranger | au!
" 	au BufEnter *
" 	\ if (split(expand('%'),' ')[0] =~ '\vterm://.*:r(anger)?$')
" 	\ setl nonu nornu|en
" aug end
" map <leader>rr :RangerEdit<cr>
" map <leader>rv :RangerVSplit<cr>
" map <leader>rs :RangerSplit<cr>
" map <leader>rt :RangerTab<cr>
" map <leader>ri :RangerInsert<cr>
" map <leader>ra :RangerAppend<cr>
" map <leader>rc :set opfunc=RangerChangeOperator<cr>g@
