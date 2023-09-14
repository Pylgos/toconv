proc to*[T](value: T, _: typedesc[T]): T =
  value

proc to*[T, U: SomeNumber](value: T, _: typedesc[U]): U =
  U(value)

proc to*[T: enum, U: SomeInteger](value: T, _: typedesc[U]): U =
  U(value)

proc to*[T: SomeInteger](value: char, _: typedesc[T]): T =
  T(value)

proc to*[T](value: T, _: typedesc[string]): string =
  $value

proc to*[T, U](value: openArray[T], _: typedesc[seq[U]]): seq[U] =
  result = newSeq[U](value.len)
  for i in 0..<value.len:
    result[i] = value[i].to(U)

proc to*(value: string, _: typedesc[seq[char]]): seq[char] =
  result = newSeq[char](value.len)
  for i in 0..<value.len:
    result[i] = value[i]

proc to*(value: openArray[char], _: string): string =
  result = newStringUninit(value.len)
  for i in 0..<value.len:
    result[i] = value[i]

proc to*(value: string, _: typedesc[seq[byte]]): seq[byte] =
  result = newSeq[byte](value.len)
  for i in 0..<value.len:
    result[i] = value[i]

proc to*(value: openArray[byte], _: string): string =
  result = newStringUninit(value.len)
  for i in 0..<value.len:
    result[i] = char value[i]
