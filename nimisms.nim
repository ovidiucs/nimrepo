# Copyright 2019.
#var a {.noInit.}: array [0 .. 1023, char] // not working
var a {.noInit.}: array[0 .. 1023, char]

# not ok
#const size = 6
#type A = range[0 ..< size]

#nim_src_bshJJ4.nim(5, 10) Error: range types need to be constructed with '..', '..<' is not supported

const size = 6
type A = range[0 .. (size-1)]

echo "Union ... ", {'a' .. 'd'} + {'e' .. 'h'} 
echo "Intersection ... ", {'a' .. 'd'} * {'c' .. 'z'}
echo "Difference ... ", {'a' .. 'h'}
echo "Equal: ", {'a' .. 'c'} == {'a' .. 'c'}
echo "Subset or Equal: ", {'a' .. 'c'} <= {'a' .. 'v'}
