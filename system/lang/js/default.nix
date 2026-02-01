{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.js;
in {
  options.systemSettings.lang.js = {
    enable = lib.mkEnableOption "Enable js";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nodejs_24
      pnpm
      nodePackages.prettier
      typescript-language-server
      vue-language-server
      typescript
    ];
  };
}
