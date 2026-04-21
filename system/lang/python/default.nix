{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.lang.python;
in
{
  options.systemSettings.lang.python = {
    enable = lib.mkEnableOption "Setup python";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python315
    ];
  };
}
