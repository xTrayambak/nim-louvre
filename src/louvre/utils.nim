proc cppNew*[T](x: typedesc[T], params: pointer): ptr T {.importcpp: "new '1(@)", nodecl.}
