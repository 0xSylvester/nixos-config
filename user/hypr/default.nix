{ config, lib, pkgs, ... }:

let cfg = config.userSettings.hypr;
in {
  options.userSettings.hypr = {
    enable = lib.mkEnableOption "Enable hyprland tools hypridle, hyplock";

  };

  config = lib.mkIf cfg.enable {

    home.file.".config/hypr" = {
      source = ./config;
      recursive = true;
    };
  };
}
