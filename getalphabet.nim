# Copyright 2019.'
import terminal

proc getAlphabet(): string =
  var accm = ""
  for letter in 'a' .. 'z':
    accm.add(letter)
  return accm
stdout.styledWrite(fgRed,
"""
    proc getAlphabet(): string =
      var accm = ""
      for letter in 'a' .. 'z':
        accm.add(letter)
      return accm

    echo getAlphabet()
""")
echo getAlphabet()

stdout.styledWrite(fgGreen,
            """
      The result variable is a special variable that serves
      as an implicit return variable, which exists because the
      control flow semantics of the return statement are rarely needed.
      The result variable is initialized in the standard way,
      as if it was declared with:""")
proc getalphabetx(): string =
  result = ""
  for letter in 'a' .. 'z':
    result.add(letter)

stdout.styledWrite(fgRed,
            """
  proc getalphabetx(): string =
    result = ""
    for letter in 'a' .. 'z':
      result.add(letter)

  echo getAlphabetx()
    """)
echo getAlphabetx()


proc unexpected(): int =
  var result = 4
  result += 5

echo unexpected()
