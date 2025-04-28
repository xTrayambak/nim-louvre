# nim-louvre
This package provides bindings for [Louvre](https://github.com/CuarzoSoftware/Louvre), a library for writing Wayland compositors.

Currently, this is the only way to write a Wayland compositor with Nim. Louvre is powerful when needed, but it does a lot of hand-holding otherwise. You can get a compositor running in just a few lines of code.

# minimal example
The following code starts a compositor that works.
```nim
import pkg/cppstl/std_smartptrs,
       pkg/louvre

proc main() =
  putEnv("LOUVRE_WAYLAND_DISPLAY", "louvre-display")

  var compositor = makeUnique(Compositor)
  echo "using Louvre " & $compositor.getVersion()

  if not compositor.start():
    echo "the compositor couldn't init :("
    quit(1)

  while compositor.getState() != CompositorState.Uninitialized:
    compositor.processLoop(-1)

  echo "bye bye!"

when isMainModule:
  main()
```

Now, you can just compile this program and run any program by setting the `WAYLAND_DISPLAY` environment variable to `louvre-display` to force it to connect to your test compositor.
