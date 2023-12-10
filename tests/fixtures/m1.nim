import toconv

{.experimental: "inferGenericTypes".}

type MyType* = object

proc to(value: int, _: typedesc[MyType]): MyType = discard

proc gnrc*(_: typedesc) =
  let val: MyType = conv int(1)
  discard val

gnrc(int)
