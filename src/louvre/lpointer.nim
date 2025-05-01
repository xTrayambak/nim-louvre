import pkg/louvre/[point, surface, factory_object]

{.push header: "<LPointer.h>".}

type Pointer* {.importcpp: "Louvre::LPointer".} = object of FactoryObject

proc setFocus*(
  p: ptr Pointer, surface: ptr Surface, localPos: Point
) {.importcpp: "Louvre::LPointer::setFocus".}

proc setFocus*(
  p: ptr Pointer, surface: ptr Surface
) {.importcpp: "Louvre::LPointer::setFocus".}

proc focus*(p: Pointer): ptr Surface {.importcpp: "Louvre::LPointer::focus".}

proc setDraggingSurface*(
  p: ptr Pointer, surface: ptr Surface
) {.importcpp: "Louvre::LPointer::setDraggingSurface".}

proc draggingSurface*(
  p: ptr Pointer
): ptr Surface {.importcpp: "Louvre::LPointer::setDraggingSurface".}

proc surfaceAt*(
  p: ptr Pointer, point: Point
): ptr Surface {.importcpp: "Louvre::LPointer::surfaceAt".}

proc enableNaturalScrollingX*(
  p: ptr Pointer, enabled: bool
) {.importcpp: "Louvre::LPointer::enableNaturalScrollingX".}

proc enableNaturalScrollingY*(
  p: ptr Pointer, enabled: bool
) {.importcpp: "Louvre::LPointer::enableNaturalScrollingY".}

proc naturalScrollingXEnabled*(
  p: Pointer
): bool {.importcpp: "Louvre::LPointer::naturalScrollingXEnabled".}

proc naturalScrollingYEnabled*(
  p: Pointer
): bool {.importcpp: "Louvre::LPointer::naturalScrollingYEnabled".}

proc focusChanged*(p: ptr Pointer) {.importcpp: "Louvre::LPointer::focusChanged".}

{.pop.}
