{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.plymouth;
in {
  options.systemSettings.plymouth = {
    enable = lib.mkEnableOption "Enable plymouth module";
  };

  config = lib.mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      # You can choose a default theme like "breeze", "spinner", or "glitch"
      theme = "glitch";
    };

    # This makes the boot process "silent" so the text doesn't flicker over the logo
    boot.consoleLogLevel = 0;
    boot.initrd.verbose = false;
    boot.kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
}
