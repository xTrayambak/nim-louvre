import pkg/opengl

{.push header: "<LOpenGL.h>".}

proc compileShader*(
  typ: GLenum, shaderString: cstring
): GLuint {.importc: "Louvre::LOpenGL::compileShader".}

{.pop.}
