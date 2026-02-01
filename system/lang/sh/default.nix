{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.sh;
in {
  options.systemSettings.lang.sh = {
    enable = lib.mkEnableOption "Setup sh";

  };

  config =
    lib.mkIf cfg.enable { environment.systemPackages = with pkgs; [ shfmt ]; };
}

