{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.bluetooth;
in {
  options = {
    systemSettings.bluetooth = {
      enable = lib.mkEnableOption "Enable bluetooth";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true; # Powers up the controller immediately
      settings = {
        General = {
          Experimental = true;
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    services.blueman.enable = true;
    environment.systemPackages = [ pkgs.bluez ];
  };
}
