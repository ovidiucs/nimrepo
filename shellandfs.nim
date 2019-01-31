import terminal #isatty, styledEcho
import strformat #fmt, 
import times

if isatty(stdout): # ./stdout_to_file
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