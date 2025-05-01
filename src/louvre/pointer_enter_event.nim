import pkg/louvre/[point, pointer_event]

{.push header: "<LPointerEnterEvent.h".}
type PointerEnterEvent* {.importcpp: "Louvre::LPointerEnterEvent".} = object
  localPos*: Point

{.pop.}
