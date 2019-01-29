import macros

type
  ShapeKind {.pure.} = enum
    Triangle, Rectangle

  Shape = object
    case kind: ShapeKind
    of Triangle:
      aT: int
      bT: int
    of Rectangle:
      aR: int
      bR: int

proc calcArea(s: Shape) =
  discard

proc createNext(c: Nimnode): NimNode =
  let typ = c[0]
  let name = c[1]
  let a = c[2][0][0]
  let aVal = c[2][0][1]
  let b = c[2][1][0]
  let bVal = c[2][1][1]

  case $typ
  of "Triangle":
    a.ident = toNimIdent($a & "T")
    b.ident = toNimIdent($b & "T")
  of "Rectangle":
    a.ident = toNimIdent($a & "R")
    b.ident = toNimIdent($b & "R")
  result = quote do:
    let `name` = Shape(kind: `typ`, `a`: `aVal`, `b`: `bVal`)
    `name`.calcArea()

macro shape(input: untyped): untyped =
  # should produce
    #   let aaa = Shape(kind: Triangle, a:17 , b:23)
    #   aaa.calcArea()
    #   let bbb = Shape(kind: Rectangle, a:5, b:8)
    #   bbb.calcArea()
  result = newStmtList()
  echo input.treeRepr
  for i in 0 ..< input.len:
    let c = input[i]
    case c.kind
    of nnkCommand:
      result.add createNext(c)
    else:
      echo "Needs to be a command"

  echo result.repr

shape:
  Triangle aaa:
    a = 17
    b = 23
  Rectangle bbb:
    a = 5
    b = 8
