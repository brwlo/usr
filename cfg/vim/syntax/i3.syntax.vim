" bw: cfg1.vim (20170724_214821)

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "i3"    | finish | endif

" setl nowrap ts=7
  setl	foldmethod=syntax
  sy	sync fromstart

  sy match aaa '^#[^#+\t ].*$'	| hi aaa guifg=red	 ctermfg=red
" sy match bbb '^ #[^#+\t ].*$'	| hi bbb guifg=yellow ctermfg=yellow
" sy match ccc '^  #[^#+\t ].*$'	| hi ccc guifg=blue	 ctermfg=blue
" sy match ddd '^   #[^#+\t ].*$'	| hi ddd guifg=cyan	 ctermfg=cyan

  sy match cmd '\v^ +\w+'		| hi cmd guifg=green	   ctermfg=green
  sy match ncm '\v^# +.*'		| hi ncm guifg=darkcyan ctermfg=darkcyan
" sy match opt '\v--=\w+'		| hi opt guifg=cyan	   ctermfg=cyan
  sy match var '\v\$\w+'		| hi var guifg=blue	   ctermfg=blue
  sy match dqt '\v".*"$'		| hi dqt guifg=yellow   ctermfg=yellow

  sy region fa start="\v^#\." end="\v\ze\n#\."		transparent fold 
  sy region fb start="\v^(#.|  )mode" end="\v^(#.)=\}"	transparent fold 
