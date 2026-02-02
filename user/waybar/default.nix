{ config, lib, ... }:

let cfg = config.userSettings.waybar;
in {
  options.userSettings.waybar = {
    enable = lib.mkEnableOption "Enable waybar";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar.enable = true;
    home.file.".config/waybar" = {
      source = ./config;
      recursive = true;
    };
  };
}
