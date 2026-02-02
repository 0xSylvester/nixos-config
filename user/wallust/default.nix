{ config, lib, ... }:

let cfg = config.userSettings.wallust;
in {
  options.userSettings.wallust = {
    enable = lib.mkEnableOption "Enable wallust";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/wallust" = {
      source = ./config;
      recursive = true;
    };
  };
}
