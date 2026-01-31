{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.c;
in {
  options.systemSettings.lang.c = {
    enable = lib.mkEnableOption "Setup up c utilties";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gcc
      clang-tools
      cmake
      gnumake
      binutils
    ];
  };
}
