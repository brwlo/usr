variable v1 3 dup cells allot v1 !
variable v2 3 dup cells allot v2 !
variable v3 3 dup cells allot v3 !
variable v4 100 dup cells allot v4 !

: mkvec  create dup , cells allot ;

: cells+ cells + ;
: ++     cells+ @ ;

\ push/pop elems (tos is first elem)
: >v     dup @ 1+ 1 do dup rot swap i cells+ ! loop drop ;
: v@     dup @ 1 swap do dup i ++ swap -1 +loop drop ;
: v?     dup @ 1 swap do dup i ++ . -1 +loop drop ;

\ sum of elems
: v&     dup >r v@ r> @ 1 do + loop ;

\ operate on all elems ( v%- => n mod v; v% => v mod n )
: v+     dup @ 1+ 1 do 2dup i cells+ +! loop 2drop ;
: v*     dup @ 1+ 1 do 2dup i cells+ tuck @ * swap ! loop 2drop ;
: v/     dup @ 1+ 1 do 2dup i cells+ tuck @ / swap ! loop 2drop ;
: v%-    dup @ 1+ 1 do 2dup i cells+ tuck @ mod swap ! loop 2drop ;
: v%     swap dup @ 1+ 1 do 2dup i cells+ tuck @ swap mod swap ! loop 2drop ;

\ random operation on all elems ( n v -- ... )
variable op
: >op    ' op ! ;
: xop    op @ execute ;
: vx     >op dup @ 1+ 1 do 2dup i cells+ tuck @ xop swap ! loop 2drop ;

\ add two equal length arrays, output to stack
: v#     2dup @ swap @ min ;
: vv+    v# 1+ 1 do 2dup i ++ swap i ++ + -rot loop 2drop ;
: vv*    v# 1+ 1 do 2dup i ++ swap i ++ * -rot loop 2drop ;
: vv/    v# 1+ 1 do 2dup i ++ swap i ++ / -rot loop 2drop ;
: vv%    swap v# 1+ 1 do 2dup i ++ swap i ++ mod -rot loop 2drop ;
