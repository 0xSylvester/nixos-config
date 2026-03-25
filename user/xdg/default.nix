{ config, lib, pkgs, ... }:

let cfg = config.userSettings.xdg;
in {
  options.userSettings.xdg = {
    enable =
      lib.mkEnableOption "XDG MIME associations and base directory enforcement";

  };

  config = lib.mkIf cfg.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = [ "doom.desktoop" ];
        "text/org" = [ "doom.desktoop" ];
        "text/markdown" = [ "doom.desktop" ];
        "text/css" = [ "doom.desktop" ];
        "text/html" = [ "doom.desktop" ];
        "text/js" = [ "doom.desktop" ];
        "text/vue" = [ "doom.desktop" ];
        "text/go" = [ "doom.desktop" ];
        "text/c" = [ "doom.desktop" ];
        "text/cpp" = [ "doom.desktop" ];
        "text/python" = [ "doom.desktop" ];
        "text/rust" = [ "doom.desktoop" ];
        "text/x-typst" = [ "doom.desktoop" ];

        "application/xml" = [ "doom.desktop" ];
        "application/json" = [ "doom.desktop" ];
        "application/yaml" = [ "doom.desktop" ];
        "application/toml" = [ "doom.desktop" ];

        "application/pdf" = [ "org.pwmt.zathura.desktop" ];

        "image/png" = [ "imv.desktop" ];
        "image/svg" = [ "imv.desktop" ];
        "image/jpeg" = [ "imv.desktop" ];
        "image/gif" = [ "imv.desktop" ];

        "video/mp4" = [ "mpv.desktop" ];
        "audio/mp3" = [ "mpv.desktop" ];
      };
    };
    xdg.desktopEntries.doom = {
      name = "DOOM";
      genericName = "Text Editor";
      comment = "Edit text files using the Doom Emacs ";
      exec = "emacsclient -c -a emacs %F";
      terminal = false;
      icon = "doom";
      categories = [ "Development" "TextEditor" ];
      mimeType = [ "text/plain" "text/rust" "text/org" ];
      settings = { Keywords = "Text;Editor;Write;Programming;"; };
    };
  };
}
