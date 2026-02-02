{ config, lib, ... }:

let cfg = config.userSettings.foot;
in {
  options.userSettings.foot = {
    enable = lib.mkEnableOption "Enable Foot wayland terminal";

  };

  config = lib.mkIf cfg.enable {
    programs.foot.enable = true;
    home.file.".config/foot" = {
      source = ./config;
      recursive = true;
    };
  };
}

