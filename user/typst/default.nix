{ config, lib, pkgs, ... }:

let cfg = config.userSettings.typst;
in {
  options.userSettings.typst = { enable = lib.mkEnableOption "Enable typst"; };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      typst # The compiler
      tinymist # The LSP (Language Server)
      typstyle # The Formatter
    ];
  };
}
