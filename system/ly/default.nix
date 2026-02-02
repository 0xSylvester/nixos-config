{ config, lib, ... }:

let cfg = config.systemSettings.ly;
in {
  options.systemSettings.ly = {
    enable = lib.mkEnableOption "Enable Ly Nerd display manager";

  };

  config = lib.mkIf cfg.enable {

    services.displayManager.ly.enable = true;
  };
}

