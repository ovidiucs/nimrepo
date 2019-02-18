# Copyright 2019.
## About templates:
## * A template operates on Nim's abstract syntax trees.
## * A template generates procedures.
## * A template is injected into the main scope as is.
## * A tempalte is processed in the semantic pass of the compiler.
## * A template in nim is a simple declarative macro
## * It provides a substitution mechanism that allows you to substitute
##   arguments passed to them in the body of the template.
## * Used to reduce code duplication.
## * Uset to inject variables into the calling scope.
## * Are invoked just as a procedure.
## * Templates are declarative.
## * A template is kind of like a type-safe ``#define``.
## * A template is a simple quasi-quote.
## * Evaluation is done at compile-time.
## * A template is not a proc. return doesn't work as you expect it to.
## * A template is a way to use one function in multiple scenarios.

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
## .. code-block:: Nim
##
##   template `!=` (a,b: untyped): untyped =
##   # this definition exists int the system module
##     not (a == b)
##   # compiler will re-write the asser to assert(not (5 == 6))
##    assert(5 != 6)


template `!=` (a,b: untyped): untyped =
   not (a == b)

assert(5 != 6)
