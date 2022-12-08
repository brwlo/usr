" bw: cfg1.vim (20170724_214821)

	if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "4th"     | finish | endif
	setl ts=12 et iskeyword=\@,\,,\>,:

sy match   interp '.'
sy match   variab '\v(var(iable)*|con(stant)*|v:|c:|2v:|2c:) [^ ]+( |$)'
sy match   define '\v(^:| :) +[^ ]+ '
sy match   compil contains=define '\v[^(: +\[^ \]+ )]([^ ]* +)+;'
sy match   import '\v(^| +)([@!,\[\]]|\>r|r\>)( |$)'
sy match   commen '\v^\\.*$'
sy region  parens start="( " end=" )"
sy keyword native , @ c, c@ ! 2@ 2! 2, r\> \>r

hi interp ctermfg=yellow
hi variab ctermfg=magenta
hi compil ctermfg=green
hi define ctermfg=red
hi import ctermfg=cyan
hi commen ctermfg=gray
hi parens ctermfg=gray
hi native ctermfg=cyan
