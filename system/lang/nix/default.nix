{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.nix;
in {
  options.systemSettings.lang.nix = {
    enable = lib.mkEnableOption "Setup nix lang utilties";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nixfmt nil ];
  };
}

