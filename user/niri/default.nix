{ config, lib, ... }:

let cfg = config.userSettings.niri;
in {
  options.userSettings.niri = {
    enable = lib.mkEnableOption "Enable niri config";
  };

  config = lib.mkIf cfg.enable {

    home.file.".config/niri" = {
      source = ./config;
      recursive = true;
    };

  };
}

