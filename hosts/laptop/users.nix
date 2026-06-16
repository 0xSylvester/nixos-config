{ pkgs, userSettings, ... }:

{
  users.users.${userSettings.username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "networkmanager"
      "ydotool"
      "dialout"
      "docker"
      "cdrom"
      "libvirtd"
      "gamemode"
    ];
    packages = with pkgs; [ ];
  };

  nix.settings = {
    trusted-users = [
      "root"
      "sylvester"
    ];
  };

}
