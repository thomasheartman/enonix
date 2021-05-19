{ stdenv, fetchurl, autoPatchelfHook }:

stdenv.mkDerivation {
  name = "enonic-cli";

  src = fetchurl {
    url =
      "https://repo.enonic.com/public/com/enonic/cli/enonic/1.5.1/enonic_1.5.1_Linux_64-bit.tar.gz";
    sha256 = "0nf5prz372w920sh25dxdplc668vkbphj0d9c50pdnjnhy0l346m";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  unpackPhase = ''
    tar xf $src
  '';

  installPhase = ''
    install -m755 -D enonic $out/bin/enonic
  '';
}
