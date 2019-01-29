import terminal

assert NimVersion is string
echo "NimVersion is: " & NimVersion
assert NimMajor is int
echo $NimMajor & " is the NimMajor"
assert NimMinor is int
echo $NimMinor & " is the NimMinor"
assert NimPatch is int
echo $NimPatch & " is the NimPatch"

echo ("Hello world!")
echo "Hello world!"

echo $100 & "abc" & $2.4

styledEcho "styledEcho unstyled text", styleBright, fgGreen,
  " styleBright, fgGreen [PASS]",
  resetStyle, fgGreen, " resetStyle, fgGreen, Yay!"

styledEcho "styledEcho unstyled text", styleBright, fgRed,
  " styleBright, fgRed,  [FAIL]",
  resetStyle, fgRed, " resetStyle, fgRed,   Nay!"

stdout.styledWrite(fgRed,
    "stdout.styledWrite(fgRed,\"Red Text\" - no new line ")
stdout.styledWrite(fgGreen, "same as above but Green Text ")
echo ""
echo "ForeGroundcolor - globally - setForeGroundColor(fgGreen)"
setForeGroundColor(fgGreen)
echo "Green Text"
echo "Some more green text"
setBackgroundColor(bgRed)

echo "after setBackgroundColor(bgRed)"

resetAttributes()

echo "after resetAttributes() - Line 1"
echo "Line 2"
echo "Line 3"

stdout.styledWrite(fgGreen, bgRed,
    "stdout.styledWrite(fgGreen, bgRed, with \"\\n\"\n")

stderr.writeLine "Error!"
echo"To send messages to stderr that don’t end in newlines, use stderr.write instead."
stderr.write "Error1"
stderr.write "Error2"
echo "\n"

proc isTriangle(s: openArray[int]): bool =
  return (s.len == 3) and
    (s[0] <= s[1] + s[2]) and
    (s[1] <= s[2] + s[0]) and
    (s[2] <= s[0] + s[1]) and
    (s[0] > 0) and
    (s[1] > 0) and
    (s[2] > 0)




echo """
Asta merge:
proc isTriangle(s: openArray[int]): bool =
  return (s.len == 3) and
    (s[0] <= s[1] + s[2]) and
    (s[1] <= s[2] + s[0]) and
    (s[2] <= s[0] + s[1]) and
    (s[0] > 0) and
    (s[1] > 0) and
    (s[2] > 0)

    echo isTriangle([3, 3, 3])

Asta nu merge:
  stuff.nim(54, 5) Error: invalid indentation
proc isTriangle(s: openArray[int]): bool =
  return (s.len == 3)
    and (s[0] <= s[1] + s[2])
    and (s[1] <= s[2] + s[0])
    and (s[2] <= s[0] + s[1])
    and (s[0] > 0)
    and (s[1] > 0)
    and (s[2] > 0)

    echo isTriangle([3, 3, 3])
"""

echo isTriangle([3, 3, 3])

# Template

template foo(body): untyped =
  body

foo(): #special colon
  echo "hello"
  echo "world"
echo " assign the correct return type for the foo template:"
echo """
template foo2(): array =
  [1, 1]
echo foo2
"""
template foo2(): array =
  [1, 1]
echo foo2

echo "Or set it to untyped so that the template replacement is done before any semantic checking or type resolution."
echo """
template foo3(): untyped =
  [1, 2]
echo foo3
"""
template foo3(): untyped =
  [1, 2]
echo foo3
