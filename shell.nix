with import <nixpkgs> { };

mkShell {
  nativeBuildInputs = [
    pkg-config
    louvre
    wayland
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath [
    louvre
  ];
}
