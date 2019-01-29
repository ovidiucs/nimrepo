# Copyright 2019.
import terminal
from strutils import repeat
#---

#import re
import regex

echo '-'.repeat(40)

styledEcho fgRed,
    "Regular expressions"
echo """
1. use 're' stdlib
* PCRE syntax is used when using this library
* man pcresyntax
2. use 'nim-regex' (nimble install regex)
* https://nitely.github.io/nim-regex/
"""
echo """
import re or import regex

let
  text =  " " " Mary had a little lamb." " "
  rgx = re"(?i)mary"

echo text.replace(rgx, "Mama lamb")
"""
let
  text = """Mary had a little lamb."""
  rgx = re"(?i)mary"

echo text.replace(rgx, "Mama lamb")

