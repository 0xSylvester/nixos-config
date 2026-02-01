{ config, lib, pkgs, ... }:

let cfg = config.userSettings.ksshaskpass;
in {
  options.userSettings.ksshaskpass = {
    enable = lib.mkEnableOption "Enable ksshaskpass";

  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.kdePackages.ksshaskpass ];

    home.sessionVariables = {
      SSH_ASKPASS = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";

      SSH_ASKPASS_REQUIRE = "prefer";

      # Help the Qt app find your Niri screen
      WAYLAND_DISPLAY = "wayland-0";
      QT_QPA_PLATFORM = "wayland";
      XDG_CURRUNT_DESKTOP = "niri:GNOME";
    };
  };
}
