{ config, lib, pkgs, ... }:

let cfg = config.userSettings.fastfetch;
in {
  options.userSettings.fastfetch = {
    enable = lib.mkEnableOption "Enable macchina config";

  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch.enable = true;
    home.file.".config/fastfetch" = {
      source = ./config;
      recursive = true;
    };
  };
}
