" bw: pen.vim (j wybuhOh)

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "pen" | finish | endif

  setl	nowrap ts=4
  setl	foldmethod=syntax
  sy	sync fromstart

  sy match aaa '^"[^"\t ].*$'			| hi aaa guifg=red	   ctermfg=red
  sy match bbb '^ "[^"\t ].*$'			| hi bbb guifg=yellow   ctermfg=yellow
  sy match ccc '^  "[^"\t ].*$'			| hi ccc guifg=blue	   ctermfg=blue
  sy match ddd '^   "[^"\t ].*$'			| hi ddd guifg=cyan	   ctermfg=cyan
" sy match cmd '\v^\s+\a+' contains=grp		| hi cmd guifg=green	   ctermfg=green
  sy match cmd '\v^ +(sil )?\a+' contains=grp	| hi cmd guifg=green	   ctermfg=green
  sy match cnd '\v  (if|fi|e[ln](if)=)'		| hi cnd guifg=magenta  ctermfg=magenta
  sy match ncm '\v^" +.*'				| hi ncm guifg=darkcyan ctermfg=darkcyan
  sy match eof '\v(^|<<)EO[MF]'			| hi eof guifg=magenta  ctermfg=magenta
  sy match grp '\v(^  |\| +)\zsgr'			| hi grp guifg=red	   ctermfg=red

  sy region fa start='^"[^"\t ]'	 end='\ze\n"[^"\t ]'		transparent fold
  sy region fb start='^ "[^"\t ]'	 end='\v\ze\n ="[^"\t ]'	transparent fold
" sy region fc start='^  "[^"\t ]'  end='\v\ze\n {,2}"[^"\t ]'	transparent fold
" sy region fd start='^   "[^"\t ]' end='\v\ze\n {,3}"[^"\t ]'	transparent fold
" sy region js start='\v.+EO[FM]$'	 end='\v^EO[FM]$'		transparent fold

  sy region cd start='^if' end='^fi' transparent fold

" not working
  sy match comName '\vcom\!?\s\zs<\w+>(,<\w+>)?' | hi comName ctermfg=magenta guifg=magenta
