\ linked lists (not yet understood)
\ see https://groups.google.com/g/comp.lang.forth/c/z9CIzcIFAN0
\ see gforth lib chains.fs

: data ( node -- ptr   ) cell+ ;
: next ( node -- node' ) @ ;
: link ( list node     ) ! ;

0 constant empty
: emp   ( list -- f    ) empty = ;
: noemp ( list -- f    ) empty <> ;

: node  ( size -- node ) cell+ allocate throw ;
: lfree ( node         ) free throw ;
