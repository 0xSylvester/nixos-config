{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.security.fprint;
in
{
  options.systemSettings.security.fprint = {
    enable = lib.mkEnableOption "Enable Finger Print";
  };

  config = lib.mkIf cfg.enable {
    services.fprintd.enable = true;
    security.pam.services.sudo.fprintAuth = true;
    security.pam.services.login.fprintAuth = true;
    security.pam.services.login.unixAuth = true;
  };
}
