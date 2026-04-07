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
    ];
    packages = with pkgs; [ ];
  };
}
