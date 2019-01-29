# Copyright 2019.
from strformat import fmt
from strutils import repeat,join
from algorithm import reversed
import terminal

let
  i_arr1: array[0 .. 5, int] = [1,2,3,4,5,6]
  i_arr2: array[6, int] = [7,8,9,10,11,12]

echo i_arr1
echo i_arr2

# Normal arrays

let
  i_arr: array[6 .. 11, int] = [1,2,3,4,5,6]
echo "min_index = ", low(i_arr),
     ", max_index = ", high(i_arr),
     ", i_arr = ", i_arr,
     ", length= ", len(i_arr)

# Typed arrays
type
  IntArray = array[6 .. 11, int]
let
  i_arr3: IntArray=[1,2,3,4,5,6]

echo "min_index =", low(i_arr3),
     ", max_index =", high(i_arr3),
     ", i_arr3 =",i_arr3,
     ", length =", len(i_arr3)

# inferred array types
let
  arr1 = [1.0, 2,3,4]
  arr2 = ['a','c','d']
  arr3 = ["a", "bc", "def", "ghi", "klmno"]
echo fmt"arr1 is of type {$type(arr1)} with value {arr1}"
echo fmt"arr2 is of type {$type(arr2)} with value {arr2}"
echo fmt"arr3 is of type {$type(arr3)} with value {arr3}"

let
  i_arry: array[6 .. 11, int] = [1, 2, 3, 4, 5, 6]
echo "min_index = ",low(i_arry),"max_index = ",high(i_arry)


# arrays with enum as length
echo "“enum-length arrays” can serve as “dictionaries” to provide a one-to-one translation from each enum value to something else."
echo "https://scripter.co/notes/nim#enum-length-arrays"
type
  Foo = enum
    oneHundred
    twoHundred
    threeHundred
proc dict(f:Foo) =
  const
    fooInt: array[Foo,int] = [100,200,300]
    fooString: array[Foo,string] =  ["one hundered", "two hundred","three hundred"]
  echo fooInt[f], " ", fooString[f]


dict(twoHundred)

#[
  https://scripter.co/notes/nim#enum-length-arrays
type
  Foo2 = enum
    oneHundred2
    twoHundred2
    threeHundred2

proc dict(f:Foo2) =
  const
      fooInt2: array[Foo2,int] = [100,200]
  echo fooInt2[f]
]#
styledEcho styleBright, fgRed,"“enum-length arrays” can serve as “dictionaries ",
                              "to provide a one-to-one translation from each ",
                              "enum value to something else."

echo """
type
  PartsOfSpeech = enum
    speechPronoun, speechVerb, speechArticle,
    speechAdjection, speechNoun, speechAdverb
let partOfSpeechExamples: array[PartsOfSpeech, string] = [
  "he","reads","the","green","book","slowly"
]
echo partOfSpeechExamples
"""

type
  PartsOfSpeech = enum
    speechPronoun, speechVerb, speechArticle,
    speechAdjection, speechNoun, speechAdverb
let partOfSpeechExamples: array[PartsOfSpeech, string] = [
  "he","reads","the","green","book","slowly"
]
echo partOfSpeechExamples

echo ""
echo "#Sequences -- @[1,2,3,4]"
echo '-'.repeat(40)

styledEcho styleBright,
  fgRed,
  "* Sequences are similar to arrays but of",
  "dynamic length which may change during",
  "runtime (like strings).\n",

  "* In the sequence constructor @[1, 2, 3],",
  "  the [] portion is actually the array constructor,",
  "  and @ is the array to sequence operator.\n",

  "* the sequence type does not need to be",
  "specified if it is directly assigned a value"

echo """
let
  i_seq1:seq[int] = @[1,2,3,4,5,6]
  i_seq2 = @[7,8,9]

echo fmt"i_seq1 is of type {$type(i_seq1)} with value {i_seq1}"
echo fmt"i_seq2 is of type {$type(i_seq2)} with value {i_seq2}"
"""

let
  i_seq1:seq[int] = @[1,2,3,4,5,6]
  i_seq2 = @[7,8,9]

echo fmt"i_seq1 is of type {$type(i_seq1)} with value {i_seq1}"
echo fmt"i_seq2 is of type {$type(i_seq2)} with value {i_seq2}"

echo ""
echo "Sequence - features:"
echo '-'.repeat(40)

styledEcho styleBright,
  fgRed,
  " * append elements to a sequence with the add() proc or the & operator.\n",
  " * pop() can be used to remove (and get) the last element of a sequence.\n",
  " * high() returns the upper bound of a sequence.\n",
  " * low() also works for a sequence, but it will always return 0.\n",
  " * len() returns the sequence length.\n"

var
  i_secv:seq[int] = @[1,2,3,4,5,6,70]
echo fmt"i_secv is of type {$type(i_secv)} with value {i_secv}"
echo fmt"i_secv = {i_secv}, length is: {i_secv.len}, last element is: {i_secv[i_secv.high]}"
styledEcho styleBright,
  fgYellow,
  "Adding 100 to the sequence! \n",
  "i_secv.add(100)"
i_secv.add(100)
echo fmt"i_secv = {i_secv}, length is: {i_secv.len}, last element is: {i_secv[i_secv.high]}"
styledEcho styleBright,
  fgYellow,
  "Adding 200 to the sequnece using '&'! \n",
  "i_secv = i_secv & 200"
i_secv = i_secv & 200
echo fmt"i_secv = {i_secv}, length is: {i_secv.len}, last element is: {i_secv[i_secv.high]}"
styledEcho styleBright,
  fgYellow,
  "Popping the last sequence element using pop() ... \n",
  "let poppedElement = i_secv.pop"
let poppedElement = i_secv.pop
echo fmt" Popped element = {poppedElement}"
echo fmt" i_secv = {i_secv}, length is: {i_secv.len}, last element is: {i_secv[i_secv.high]}"

echo ""
echo "Sequence - reversing:"
echo '-'.repeat(40)


styledEcho styleBright,
  fgRed,
  " * Reversed proc from the stdlib algorithm. \n",
  " * It takes in arrays, sequences and strings, but always returns sequences.\n"
echo """

echo reversed([1,2,3,4,5])
echo reversed(@[1,2,3,4,5])
echo reversed("abcdef")
"""
echo reversed([1,2,3,4,5])
echo reversed(@[1,2,3,4,5])
echo reversed("abcdef")

styledEcho styleBright,
  fgRed,
  " * reversed on a string returs individual chars reversed \n",
  " * If you want a reversed string, just join those chars again.\n"
echo """
echo reversed("abcedf").join("")
"""
echo reversed("abcedf").join("")

echo ""
echo "Open arrays - "
echo '-'.repeat(40)

styledEcho styleBright,
  fgRed,
  " * Open array types are like dynamic arrays, and need to be\n",
  "specified with only the type of the elements that the array is going to contain.\n",
  " * This array type can be used only for parameters in procedures.\n",
  " * Built-in proc high() returns the upper bound of an open array too.\n",
  " * low() also works for an open array, but it will always return 0.\n",
  " * len() returns the open array length. \n"

echo """
proc testOpenArray(x: openArray[int]) =
  echo fmt" x = {x} (type: {type(x)}, length = {x.len}, max_index = {x.high})"

let
  someSeq = @[1,2,3]
  someArr = [1,2,3,4,5,6]

echo "Passing a sequence ... "
testOpenArray(someSeq)
echo "Passing an array ... "
testOpenArray(someArr)
"""

proc testOpenArray(x: openArray[int]) =
  echo fmt" x = {x} (type: {type(x)}, length = {x.len}, max_index = {x.high})"

let
  someSeq = @[1,2,3]
  someArr = [1,2,3,4,5,6]

echo "Passing a sequence ... "
testOpenArray(someSeq)
echo "Passing an array ... "
testOpenArray(someArr)

styledEcho styleBright,
  fgRed,
    " * you can have a proc parameter of type openArray[int], and have it\n",
    " accept all of these types – array[5, int], array[1000, int], seq[int].. \n",
    " just that the array|seq|openArray elements need to be of the exact same\n",
    " type.. int in this case."


type
  MyArr = array[3, int]
let
  a3: MyArr = [10,20,30]
  a4  = [10,20,30,40]
echo '-'.repeat(40)
echo """

type
  MyArr = array[3, int]
let
  a3: MyArr = [10,20,30]
  a4  = [10,20,30,40]
"""
echo '-'.repeat(40)
echo """
# Compiler does not allow passing arratys with any other length
proc countMyArr(a: MyArr): int =
  for i in 0 .. a.high:
    result += a[i]
echo "countMyArray (a3) = ", countMyArr(a3)
# countMyArray(a4) # will fail
"""
# Compiler does not allow passing arratys with any other length
proc countMyArr(a: MyArr): int =
  for i in 0 .. a.high:
    result += a[i]
echo "countMyArray (a3) = ", countMyArr(a3)
# countMyArray(a4) # will fail
echo '-'.repeat(40)
echo """
# Compiler does not allow passing arrays with any other length
proc countExplicitArrayType(a: array[3,int]): int =
  for i in 0 .. a.high:
    result += a[i]

echo "countExplicitArrayType (a3) = ", countExplicitArrayType(a3)
# countExplicitArrayType(a4) # will fail
"""
# Compiler does not allow passing arrays with any other length
proc countExplicitArrayType(a: array[3,int]): int =
  for i in 0 .. a.high:
    result += a[i]

echo "countExplicitArrayType (a3) = ", countExplicitArrayType(a3)
# countExplicitArrayType(a4) # will fail
echo '-'.repeat(40)
echo """
# Compiler allows passing arrays with different lengths
proc countOpenArray(a: openArray[int]): int =
  for i in 0 .. a.high:
    result += a[i]
echo "countOpenArray(a3) = ", countOpenArray(a3)
echo "countOpenArray(a4) = ", countOpenArray(a4)
"""
# Compiler allows passing arrays with different lengths
proc countOpenArray(a: openArray[int]): int =
  for i in 0 .. a.high:
    result += a[i]
echo "countOpenArray(a3) = ", countOpenArray(a3)
echo "countOpenArray(a4) = ", countOpenArray(a4)
#[

proc foo(i_oa: openArray[int]) =
    var i_seq: seq[int] = i_oa
    i_seq.add(100)
    echo "input open array: ", i_oa
    echo "that open array modified to a sequence: ", i_seq
#foo(@[10,20,30,40])
]#
#[ proc foo2(i_oa: openArray[int]) =
  var i_seq2: seq[int]
  for i in i_oa: # copying the input openarray to seq element by element
    i_seq2.add(i)
  i_seq2.add(100)
  echo "input open array2: ", i_oa
  echo "that open array2 modified to a sequence: ", i_seq
foo(@[10, 20, 30, 40]) ]#


proc foo3(x: openArray[int]) =
  echo fmt"{x}"
foo3([1, 2, 3])
