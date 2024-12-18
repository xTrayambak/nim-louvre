import std/os
import louvre
import cppstl/std_smartptrs

type
  TrayWM = object of Compositor

proc initialized(compositor: ptr TrayWM) {.virtual.} =
  echo "Hello, trayWM"
  initialized(cast[ptr Compositor](compositor)[])

proc main =
  putEnv("LOUVRE_WAYLAND_DISPLAY", "wayland-2")
  var compositor = makeUnique(TrayWM)
  echo "Using Louvre " & $compositor.version()

  if not compositor.start():
    echo "woops compositor died :("
    quit(1)

  while compositor.state() != CompositorState.Uninitialized:
    compositor.processLoop(-1)

  echo "bye bye!"

when isMainModule:
  main()
