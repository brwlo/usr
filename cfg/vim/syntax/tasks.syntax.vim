" tsv.vim

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "tasks"    | finish | endif

  setl noet ts=8 sw=8 sts=8

	sy match jus '^\v[x!~-]*\tjus\t' | hi jus cterm=bold ctermfg=magenta
	sy match mar '^\v[x!~-]*\tmar\t' | hi mar cterm=bold ctermfg=green
	sy match mkt '^\v[x!~-]*\tmkt\t' | hi mkt cterm=bold ctermfg=red
	sy match pli '^\v[x!~-]*\tpli\t' | hi pli cterm=bold ctermfg=blue
	sy match prs '^\v[x!~-]*\tprs\t' | hi prs cterm=bold ctermfg=yellow
	sy match tfg '^\v[x!~-]*\ttfg\t' | hi tfg cterm=bold ctermfg=cyan

  sy match don '^\v\=.*' | hi don cterm=bold ctermfg=gray
