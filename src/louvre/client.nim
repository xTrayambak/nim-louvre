import std/[posix]
import pkg/louvre/event

{.push header: "<LClient.h>".}
type
  Client* {.importcpp: "Louvre::LClient".} = object

proc `=copy`*(dest: var Client, src: Client) {.error.}

proc getCredentials*(client: Client, pid: ptr Pid = nil, uid: ptr Uid = nil, gid: ptr Gid = nil) {.importcpp: "Louvre::LClient::credentials".}
proc ping*(client: ptr Client, serial: uint32): bool {.importcpp: "Louvre::LClient::ping".}
proc pong*(client: ptr Client, serial: uint32) {.importcpp: "Louvre::LClient::pong".}
proc flush*(client: ptr Client) {.importcpp: "Louvre::LClient::flush".}
proc destroyLater*(client: ptr Client) {.importcpp: "Louvre::LClient::destroyLater".}
proc findEventBySerial*(client: ptr Client, serial: uint32): ptr Event {.importcpp: "Louvre::LClient::findEventBySerial".}

{.pop.}
