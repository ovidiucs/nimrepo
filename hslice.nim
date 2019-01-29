# Copyright 2019.
import strformat
var s1: HSlice[int,char]
s1.a = 4
s1.b = 'f'
echo fmt"s1=`{s1}` is of type {$type(s1)}"

let hs1 = 1 .. 3
echo fmt"hs1=`{hs1}` is of type {$type(hs1)}"
for n in hs1:
  echo n
let
  hs2 = 'k' .. 'm'
echo fmt"hs2=`{hs2}` is of type {$type(hs2)}"
for c in hs2:
  echo c

let str = "abcdefghijk"
echo str[2 .. 4]

let
  hs3 = 1 .. 'z'
  hs4 = 0.99 .. "blah"
echo fmt"hs3=`{hs3}` is of type {$type(hs3)}"
echo fmt"hs4=`{hs4}` is of type {$type(hs4)}"

let
  hs5 = 777 .. 'd' .. "foo"
  hs6 = (777 .. 'd') .. "foo"
  hs7 = 5 .. 6 .. 'x' .. 'y'
  hs8 = ((5 .. 6) .. 'x') .. 'y'

echo fmt"hs5=`{hs5}` is of type {$type(hs5)}"
echo fmt"hs6=`{hs6}` is of type {$type(hs6)}"
echo fmt"hs7=`{hs7}` is of type {$type(hs7)}"
echo fmt"hs8=`{hs8}` is of type {$type(hs8)}"

