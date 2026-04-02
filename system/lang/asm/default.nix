{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.assembly;
in {
  options.systemSettings.lang.assembly = {
    enable = lib.mkEnableOption "Setup assembly utilities";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nasm dosbox ];
  };
}
