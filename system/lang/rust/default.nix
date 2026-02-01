{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.rust;
in {
  options.systemSettings.lang.rust = {
    enable = lib.mkEnableOption "Setup rust";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ rustup cargo ];
  };
}

