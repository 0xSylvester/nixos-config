{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.shell;
in {
  options.systemSettings.shell = {
    enable = lib.mkEnableOption "Enable shell utilies";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # Core essentials
      vim
      git
      wget
      curl
      rsync
      tmux
      libnotify

      # Modern (Rust alternatives)
      eza # 'ls' replacement
      bat # 'cat' with syntax highlighting
      bottom # 'top' replacement (btm)
      fd # 'find' replacement
      ripgrep # 'grep' replacement
      dust # 'du' replacment
      macchina # 'neofetch' replacment

      # System monitoring
      pciutils
      usbutils
      killall
      htop

      # Other
      unzip
      jq
      file
    ];

  };
}
