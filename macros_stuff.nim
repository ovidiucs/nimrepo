# Copyright 2019.

## About macros:
## * more advanced then templates.
## * macros is procedural (it describes how code should be produced at compile time)
## * templates are declarative (the produced code that should be put in the calling scope is written)
import macros

dumpTree:
  for i in 0 .. 10:
    echo 'a'$i

dumpTree:
  echo ("10" + "10")
