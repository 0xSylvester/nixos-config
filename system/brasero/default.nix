{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.brasero;
in
{
  options.systemSettings.brasero = {
    enable = lib.mkEnableOption "Enable brasero CD/DVD burn utility";
  };

  config = lib.mkIf cfg.enable {
    services.udisks2.enable = true;
    services.gvfs.enable = true;

    environment.systemPackages = with pkgs; [
      brasero
      cdrtools
      libburn
    ];
  };
}
