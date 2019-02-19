# Copyright 2019.
# imports
from os import sleep

## About templates:
## * A template operates on Nim's abstract syntax trees.
## * A template generates procedures.
## * A template can accept multiple parameters such as variables or type names.
## * A template however will inject its content at the place where you call it as if you copy pasted its content there.
## * A tempalte is processed in the semantic pass of the compiler.
## * A template in nim is a simple declarative macro
## * It provides a substitution mechanism that allows you to substitute
##   arguments passed to them in the body of the template.
## * Used to reduce code duplication.
## * Used to inject variables into the calling scope.
## * Are invoked just as a procedure.
## * Templates are declarative.
## * A template is kind of like a type-safe ``#define``.
## * A template is a simple quasi-quote.
## * Evaluation is done at compile-time.
## * A template is not a proc. return doesn't work as you expect it to.
## * A template is a way to use one function in multiple scenarios.
## * Document precisely the variables that are injected by the template.


## Example:
##
## .. code-block:: Nim
##  template foo(body: untyped) =
##   body
##
##  foo():
##   echo "Bla"
##   echo "Blo"

## Outputs:
##
## .. code-block:: Nim
##   Bla
##   Blo
template foo(body: untyped) =
  body

foo():
  echo "Bla"
  echo "Blo"
## Another example:

## .. code-block:: Nim
##
##   template `!=` (a,b: untyped): untyped =
##   # this definition exists int the system module
##     not (a == b)
##   # compiler will re-write the asser to assert(not (5 == 6))
##    assert(5 != 6)


template `!=` (a,b: untyped): untyped =
   not (a == b)

doAssert(5 != 6)

## Details about types:
##
## An ``untyped`` parameter => symbol lookups and type resolution
## is not performed before the expression is passed to the template. It has not type yet.
## A template where every parameter is untyped is called an ``immediate`` template.
##
## A ``typed`` template argument allows an identifier that has been declared, or a value
## that has a type to be specified. The ``typed`` type allows you to specify  concrete types
## like ``int``, ``float`` and ``string``
##
## Another example with argument passed to the template.
##
template repeatAgain(count: int, statements: untyped) =
  for i in 0 ..< count:
    statements

repeatAgain 5:
  echo("Hello Templates!")
  sleep(389)

## Parameter substitution in templates:
##
## .. code-block:: Nim
##   template declareVar(varName: untyped, value: typed) =
##     var varName = value
##
##   declareVar(bar, 42)
##   echo(bar)
##
template declareVar(varName: untyped, value: typed) =
  var varName = value

declareVar(bar, 42)
echo(bar)


## Variable injection in templates and template hygiene.
## In general, injecting variables is considered bad style.
##
## .. code-block:: Nim
##
##   template hygiene(varName: untyped) =
##     var varName = 42
##     var notInjected = 128
##     var injected {.inject.} = notInjected + 2
##
##   hygiene(implicit)
##   doAssert(implicit == 42)
##   doAssert(injected == 130)
##   # doAssert(notInjected == 128)
##

template hygiene(varName: untyped) =
  var varName = 42
  var notInjected = 128
  var injected {.inject.} = notInjected + 2

hygiene(implicit)
doAssert(implicit == 42)
doAssert(injected == 130)
# doAssert(notInjected == 128)

## Another example of one or more code statements passed to a template. Note the lack of ``()``
## when calling the template.
##
## .. code-block:: Nim
##
##   template repeat (statements: untyped) =
##   while true:
##     statements
##
##   repeat:
##     echo("Whoaa!")
##     sleep(1000)
##
template repeat (statements: untyped) =
  while true:
    statements

#repeat:
#  echo("Whoaa!")
#  sleep(1000)

## Tenplate with macros
template repeatM(n: static[Natural], body: untyped): untyped =
  for _ in 0 ..< n:
    body

repeatM(4):
  echo "Hi"
  sleep(505)


