{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.dbus;

in {
  options.systemSettings.dbus = {
    enable = lib.mkEnableOption "Enable dbus";

  };

  config = lib.mkIf cfg.enable {
    services.dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    programs.dconf.enable = true;

    # This is the "Wayland Glue"
    xdg.portal = {
      enable = true;
      # This tells NixOS to use a specific backend for Niri
      # Gnome portal is actually the most reliable for Niri's screen sharing
      extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
      config.common.default = [ "gnome" "gtk" ];
    };
  };
}

