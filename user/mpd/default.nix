{ config, lib, pkgs, ... }:

let cfg = config.userSettings.mpd;
in {
  options.userSettings.mpd = {
    enable = lib.mkEnableOption "Music Player Daemon module";

  };

  config = lib.mkIf cfg.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Audio/music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Output"
        }
      '';
    };

    # Install a frontend to actually control the music
    home.packages = [ pkgs.ncmpcpp ];
  };
}
