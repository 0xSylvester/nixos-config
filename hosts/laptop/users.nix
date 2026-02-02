{ pkgs, userSettings, ... }:

{
  users.users.${userSettings.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "ydotool" ];
    packages = with pkgs; [ ];
  };
}

