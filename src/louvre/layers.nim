## Surface layers.
##
## This enum represents possible layers for a surface, indicating its position in the Z-axis stacking order.

{.push header: "<LLayout.h>".}

type SurfaceLayer* {.importc: "Louvre::LSurfaceLayer", pure.} = enum
  Background = 0
  Bottom = 1
  Middle = 2
  Top = 3
  Overlay = 4

{.pop.}
