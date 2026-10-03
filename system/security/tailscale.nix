{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.security.tailscale;
in
{
  options.systemSettings.security.tailscale = {
    enable = lib.mkEnableOption "Enable TailScale configuraion";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;
    networking.firewall.allowedTCPPorts = [ 25565 ];
  };
}
