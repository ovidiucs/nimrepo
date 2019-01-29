# Copyright 2019.
echo "Mutable (var)"


var
    a = "foo"
    b = 0
    c: int

echo a
echo b
echo c

a.add("baz")
b += 1
c += 3


echo a
echo b
echo c
let
    d = "foo"
    e = 5
    f:float = 1

echo d,e,f
