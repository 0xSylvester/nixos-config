{ config, lib, ... }:

let cfg = config.userSettings.nvim;
in {
  options.userSettings.nvim = {
    enable = lib.mkEnableOption "Enable nvim config";
  };

  config = lib.mkIf cfg.enable {

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    home.file.".config/nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}

