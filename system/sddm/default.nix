{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.sddm;
in {
  options.systemSettings.sddm = {
    enable = lib.mkEnableOption "Setup sddm display manager";

  };

  config = lib.mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      defaultSession = "niri";
    };
  };
}
