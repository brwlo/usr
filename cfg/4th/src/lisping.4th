\ lisp like conses/s-expressions in forth
\ https://www.reddit.com/r/Forth/comments/7f3hsc/how_to_make_trees_in_forth/

: cons here -rot , , ;
: car  @ ;
: cdr  cell + @ ;
\ example
nil 3 cons 2 cons 1 cons

\ window dressing 1
: . cons ;

\ window dressing 2
: ( ;
: ) cons ;
