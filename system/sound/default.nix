{ config, lib, pkgs, ... }:

let cfg = config.systemSettings.sound;
in {
  options.systemSettings.sound = {
    enable = lib.mkEnableOption "Enable sound";
  };

  config = lib.mkIf cfg.enable {

    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;

      alsa.enable = true;
      pulse.enable = true;

      wireplumber.enable = true;
    };

    # 4. Useful Audio Tools
    environment.systemPackages = with pkgs; [
      pulsemixer # A great TTY mixer (like alsamixer but for PipeWire/Pulse)
      pavucontrol # The standard GUI for switching inputs/outputs
      helvum # A patchbay for Wayland (see how audio is flowing)
      pulseaudio
    ];
  };
}

