\ bubble sort for "pascal" arrays
v: adr v: ptr v: swp?
: len   adr @ @ ;
: inc   ptr @ 1+ len 1- mod ptr ! ;
: cur   adr @ ptr @ 1+ cells + ;
: nex   cur 1 cells + ;
: swp   cur @ nex @ cur ! nex ! -1 swp? ! ;
: res   ptr @ 0= if 0 swp? ! then ;
: cmp   res cur @ nex @ > if swp then inc ;
: don   swp? @ not ptr @ len 2 - = and ;
: (shw) cr len 1+ 1 do adr @ i cells + ? 9 emit loop ;
: bbs   adr ! begin cmp (shw) don until ;
\ res=reset don=done
