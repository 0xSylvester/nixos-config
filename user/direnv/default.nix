{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.userSettings.direnv;
in
{
  options.userSettings.direnv = {
    enable = lib.mkEnableOption "Enable direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
