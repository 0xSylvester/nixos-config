{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  cfg = config.userSettings.noctalia;
in
{
  options.userSettings.noctalia = {
    enable = lib.mkEnableOption "Enable Noctalia shell";
  };

  config = lib.mkIf cfg.enable {
    programs.noctalia-shell = {
      enable = true;

      settings = {
        theme = {
          mode = "light";
          source = "builtin";
          builtin = "gruvbox";
        };

        wallpaper = {
          enabled = true;
          default.path = "/home/${userSettings.username}/wallpapers";
        };
      };
    };
  };
}
