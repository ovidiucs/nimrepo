## About generics:
## * Generics are Nim's means to parametrize procs (aka parametric polymorphism or templates in D)
## * Type safe containers. Types that aren't known until the algoritms are invoked.
## * Generics are checked when you instantiate them mostly.
## * Generics are duck typed and very macro like.
## * Generics are obeying module scope.
## * Generics are a type based macro system on top of another macro system.
## * Generics are some what similar to c++ templates
## * Generics are typechecked after expansion.
## * Generics are checked at instantiation time
## * Generics are a way to create code that works on a range of type.
## * The usage of T within the generic function is what defines the typeclass so to speak.
## * in general generics are just something like type "variables" : e.g. proc reprT (value: T):
##   string makes something with value for every possible T type

proc `+`(a,b: string): string =
    a & b

proc `*`[T](a: T, b: int): T =
    result = ""
    for i in 0 .. b-1:
        result = result + a

echo("a" * 10)

echo ("10" + "10")
