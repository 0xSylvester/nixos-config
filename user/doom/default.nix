{ config, lib, pkgs, ... }:

let cfg = config.userSettings.doom;
in {
  options.userSettings.doom = {
    enable = lib.mkEnableOption "Enable Doom Emacs configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.foot.enable = true;
    home.file.".config/doom" = {
      source = ./config;
      recursive = true;
    };
  };
}

