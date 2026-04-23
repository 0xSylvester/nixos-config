{
  pkgs,
  systemSettings,
  inputs,
  ...
}:

{
  imports = [
    # Main config
    ./hardware-configuration.nix
    ./users.nix
    ../../system
    inputs.disko.nixosModules.disko
    ./disko.nix
  ];

  config = {
    systemSettings = {
      security.networking.enable = true;
      security.sudo.enable = true;
      security.syncthing.enable = true;
      security.adb.enable = true;

      nh.enable = true;
      ly.enable = true;
      #plymouth.enable = true;
      #sddm.enable = true;

      docker.enable = true;

      shell.enable = true;
      niri.enable = true;
      steam.enable = false;
      brasero.enable = true;

      nsync.enable = true;

      bluetooth.enable = true;
      dbus.enable = true;
      fonts.enable = true;
      sound.enable = true;

      lang.rust.enable = true;
      lang.go.enable = true;
      lang.sh.enable = true;
      lang.nix.enable = true;
      lang.lua.enable = true;
      lang.c.enable = true;
      lang.js.enable = true;
      lang.assembly.enable = true;
      lang.python.enable = true;

      nix-ld.enable = true;
    };
    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Set your time zone.
    time.timeZone = systemSettings.timeZone;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
      vim
      mpv
      brave
      telegram-desktop
      sxiv
      zathura
      emacs-pgtk
      kdePackages.kdenlive
      nautilus
      imv
      graphviz
      dbeaver-bin
      isync
      mu
    ];

    system.stateVersion = "25.05"; # Did you read the comment?

  };

}
