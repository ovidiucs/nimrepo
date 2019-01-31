import terminal #isatty, styledEcho
import strformat #fmt, 
import strutils
import times
import random 
import os

#[if isatty(stdout): # ./stdout_to_file
  echo "This is output to the terminal."
else:              # ./stdout_to_file | cat
  const
    logFileName = "log.txt"
  let
    # https://github.com/jasonrbriggs/nimwhistle/blob/183c19556d6f11013959d17dfafd43486e1109e5/tests/cgitests.nim#L15
    logFile = open(logFileName, fmWrite)
  stdout = logFile
  echo fmt"This is output to the {logFileName} file."
  echo fmt"- Run using nim {NimVersion} on {now()}."
  ]#
echo '-'.repeat(40)

styledEcho fgRed,
    "Environment Variables #\n",
    "Use putEnv to set environment variable\n",
    "Use getEnv to get environment variable\n"
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

proc findNimStdLib*(): string =
  try:
    let nimexe = os.findExe("nim")
    if nimexe.len == 0: return ""
    result = nimexe.splitPath()[0]/../ "lib"
    if not fileExists(result / "system.nim"):
      when defined(unix):
        result = nimexe.expandSymlink.splitPath()[0] /../"lib"
        if not fileExists(result /"system.nim"): return ""
  except OSError, ValueError:
        return ""

echo findNimStdLib()

echo '-'.repeat(40)

styledEcho fgRed,
    "File base name"

let
  filePath = "/a/path/to/test.org"
var
  (dir, basename, ext) = splitFile(filePath)
echo "dir = ", dir
echo "basename = ", basename
echo "ext = ", ext


echo '-'.repeat(40)

styledEcho fgRed,
    "File handling"

let
  fileName = "testing.txt"
#   fileName = "/tmp/foo/bar/zoo.txt" directory has to exists else ioerror
  dataStr  = "abc"
writeFile(fileName, dataStr)

let
  anotherFile = "a/folder/to/somefile.txt"
  someData = "somestring" 
  (dirv, _, _) = splitFile(anotherFile)
removeDir("a/folder/to/")
echo fmt"{dirv} exists ? {dirExists(dirv)}"
if (not dirExists(dirv)):
  echo fmt"  creating {dirv} .."
  createDir(dirv)
echo fmt"{dirv} exists now ? {dirExists(dirv)}"
writeFile(anotherFile, someData)

echo '-'.repeat(40)

styledEcho fgRed,
    "File handling -  get read file permissions"

let
  filePerm = getFilePermissions(anotherFile)
echo filePerm

proc parseFilePermissions(octals: string): set[FilePermission] = 
  ## Converts the input permissions octal string to a Nim set
  ## for FilePermission type
  var perm: set[FilePermission]
  let
    readPerms  = @[fpUserRead, fpGroupRead, fpOthersRead] 
    writePerms = @[fpUserWrite, fpGroupWrite, fpOthersWrite]
    execPerms  = @[fpUserExec, fpGroupExec, fpOthersExec]
  for idx, o in octals:
    if o != '0':
      if o in {'4', '5', '6', '7'}:
        perm = perm + {readPerms[idx]}
      if o in {'2', '3', '6', '7'}:
        perm = perm + {writePerms[idx]}
      if o in {'1', '3', '5', '7'}:
        perm = perm + {execPerms[idx]}
  result = perm
  
for _ in 0 .. 10:
  let perm = fmt"{rand(7)}{rand(7)}{rand(7)}"
  echo perm, " = ", parseFilePermissions(perm)