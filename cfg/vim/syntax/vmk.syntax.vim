" vmk.vim

  if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "vmk"     | finish | endif
  setl noet ts=12 sts=12 sw=12

	sy match key '^. '      | hi key cterm=bold ctermfg=magenta
  sy match val '^. \zs.*' | hi val cterm=bold ctermfg=yellow
