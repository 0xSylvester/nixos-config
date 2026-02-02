{ config, lib, userSettings, ... }:

let cfg = config.systemSettings.security.syncthing;
in {
  options.systemSettings.security.syncthing = {
    enable = lib.mkEnableOption "Enable syncthing";

  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = "${userSettings.username}";
      dataDir =
        "/home/${userSettings.username}/Syncthing/"; # Default folder for new syncs
      configDir =
        "/home/${userSettings.username}/.config/syncthing"; # Where the keys/config stay

      # Optional: Open the default Syncthing ports in the firewall
      overrideDevices = true; # Allow Nix to manage devices
      overrideFolders = true; # Allow Nix to manage folders
    };
  };
}
