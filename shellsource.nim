# Copyright 2019.
import os
import terminal


styledEcho fgRed,
  "Use putEnv to set environment variable\n",
  "Use getEnv to get environment variable"

echo """
let
  envVar = "NIM_TEMP"
  envVarVal = "foo"
putEnv(envVar, envVarVal)
echo getEnv(envVar)
"""
let
  envVar = "NIM_TEMP"
  envVarVal = "foo"
putEnv(envVar, envVarVal)
echo getEnv(envVar)
