import terminal 
from strutils import repeat
from strformat import fmt

echo """
* constructor ()
* order is important

"""

echo '-'.repeat(40)

styledEcho fgRed, 
    "Defining tuples anonymously"
echo """

let
    PersonA: (string, int) = ("Peter", 30)
"""
let
    PersonA: (string, int) = ("Peter", 30)

echo PersonA

echo '-'.repeat(40)

styledEcho fgRed, 
    "Defining tuples named fields"
echo """
let
    PersonB: tuple [name:string, age:int] = ("Vinus", 20)

echo PersonB
"""
let
    PersonB: tuple [name:string, age:int] = ("Vinus", 20)

echo PersonB

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
    person1: Person = (name: "Ariel", age: 100)
    person2: Person = ("Mark", 58)

echo person1
echo person2

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
echo compiles(PersonD.name)
echo compiles(PersonD.color)
echo compiles(PersonD.age)