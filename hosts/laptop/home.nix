{ config, pkgs, userSettings, ... }:

{
  imports = [ ../../user ];

  config = {
    userSettings = {
      ${userSettings.wm}.enable = true;
      shell.enable = true;
      starship.enable = true;
      foot.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      doom.enable = true;
      mako.enable = true;
      wallust.enable = true;
      hypr.enable = true;
      fastfetch.enable = true;
      keepass.enable = true;
      gammastep.enable = true;
      typst.enable = true;
      ksshaskpass.enable = true;
    };

    home.username = userSettings.username;
    home.homeDirectory = "/home/${userSettings.username}";

    home.file = { };
    home.packages = [ ];

    home.sessionVariables = { };

    programs.home-manager.enable = true;

    home.stateVersion = "25.05"; # Please read the comment before changing.

  };

}
