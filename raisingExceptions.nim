import strformat
type
    MyError = object of Exception

try:
    raise newException(MyError, "details about what went wrong")
except MyError:
    echo fmt"[Error] {getCurrentException().name}: {getCurrentException().msg}"