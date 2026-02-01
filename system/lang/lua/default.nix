{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.lang.lua;
in {
  options.systemSettings.lang.lua = {
    enable = lib.mkEnableOption "Setup lua";

  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [ lua stylua lua-language-server ];
  };
}

