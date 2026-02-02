{ config, lib, pkgs, userSettings, ... }:

let cfg = config.systemSettings.security.adb;
in {
  options.systemSettings.security.adb = {
    enable = lib.mkEnableOption "Enable adb";
  };

  config = lib.mkIf cfg.enable {
    programs.adb.enable = true;
    users.users.${userSettings.username}.extraGroups = [ "adbusers" ];
    environment.systemPackages = with pkgs; [ android-tools ];
  };
}
