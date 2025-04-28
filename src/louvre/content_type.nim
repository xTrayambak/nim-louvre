## Content Type Hint.
##
## Hint indicating the type of content being displayed by an LSurface or LOutput.

{.push header: "<LContentType.h>".}
type
  ContentType* {.pure, importc: "Louvre::LContentType".} = enum
    None = 0           ## The content doesn't fit into one of the other categories.
    Photo = 1          ## Digital still pictures that may be presented with minimal processing.
    Video = 2          ## Video or animation that may be presented with more accurate timing to avoid stutter.
                       ## Where scaling is needed, scaling methods more appropriate for video may be used.
    Game = 3           ## A running game. Its content may be presented with reduced latency.
{.pop.}
