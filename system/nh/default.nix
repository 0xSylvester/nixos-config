{ config, lib, ... }:

let cfg = config.systemSettings.nh;
in {
  options.systemSettings.nh = {
    enable = lib.mkEnableOption "Enable nh nix helper";

  };

  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 30d --keep 3";
      # Point this to your actual dotfiles directory
      flake = "/home/sylvester/nixos-config/";
    };
  };
}

