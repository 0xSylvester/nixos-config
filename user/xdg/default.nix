{ config, lib, pkgs, ... }:

let cfg = config.userSettings.xdg;
in {
  options.userSettings.xdg = {
    enable =
      lib.mkEnableOption "XDG MIME associations and base directory enforcement";

  };

  config = lib.mkIf cfg.enable {

  };
}
