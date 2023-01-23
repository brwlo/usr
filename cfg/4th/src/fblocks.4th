\ fblocks.4th - file blocks
cc warnings off
: empty  s" ---marker--- marker ---marker---" evaluate ;
: run    s" 000.4th" included ;

\ aux
: str++  here swap dup >r move here r> str+ ; ( string join fix )
: #fname 0 <# # # #s #> s" .4th" str+ ;       ( n -- str )
: make   s" touch " rot #fname str++ system ; ( n --     )
: edit   s" e " rot #fname str++ system run ; ( n --     )

\ fblock descriptions (first lines), count etc.
0 value fbh 0 value dh v: cnt
: cnt+   if 1 cnt +! then ;
: open   r/o open-file throw to fbh ; : #open #fname open ;
: close  fbh close-file throw ;
: line   open pad 80 fbh read-line throw drop pad swap close ;
: desc   if cr 2dup drop 3 type 3 spaces line type else 2drop then ;
: odir   s" ." open-dir throw to dh ; : cdir dh close-dir throw ;
: rdir   pad 80 dh read-dir throw ; : match  s" ???.4th" filename-match ;
: cntdir rdir if pad swap match cnt+ 0 else drop -1 then ;
: dfile  rdir if pad swap 2dup match desc 0 else drop -1 then ;
: number cnt 0! odir begin cntdir until cdir ;
: -fblk  number cnt @ 0= if 0 make number then ;
: msg    page ." CURRENT FILE BLOCKS" ;
: fbls   -fblk msg odir begin dfile until cdir ;
: fbnew  number cnt @ ;
: fbld   #fname included ;
\ : fbfind -fblk msg odir begin until ;

\ utils
v: cur
: ls  fbls ;
: ..  cur @ edit run ;
: ,,  cur ! .. ;
: .+  fbnew edit ;
marker ---marker---
