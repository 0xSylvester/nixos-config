{ config, lib, pkgs, ... }:

{
  imports = [
    ./ly
    ./nh
    ./dbus
    ./lang
    ./niri
    ./fonts
    ./nsync
    ./shell
    ./security
    ./sound
    ./bluetooth
    ./bin/doom-emacs.nix
  ];
}
