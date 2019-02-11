# Generics are Nim's means to parametrize procs
# Type safe containers. 

proc `+`(a,b: string): string =
    a & b

proc `*`[T](a: T, b: int): T =
    result = ""
    for i in 0 .. b-1:
        result = result + a

echo("a" * 10)