" qdr.vim

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "qdr"     | finish | endif
  se noet

	sy match row '^\S*' | hi row ctermfg=cyan
	sy match col '\%^.*$' | hi col ctermfg=magenta
	setl ts=16 sts=16 sw=16
  com  -nargs=0 -count=2 Tsv :se ts=<count> sts=<count> sw=<count>
  nn   <leader>T <count>:Tsv<cr>
