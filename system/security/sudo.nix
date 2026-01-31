{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.security.sudo;
in {
  options.systemSettings.security.sudo = {
    enable = lib.mkEnableOption "Enable sudo";
  };

  config = lib.mkIf cfg.enable {

    security.sudo = {
      enable = true;
      wheelNeedsPassword = true; # Set to false if you want 'passwordless sudo'

      # Arch users often like a longer timeout so they don't type the password constantly
      extraConfig = ''
        Defaults env_reset, timestamp_timeout=20
      '';
    };
  };
}

