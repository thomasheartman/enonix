self: super:

with super.lib;

let
  overlays = [ ./overlay.nix ];

in
(
  foldl' (flip extends) (_: super)
    (map import overlays)
)
  self
