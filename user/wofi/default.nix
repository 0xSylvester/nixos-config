{ config, lib, pkgs, ... }:

let cfg = config.userSettings.wofi;
in {
  options.userSettings.wofi = { enable = lib.mkEnableOption "Enable wofi"; };

  config = lib.mkIf cfg.enable {

    programs.wofi.enable = true;
    home.file.".config/wofi" = {
      source = ./config;
      recursive = true;
    };
  };
}

