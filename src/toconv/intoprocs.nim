{.experimental: "inferGenericTypes".}
import toprocs

proc into*[T](value: auto): T =
  value.to(T)
