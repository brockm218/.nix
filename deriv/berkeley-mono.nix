{
  stdenvNoCC,
  lib,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "berkeley-mono";
  version = "0.0.1";
  src = ./berkeley-mono;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "Berkeley Mono";
    homepage = "https://usgraphics.com/products/berkeley-mono/";
    platforms = platforms.all;
  };
}
