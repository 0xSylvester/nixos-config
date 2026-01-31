{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.go;
in {
  options.systemSettings.lang.go = { enable = lib.mkEnableOption "Setup go"; };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ go gopls ];
  };
}

