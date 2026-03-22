{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.nix;
in {
  options.systemSettings.lang.arduino = {
    enable = lib.mkEnableOption "Setup arduino lang utilties";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ avrdude ravedude ];
  };
}

