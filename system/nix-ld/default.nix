{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.nix-ld;
in
{
  options.systemSettings.nix-ld = {
    enable = lib.mkEnableOption "Setup nix-ld";
  };

  config = lib.mkIf cfg.enable {
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      stdenv.cc.cc
      zlib
    ];
  };
}
