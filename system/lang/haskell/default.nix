{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.lang.haskell;
in
{
  options.systemSettings.lang.haskell = {
    enable = lib.mkEnableOption "Setup up haskell dev tools";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ghc
      cabal-install
      haskell-language-server
    ];
  };
}
