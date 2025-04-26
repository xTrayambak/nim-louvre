import std/logging
import pkg/cppstl/std_vector
import louvre/surface

{.push header: "<LSurfaceView.h>".}

type SurfaceView* {.importcpp: "Louvre::LSurfaceView".} = object

proc `=copy`*(
  dest: var SurfaceView, src: SurfaceView
) {.error: "SurfaceView type forbids copying".}

proc getSurface*(
  view: SurfaceView
): ptr Surface {.importcpp: "Louvre::LSurfaceView::surface".}

proc getViews*(surf: Surface): CppVector[ptr SurfaceView]

{.pop.}
