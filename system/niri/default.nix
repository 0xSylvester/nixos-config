{ config, lib, pkgs, pkgs-unstable, ... }:

let cfg = config.systemSettings.niri;
in {
  options.systemSettings.niri = {
    enable = lib.mkEnableOption "Enable niri scrolling window manager";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs-unstable.niri;
    };

    programs.hyprlock.enable = true;
    services.hypridle.enable = true;
    programs.ydotool.enable = true;

    environment.systemPackages = with pkgs; [
      swww
      brightnessctl
      wl-clipboard-rs
      wl-clip-persist
      xdg-desktop-portal-gnome
    ];

  };
}

