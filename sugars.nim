# Copyright 2019.
import sugar
import sequtils
import strformat
import bignum

proc int2int(fn: proc(inp: int): int, x: int): int=
  fn(x)
echo int2Int(x => x + 1,2)


let
  a = [1,2,3,4,5]
  b = a.map(x => 2*x)

echo b

let
  str = "nim lang"
  cSeq = lc[c | (c <- str), char]
echo fmt"str of type{$str.type} ={str}"
echo fmt"cSeq of type {cSeq.type} (seq[SEQ_TYPE]) = {cSeq}"

const upper = 61
var bn: array[upper, Rat]

proc bernoulli(n:int): Rat =
  var A: seq[Rat]

  for i in 0 .. n:
    A.add(newRat())

  for i in 0 .. A.high:
    discard A[i].set(1,i+1)
    for j in countDown(i, 1):
      A[j-1] = j*(A[j-1]-A[j])
  return A[0]

for i in 0 .. bn.high:
  bn[i] = bernoulli(i)
  if bn[i].toFloat != 0.0:
    echo fmt"B({i:2}) = {bn[i]:>55}"
