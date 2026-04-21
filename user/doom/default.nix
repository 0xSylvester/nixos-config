{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.userSettings.doom;
in
{
  options.userSettings.doom = {
    enable = lib.mkEnableOption "Enable Doom Emacs configuration";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/doom" = {
      source = ./config;
      recursive = true;
    };

    programs.emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
      extraPackages = epkgs: [ epkgs.mu4e ];
    };
  };
}
