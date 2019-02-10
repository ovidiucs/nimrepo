# Copyright 2019.
import parseutils
import terminal

var
  line = "en Nim_(programming_language) 1 70231"

var
  i = 0
  domainCode = ""

i.inc parseUntil(line, domainCode, {' '},i)
i.inc

var pageTitle = ""
i.inc parseUntil(line, pageTitle, {' '}, i)
i.inc

var countViews = 0
i.inc parseInt(line,countViews, i)
i.inc

var totalSize = 0
i.inc parseInt(line, totalSize, i)
i.inc

echo domainCode
echo pageTitle
echo countViews
echo totalSize

doAssert domainCode == "en"
doAssert pageTitle == "Nim_(programming_language)"
doAssert countViews == 1
doAssert totalSize == 70231

styledEcho fgGreen ,
   "Parsed successfully!"
