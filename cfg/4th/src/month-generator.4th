\ generates a list of integers which digits 
\ represent the year-month format "yyyymm"
\ to be writen to stdout

\ TODO add facilities to set the variables via
\ command line parameters or, perhaps, via "accept" or something

variable len          10 len !
variable mon          199611 mon !
: ?mon   dup 99 > swap 100 mod 1 13 within and ;
: months len @ 0 do mon @ 1+ dup ?mon not if 88 + then mon ! cr mon ? loop ;
months bye
