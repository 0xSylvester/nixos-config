{ config, lib, systemSettings, ... }:

let cfg = config.systemSettings.security.networking;
in {
  options.systemSettings.security.networking = {
    enable = lib.mkEnableOption "Enable Network settings";

  };

  config = lib.mkIf cfg.enable {

    networking.hostName = systemSettings.hostname;
    networking.networkmanager.enable = true;

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
      };
    };

    networking.firewall = {
      enable = true;
      # Example: allow local web development ports
      # allowedTCPPorts = [ 8000 8080 ];
      # allowedUDPPorts = [ 5353 ]; # For discovery
    };

    services.resolved.enable = true;
  };
}

