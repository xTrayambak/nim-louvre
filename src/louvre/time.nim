{.push header: "<LTime.h>".}
type Time* {.importcpp: "Louvre::LTime".} = object

proc nextSerial*(): uint32 {.importcpp: "Louvre::LTime::nextSerial".}

{.pop.}
