import louvre/[gpu, output, factory_object]
import pkg/cppstl/std_vector

{.push header: "<LSeat.h>".}

type
  Seat* {.importcpp: "Louvre::LSeat", inheritable.} = object of FactoryObject

func gpus(seat: var Seat): CppVector[ptr GPU] {.importcpp: "Louvre::LSeat::gpus".}
func outputs(seat: var Seat): CppVector[ptr Output] {.importcpp: "Louvre::LSeat::outputs".}
func name(seat: var Seat): cstring {.importcpp: "Louvre::LSeat::name".}
proc makeSeat*(params: pointer): Seat {.importcpp: "Louvre::LSeat::LSeat(#)", constructor.}

proc outputPlugged*(seat: ptr Seat, output: ptr Output) {.importcpp: "Louvre::LSeat::outputPlugged".}

{.pop.}

func getGpus*(seat: var Seat): seq[ptr GPU] {.inline.} =
  seat
    .gpus()
    .toSeq()

func getName*(seat: var Seat): string {.inline.} =
  $seat.name()

func getOutputs*(seat: var Seat): seq[ptr Output] {.inline.} =
  seat
    .outputs()
    .toSeq()
