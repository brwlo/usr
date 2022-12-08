" todo.vim

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "todo"    | finish | endif

  setl noet ts=24 sw=24 sts=24

	sy match pli '\v^pli.*'
	sy match mar '\v^mar.*'
	sy match mkt '\v^mkt.*'
	sy match tfg '\v^tfg.*'
	sy match jus '\v^jus.*'
	sy match prs '\v^prs.*'

	hi pli cterm=bold ctermfg=blue
	hi mar cterm=bold ctermfg=green
	hi mkt cterm=bold ctermfg=red
	hi tfg cterm=bold ctermfg=cyan
	hi jus cterm=bold ctermfg=magenta
	hi prs cterm=bold ctermfg=yellow
