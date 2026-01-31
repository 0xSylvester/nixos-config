{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  cfg = config.systemSettings.nsync;
  scriptSource = builtins.readFile ./nsync.sh;

  # 2. Replace the @dotfiles@ placeholder with your actual path from userSettings
  processedScript = builtins.replaceStrings [ "@dotfiles@" "@hostname@" ] [
    "${userSettings.dotFilesDir}"
    "${systemSettings.hostname}"
  ] scriptSource;

in {
  options.systemSettings.nsync = {
    enable = lib.mkEnableOption "Enable nsync";

  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages =
      [ (pkgs.writeScriptBin "nsync" processedScript) ];
  };
}
