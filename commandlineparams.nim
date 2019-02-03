# Copyright 2019.
import terminal
import os,strformat

styledEcho fgRed,
  "* paramCount - returrns the number of cmmand line paramters",
  "* commandLineParams - returns the command line paramters",
  "+ import os"

let
  numParams = paramCount()
  params = commandLineParams()

echo "Number of command line params: ", numParams
echo "Command line params: ", params
echo numParams.len

for n in 0 ..< numParams:
  echo fmt"Param {n+1} = {params[n]}"
  echo fmt"{$type(numParams)}"

