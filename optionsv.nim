# Copyright 2019.
import options, strformat

var s: Option[float]

s = some(123.0)
echo s
echo fmt"Is s None ? {s.isNone()}, is a Some {s.isSome()}"

s = some[float](1)
echo s
echo fmt"Is s None ? {s.isNone()}, is a Some {s.isSome()}"

s = none(float)
echo s
echo fmt"Is s None ? {s.isNone()}, is a Some {s.isSome()}"
s = none[float]()
echo s
echo fmt"Is s None ? {s.isNone()}, is a Some {s.isSome()}"
