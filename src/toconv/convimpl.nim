{.experimental: "inferGenericTypes".}

template conv*(value: untyped): untyped =
  block:
    template convImpl[T](a: auto): T =
      mixin to
      to(a, T)
    convImpl(value)
