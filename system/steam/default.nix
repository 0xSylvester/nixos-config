{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.steam;
in
{
  options.systemSettings.steam = {
    enable = lib.mkEnableOption "Setup steam";

  };

  config = lib.mkIf cfg.enable {
    #nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-run"
        "steam-unwrapped"
      ];
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    programs.gamemode.enable = true;

  };
}
