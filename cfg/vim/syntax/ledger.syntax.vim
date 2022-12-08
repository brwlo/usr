" syntax/ledger.vim

	if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "ledger"    | finish | endif
	se ts=16 sts=0

  sy match pos '\v\t\+?\d+\.?\d*'   | hi pos  cterm=bold ctermfg=green
  sy match neg '\v\t\-\d+\.?\d*'    | hi neg  cterm=bold ctermfg=red
  sy match nul '\v\t[+-]?0+\.?0*'   | hi nul  cterm=bold ctermfg=gray
	sy match sep ':'                  | hi sep  cterm=bold ctermfg=blue
	sy match como ' \u+$'             | hi como cterm=bold ctermfg=cyan
	sy match date '\d\d\d\d-\d\d-\d\d'| hi date cterm=bold ctermfg=yellow
	sy match name '  .*$'             | hi name cterm=bold ctermfg=magenta
	sy match comm '\v\s;.*$'          | hi comm ctermfg=cyan

	nn <leader>d	i<c-r>=system('date- -I')<cr><esc>dd$a
