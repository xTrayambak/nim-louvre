import std/[strutils]
import louvre/namespaces

{.push header: "<LCompositor.h>".}
type
  CompositorState* {.importcpp: "Louvre::LCompositor::CompositorState".} = enum
    Uninitialized
    Initializing
    Initialized
    Uninitializing
    Pausing
    Paused
    Resuming

  Compositor* {.importcpp: "Louvre::LCompositor", inheritable.} = object
    version*: Version

func version*(compositor: Compositor): Version {.importcpp: "Louvre::LCompositor::version".}
func state*(compositor: Compositor): CompositorState {.importcpp: "Louvre::LCompositor::state".}

proc start*(compositor: var Compositor): bool {.importcpp: "Louvre::LCompositor::start".}
proc processLoop*(compositor: var Compositor, msTimeout: int32) {.importcpp: "Louvre::LCompositor::processLoop".}
proc initialized*(compositor: var Compositor) {.importcpp: "Louvre::LCompositor::initialized".}

{.pop.}
