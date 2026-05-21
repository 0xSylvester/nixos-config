{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.gdm;
in
{
  options.systemSettings.gdm = {
    enable = lib.mkEnableOption "Setup gdm (Gnome Display Manager)";

  };

  config = lib.mkIf cfg.enable {
    services.displayManager.gdm.enable = true;
  };
}
