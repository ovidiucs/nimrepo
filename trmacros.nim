# Copyright 2019.
import strformat

template optMul{`*`(a, 2)}(a: int): int =
  debugEcho("-> Term Rewriting activated! ")
  a + a

echo fmt"First arg = 3 ({$3.type})"
echo "Calculating 3 * 2:"
echo 3 * 2

let x = 3
echo ""
echo fmt"First arg = x ({$x.type})"
echo "Calcualting x * 2:"
echo x * 2


echo ""
echo fmt"First arg = 2 ({$2.type})"
echo "Calcualting 2 * x:"
echo 2 * x

echo "'c' is char ? ", 'c' is char
echo "'c' is string ? ", 'c' is string
echo "'c' is int ? ", 'c' is int
