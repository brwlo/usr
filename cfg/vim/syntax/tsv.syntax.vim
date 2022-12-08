" tsv.vim

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "tsv"     | finish | endif
  se noet
	sy match body '^.*$'   | hi body ctermfg=yellow
	sy match head '\%^.*$' | hi head cterm=bold ctermfg=red
	setl ts=32 sts=32 sw=32
  com  -nargs=0 -count=2 Tsv :se ts=<count> sts=<count> sw=<count>
  nn   <leader>T <count>:Tsv<cr>
