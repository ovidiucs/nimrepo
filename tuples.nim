import terminal
    from strutils import repeat
from strformat import fmt
from typetraits import arity
from os import splitFile

echo """
* constructor ()
* order is important

"""

echo '-'.repeat(40)

styledEcho fgRed,
    "Defining tuples anonymously"
echo """

let
    personA1: (string, int) = ("Peter", 30)
"""
let
    personA1: (string, int) = ("Peter", 30)

echo personA1

echo '-'.repeat(40)

styledEcho fgRed,
    "Defining tuples named fields"
echo """
let
    personB: tuple [name:string, age:int] = ("Vinus", 20)

echo personB
"""
let
    personB: tuple [name:string, age:int] = ("Vinus", 20)

echo personB

echo '-'.repeat(40)

styledEcho fgRed,
    "Defining custom tuple types"
echo """
type
    Person = tuple[name:string, age:int]

let
    person1: Person = (name: "Ariel", age: 100)
    person2: Person = ("Mark", 58)

echo person1
echo person2
"""
type
    Person = tuple[name:string, age:int]

let
    personB1: Person = (name: "Ariel", age: 100)
    personB2: Person = ("Mark", 58)

echo personB1
echo personB2

echo '-'.repeat(40)

styledEcho fgRed,
    "Defining custom tuple types - alternative"
echo """
type
    PersonAlt = tuple
        name: string
        age:  int
let
    person3: PersonAlt = (name: "Darian", age:12)
    person4: PersonAlt = ("Varian",9)

echo person3
echo person4
"""
type
    PersonAlt = tuple
        name: string
        age:  int
let
    person3: PersonAlt = (name: "Darian", age:12)
    person4: PersonAlt = ("Varian",9)

echo person3
echo person4

echo '-'.repeat(40)

styledEcho fgRed,
    "Accessing tuple fields - anonymous"
echo """
let
    pers:(string,int) = ("Plet", 30)

echo fmt"Tuple person of type {$type(pers)} = {pers}"
echo pers[0]
echo pers[1]
"""

let
    pers:(string,int) = ("Plet", 30)

echo fmt"Tuple person of type {$type(pers)} = {pers}"
echo pers[0]
echo pers[1]

echo '-'.repeat(40)

styledEcho fgRed,
    "Accessing tuple fields - named tuple"
echo """

type
    PersonD = tuple
        name: string
        age:  int

let
    persona: PersonD = ("Mark",33)

echo fmt"Tuple Person of type {$type(persona)} = {persona}"
echo persona[0]
echo persona.name
echo persona[1]
echo persona.age
"""
type
    PersonD = tuple
        name: string
        age:  int

let
    persona: PersonD = ("Mark",33)

echo fmt"Tuple Person of type {$type(persona)} = {persona}"
echo persona[0]
echo persona.name
echo persona[1]
echo persona.age
echo '-'.repeat(40)

styledEcho fgRed,
    "Accessing tuple fields - checking fields",
    " compiles. If the argument is a tuple variable with valid field reference, it will return true"
echo """
echo compiles(PersonD.name)
echo compiles(PersonD.color)
echo compiles(PersonD.age)
echo compiles(PersonD[0])

"""
echo compiles(PersonD.name)
echo compiles(PersonD.color)
echo compiles(PersonD.age)
echo compiles(PersonD[0])

echo """
    compiles(Person.age) works, but compiles(Person[0]) doesn’t -
    Person.age returns its type, int, but Person[0] causes compilation failure:
    """
echo """
type
    PersonE = tuple
        name: string
        age: int

echo PersonE[0]
tuples.nim(180, 13) Error: no generic parameters allowed for PersonE
it's the same syntax you'd use for generics
are purely numerical generics possible?
can a type be just a number?
static[T]
echo PersonE.age
int
"""

type
    PersonE = tuple
        name: string
        age: int

echo PersonE.age

echo '-'.repeat(40)

styledEcho fgRed,
    "Anonymous tuples"

let
    aq: (string, int, float) = ("abc",1,2.1)

echo compiles(aq[0])
echo compiles(aq[1])
echo compiles(aq[2])
echo compiles(aq[3])


echo '-'.repeat(40)

styledEcho fgRed,
    "arity from typetraits can be used to get the number of fields in a tuple"
echo """
from typetraits import arity

type
    PersonF = tuple
        name:string
        age:int

let
    p: PersonF = ("Aslan", 30)
    q: (string, int, float) = ("abc", 42, 3.117)
"""
type
    PersonF = tuple
        name:string
        age:int

let
    p: PersonF = ("Aslan", 30)
    q: (string, int, float) = ("abc", 42, 3.117)

echo fmt"Number of fields in p = {p.type.arity}, value = {p}"
echo fmt"Number of fields in q = {q.type.arity}, value = {q}"

echo '-'.repeat(40)

styledEcho fgRed,
    "Generic Tuples"


type
    PersonG[N: static[int]] = tuple
        name:string
        childrenAges: array[N, int]

let
    p0: PersonG[0] = ("Peter", [])
    p1: PersonG[1] = ("Alex",[1])
    p2: PersonG[2] = ("Miron",[1,2])
    p3: PersonG[3] = ("Patron",[1,2,3])

echo p0
echo p1
echo p2
echo p3


echo '-'.repeat(40)

styledEcho fgRed,
    "Tuple unpacking"
echo """
Tuples can be unpacked during variable assignment (and only then!).
This can be handy to assign directly the fields of the tuples to individually named variables.
An example of this is the splitFile proc from the os module which returns the directory,
name and extension of a path at the same time.

For tuple unpacking to work you must use parentheses around the values
you want to assign the unpacking to, otherwise you will be assigning the
same value to all the individual variables!
"""

let
    path = "/usr/local/bin/nim.html"
    (dir, name, ext)  = splitFile(path)
    baddir, baddname, badext = splitFile(path)

echo "dir = ", dir
echo "name = ", name
echo "ext = ", ext
echo "baddir = ", baddir
echo "baddname = ", baddname
echo "badext = ", badext

echo '-'.repeat(40)

styledEcho fgRed,
    "Different named tuple-types are equivalent if they:\n",
    "1. specify fields of the same type, and\n",
    "2. of the same name in the same order.\n"
echo """

type
    PersonH = tuple[name:string, age:int]
var personh:PersonH
personh = (name: "Pieter", age:30)
echo "person: ", personh

var teacher: tuple[name:string, age:int] = ("MarkW",22)
echo "teacher = ", teacher

personh = teacher
echo "person = ", personh
"""


type
    PersonH = tuple[name:string, age:int]
var personh:PersonH
personh = (name: "Pieter", age:30)
echo "person: ", personh

var teacher: tuple[name:string, age:int] = ("MarkW",22)
echo "teacher = ", teacher

personh = teacher
echo "person = ", personh

echo '-'.repeat(40)

styledEcho fgRed,
    "anonymous tuples are considered to be of the same type as named tuples if:\n",
    "they have the same number of fields, and\n",
    "with the same type and order.\n"

type
    PersonI = tuple
        name:string
        age:int

let
    personAnon1 = ("Valsi",23)

var
    personNamed: PersonI
    personAnon2: (string,int)

echo fmt"Tuple personAnon1 of type {type(personAnon1)} = {personAnon1}"

echo "Asigning an anonymous tuple to a named tuple ..."
personNamed = personAnon1
echo fmt"Tuple personNamed of type {type(personNamed)} = {personNamed}"

echo "Asigning a named tuple to an anonymous tuple"
personAnon2 = personNamed
echo fmt"Tuple personAnon2 of type {$type(personAnon2)} = {personAnon2}"


echo '-'.repeat(40)

styledEcho fgRed,
    "Tuple Comparison"

let
    nimVersionT = (major: NimMajor, minor: NimMinor, patch: NimPatch)
echo nimVersionT

assert (0,18,0) < nimVersionT
assert (0,19,9) == nimVersionT
assert (1,0,0) > nimVersionT



