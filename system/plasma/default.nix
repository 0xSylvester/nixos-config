{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.plasma;
in
{
  options.systemSettings.plasma = {
    enable = lib.mkEnableOption "Setup kde plasma";
  };

  config = lib.mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
