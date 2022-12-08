\ combinations (not yet understood)
\ http://forth.org/forth_intro/colon2.htm#Return
\ algorithm:
\   r=0 => C(n,r) = 1
\   r>0 => C(n,r) = C(n,r-1)C(n-r+1)/r

: comb recursive dup if 2dup 1- ~c -rot tuck - 1+ swap */ else 2drop 1 then ;
