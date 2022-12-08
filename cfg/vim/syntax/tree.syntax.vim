" tsv.vim

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "tree"    | finish | endif
	se noet nomodeline ai

"	sy match val '\v^\t\S+\zs(\s\S+)$' "not working
  sy match val2 '\v\s*::\s.*$'
" sy match lst '\v\=\s.*$'

	sy match one '\v^[^:]+:*'
	sy match two '\v^\t[^\t]+\s*'
	sy match tre '\v^\t\t[^\t]+\s*'
	sy match qua '\v^\t\t\t[^\t]+\s*'
	sy match qui '\v^\t\t\t\t[^\t]+\s*'
  sy match sex '\v^\t\t\t\t\t[^\t]+\s*'
  sy match sep '\v^\t\t\t\t\t\t[^\t]+\s*'

  sy match exc '\v^\!.*'|hi exc cterm=bold ctermbg=red
  sy match int '\v^\?.*'|hi int cterm=bold ctermfg=gray
  sy match com '\v^\#.*'|hi com cterm=bold ctermfg=blue

	hi val cterm=bold ctermfg=blue
	hi val2 cterm=bold ctermfg=blue
  hi lst cterm=bold ctermfg=blue

	hi one cterm=bold ctermfg=red
	hi two cterm=bold ctermfg=yellow
	hi tre cterm=bold ctermfg=magenta
	hi qua            ctermfg=green
	hi qui            ctermfg=cyan
	hi sex            ctermfg=gray
  hi sep            ctermfg=yellow
	setl ts=2 sts=2 sw=2
