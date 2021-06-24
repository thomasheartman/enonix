# copied from the mozilla-overlay's version: https://github.com/mozilla/nixpkgs-mozilla/blob/master/default.nix
let
  overlays = [ ./overlay.nix ];

in

self: super:

  with super.lib;
  (
    foldl' (flip extends) (_: super)
      (map import overlays)
  )
    self
