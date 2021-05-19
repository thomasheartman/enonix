{ nixpkgs ? <nixpkgs>, pkgs ? import nixpkgs {}}:

pkgs.callPackage ./enonic-xp.nix {}
