: cc    clearstack page ;
: not   0= ;
: v:    variable ;
: c:    constant ;
: 2v:   2variable ;
: 2c:   2constant ;

: str+  2swap dup >r pad swap move dup pad r@ + swap >r swap move pad r> r> + ;

: libs  s" /usr/local/share/gforth/0.7.3/" ;
: ulibs s" /home/tc/usr/cfg/4th/src/" ;
: incl  name included ;
: lib"  libs name str+ included ; : libs? cr s" ls " libs str+ system ;
: ulib" ulibs name str+ included ; : ulibs? cr s" ls " ulibs str+ system ;
: libv  s" e `fd . " libs str+ s"  " str+ ulibs str+ s" |fzf`" str+ system ;

\ ulib" system.4th
\ ulib" fblocks.4th
