let
  version = "7.6.1";

  distro = "enonic-xp-linux-sdk-${version}";

  url =
    "https://repo.enonic.com/public/com/enonic/xp/enonic-xp-linux-sdk/${version}/${distro}.zip";

in

self: super: {
  enonic-cli = super.pkgs.callPackage ./cli/enonic-cli.nix {};
  enonic-xp = super.pkgs.callPackage ./xp/enonic-xp.nix {};
}
