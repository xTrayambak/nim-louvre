## GPU Information
##
## This class typically contains information about a DRM node, however, its properties
## could have different meanings when using virtualized backends.
##
## To see all available devices, use `func getGpus(seat: var Seat): seq[ptr GPU]`_. For a particular output, use `func gpu(output: Output): ptr GPU`_.

import std/posix
import pkg/cppstl/std_string

{.push header: "<LGPU.h>".}

type GPU* {.importcpp: "Louvre::LGPU".} = object

func name(gpu: GPU): CppString {.importcpp: "Louvre::LGPU::name".}
func getDevice*(gpu: GPU): Dev {.importcpp: "Louvre::LGPU::dev".}
func getId*(gpu: GPU): int {.importcpp: "Louvre::LGPU::id".}
proc getFd*(gpu: GPU): cint {.importcpp: "Louvre::LGPU::fd".}
proc getReadOnlyFd*(gpu: GPU): cint {.importcpp: "Louvre::LGPU::roFd".}

{.pop.}

proc getName*(gpu: GPU): string {.inline.} =
  gpu.name().toString()
