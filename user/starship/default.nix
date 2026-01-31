{ config, lib, pkgs, ... }:

let cfg = config.userSettings.starship;
in {
  options.userSettings.starship = {
    enable = lib.mkEnableOption "Description of module";
  };

  config = lib.mkIf cfg.enable { programs.starship = { enable = true; }; };
}

