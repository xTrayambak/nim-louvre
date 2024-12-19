import std/os
import louvre
import cppstl/[std_string, std_smartptrs]

{.pragma: immutable, codegenDecl: "const $1 $2".}

type
  NimSeat {.final.} = object of Seat
  NimWM = object of Compositor

proc makeNimSeat(params: pointer): Seat {.importcpp: "`NimSeat`::`NimSeat`(#)", constructor.}

proc outputPlugged(seat: ptr NimSeat, output: ptr Output) {.virtual, member.} =
  echo "output plugged!!!!"
  outputPlugged(cast[ptr Seat](seat), output)

proc initialized(compositor: ptr NimWM) {.virtual, member.} =
  echo "Initialized!"
  
  var comp = cast[ptr Compositor](compositor)
  var seat = comp[].getSeat()
  let name = seat[].getName()
  var outputs = seat[].getOutputs()
  
  echo name

  for output in outputs:
    echo output[].getState()

  initialized(cast[ptr Compositor](compositor))

proc createObjectRequest(compositor: ptr NimWM, objectType: FactoryObjectType, params {.immutable.}: pointer): ptr FactoryObject {.virtual.} =
  if objectType == LSeat:
    echo "create NimSeat"
    var value = makeNimSeat(params)
    var obj = FactoryObject(value)

    return cppNew(NimSeat, params)

  echo "Can't instantiate: " & $objectType
  return nil

proc main =
  putEnv("LOUVRE_WAYLAND_DISPLAY", "wayland-2")
  startLaunchDaemon()

  var compositor = makeUnique(NimWM)
  echo "Using Louvre " & $compositor.getVersion()

  if not compositor.start():
    echo "woops compositor died :("
    quit(1)

  while compositor.getState() != CompositorState.Uninitialized:
    compositor.processLoop(-1)
  
  stopLaunchDaemon()

  echo "bye bye!"

when isMainModule:
  main()
