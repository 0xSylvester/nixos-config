{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.userSettings.cursor;
in
{
  options.userSettings.cursor = {
    enable = lib.mkEnableOption "Setup the cursor theme";

  };

  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
      };
    };

    home.sessionVariables = {
      XCURSOR_SIZE = "24";
      XCURSOR_THEME = "Bibata-Modern-Classic";
    };

  };
}
