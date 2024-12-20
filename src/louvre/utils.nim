proc cppNew*[T](x: typedesc[T]): ptr T {.importcpp: "(new '*0#@)", nodecl.}
