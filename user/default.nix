{ config, lib, pkgs, ... }:

{
  imports = [
    ./doom
    ./foot
    ./hypr
    ./fastfetch
    ./mako
    ./niri
    ./nvim
    ./shell
    ./starship
    ./wallust
    ./waybar
    ./wofi
    ./keepass
    ./gammastep
  ];
}
