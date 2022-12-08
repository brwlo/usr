#!/bin/bash
# use: do2.sh 50 25 2 50
# args:
#      ($1,$2) => coords. for top of triangle
#			 $3      => radius of curve
#      $4			 => side of triangle

x=$1 y=$2 r=$3 L=$4
k='71/(41*3)'
l=`, "2*$k*$r"|bc`
m=`, "$l/2"|bc`

bx () { , "$ax+$m"|bc; }
by () { , "$ay-$r"|bc; }
cx () { , "$ax+$l"|bc; }
cy () { , "$ay"   |bc; }

# top
ax=`, "$x-$m"|bc`
ay=`, "$y+$r"|bc`
t="<path class=corner d=\"M $ax $ay Q `bx` `by` `cx` `cy` \" />"
rt0="L `cx` `cy`"
te="M $ax $ay "
, $t

# left
ax=`, "$x-$L/2" |bc`
ay=`, "$y+$L*$k"|bc`
e="<path class=corner d=\"M `bx` `by` Q $ax $ay `cx` `cy` \" />"
te+="L `bx` `by`"
te="<path class=triang d=\"$te\" />"
er="M `cx` `cy` "
, $e; , $te

# right
ax=`, "$x+$L/2" |bc`
ay=`, "$y+$L*$k"|bc`
by=`by`
r="<path class=corner d=\"M $ax $ay Q `cx` `cy` `bx` `by` \" />"
er+="L $ax $ay"; er="<path class=triang d=\"$er\" />"
rt="<path class=triang d=\"M `bx` $by $rt0\" />"
, $r; , $er; , $rt
