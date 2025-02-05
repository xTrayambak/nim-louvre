## Sloppy re-implementation of <LOpenGL.h>

import std/[os, logging, options]
import pkg/opengl

{.emit: "#include <LOpenGL.h>".}
{.emit: "#include <GLES2/gl2.h>".}

type
  ShaderCompilationFailure* = object of Defect

proc openShader*(file: string): Option[string] {.sideEffect.} =
  ## I'm too lazy to bind the `Louvre::LOpenGL::openShader` function so I just
  ## implemented it myself.
  ##
  ## Returns an `Option[T]` containing the contents of a file if it exists,
  ## otherwise it returns an empty `Option[T]`.

  if not fileExists(file):
    error "opengl: error whilst opening shader file: " & file
    return none(string)

  readFile(file).some()

proc compileFragmentShader*(source: string): GLuint {.sideEffect.} =
  ## Compile a fragment shader
  info "opengl: compiling fragment shader (" & $source.len & " bytes)"
  let srcCstr {.used.} = source.cstring
  {.emit: "`return Louvre::LOpenGL::compileShader(GL_FRAGMENT_SHADER, `srcCstr`);".}

proc compileVertexShader*(source: string): GLuint {.sideEffect.} =
  ## Compile a vertex shader
  info "opengl: compiling vertex shader (" & $source.len & " bytes)"
  let srcCstr {.used.} = source.cstring
  {.emit: "return Louvre::LOpenGL::compileShader(GL_VERTEX_SHADER, `srcCstr`);".}
