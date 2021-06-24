{ alsaLib
, autoPatchelfHook
, fetchurl
, freetype
, glibc
, lib
, libX11
, libXext
, libXi
, libXtst
, makeWrapper
, stdenv
, unzip
, xorg
, zlib
}:

let
  version = "7.7.0";

  distro = "enonic-xp-linux-sdk-${version}";

  url =
    "https://repo.enonic.com/public/com/enonic/xp/enonic-xp-linux-sdk/${version}/${distro}.zip";


in
stdenv.mkDerivation {
  name = distro;
  inherit version;

  src = fetchurl {
    sha256 = "0vdppnch1zfmkmv9y7ywr7l7zp940rnh60zaqv8f4f8jnrnyq5b3";
    inherit url;
  };

  nativeBuildInputs = [ autoPatchelfHook unzip ];

  buildInputs = [
    alsaLib
    freetype
    glibc
    libX11
    libXext
    libXi
    libXtst
    xorg.libXrender
    zlib
    makeWrapper
  ];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -a ${distro}/* $out/
  '';

  meta = with lib; {
    description = "Enonic XP distribution";
    homepage = "https://enonic.com";
    license = licenses.gpl3;
    maintainers = with stdenv.lib.maintainers; [];
    platforms = platforms.linux;
  };

}
