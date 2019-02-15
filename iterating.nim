
# Iterator have a function that returns multiple values
# sequentially by calling the function repeatedly 

iterator myFirstIterator(): int =
    yield 111
    yield 222
    yield 333

for n in myFirstIterator():
    echo n

iterator repeat[T](x: T): T=
    while true:
        yield x


#for x in repeat("Hello World!"):
#    echo x

iterator countTo(x: int): int =
    for i in 1..x:
        yield i

for n in countTo(3):
    echo n

proc countTo(x: int): iterator: int =
    return iterator :int =
        for i in 1..x:
            yield i

let counter  =  countTo(20)

# able to preserve the sate of counter
# not able to do with inline iterators
# preserve the state of the iterator

for n in counter():
    echo n
    if n == 5:
        break

for n in counter():
    if n mod 2 == 0:
        echo n

# procedure that returns o closure iterator 
proc repeat[T](x:T): iterator :T =
    return iterator: T = 
        while true:
            yield x

# nromal closure, pass it around and we can presve the data sotred iwth it
# use a closure iterator as data 
proc take[T](iter: iterator: T, n:int): iterator: T =
    return iterator: T = 
        var i = 0
        for x in iter():
            if i == n:
                break
            yield x
            i += 1
let threeHello = repeat("HelloWorld").take(3)
    