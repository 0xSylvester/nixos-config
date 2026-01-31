{ config, lib, pkgs, ... }:

let cfg = config.userSettings.mako;
in {
  options.userSettings.mako = {
    enable = lib.mkEnableOption "Enable mako config";

  };

  config = lib.mkIf cfg.enable {
    services.mako.enable = true;

    home.file.".config/mako" = {
      source = ./config;
      recursive = true;
    };
  };
}
