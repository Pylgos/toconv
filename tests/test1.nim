# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import std/unittest
import toconv

{.experimental: "inferGenericTypes".}

test "number conversion":
  check 1'f32.to(float64) == 1'f64
  check 1'i32.to(int64) == 1'i64
  check 1'u32.to(uint64) == 1'u64
  check 1'f64.to(int32) == 1'i32

test "sequence conversion":
  let intSeq = @[1, 2, 3, 4, 5]
  let floatSeq = @[1'f64, 2, 3, 4, 5]
  check intSeq.to(seq[float64]) == floatSeq

test "array conversion":
  let intArr = [1, 2, 3, 4, 5]
  let floatArr = [1'f64, 2, 3, 4, 5]
  check intArr.to(array[5, float64]) == floatArr

test "convert to itself":
  check (1, 2, 3).to((int, int, int)) == (1, 2, 3)
  check 1'f32.to(float32) == 1'f32

import fixtures/m1

test "conv":
  let x: int64 = 1
  let y: float64 = conv x
  gnrc(string)
