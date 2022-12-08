( editor etc. )
\ s" /home/bw/u/c/forth/gforth/bwconfig.f" included
cc warnings off
: empty     s" ---marker--- marker ---marker---" evaluate ;
: edit      s" e --cmd 'se ft=4th' main.4th" system ;
: run       s" main.4th" included ;
: ecr       edit run ;
: ..        ecr ;
marker ---marker---
