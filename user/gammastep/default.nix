{ config, lib, pkgs, ... }:

let cfg = config.userSettings.gammastep;
in {
  options.userSettings.gammastep = {
    enable = lib.mkEnableOption "Enable gammastep";

  };

  config = lib.mkIf cfg.enable {

    services.gammastep = {
      # Gamma control for night light
      enable = true;
      package = pkgs.gammastep.override { withGeolocation = false; };

      # Not real coords. Just capital of spain
      latitude = 32.377533;
      longitude = 15.092017;
      tray = true;
    };

  };
}
