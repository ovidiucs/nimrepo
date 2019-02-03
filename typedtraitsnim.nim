# Copyright 2019.
import typetraits
import terminal

styledEcho fgRed,
  "mainly defines the name proc which",
  "is used to get the string name of any type.",
  "It also defines $ aliased to name."


var x = 5
var y = "foo"

# using regular proc call style
echo name(x.type), " x = ", x
echo name(y.type), " y = ", y

#Using UFCS
echo x.type.name, " x = ", x
echo y.type.name, " y = ", y

# Using $
echo $x.type, " x = ", x
echo $y.type, " y = ", y
