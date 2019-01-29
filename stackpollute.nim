import random, math

proc pollutestack()=
  var
    c:char = (rand(high(char).int)).char
    i32: int32 = (rand(high(int32).int)).int32
    i64: int64 = (rand(high(int64).int)).int64
    f32: float32 = (rand(high(int64).int)).float32
    f64: float64 = (rand(high(int64).int)).float64
    b: bool = rand(1).bool
