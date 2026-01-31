{ config, lib, pkgs, userSettings, ... }:

let cfg = config.systemSettings.fonts;
in {
  options.systemSettings.fonts = {
    enable = lib.mkEnableOption "Setup fonts";

  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      # Use the font package you defined in your flake.nix
      userSettings.fontPkg

      # Modern Wayland/Niri essentials
      nerd-fonts.symbols-only # Great for Waybar icons
      noto-fonts-emoji-blob-bin # High-quality emojis
    ];

    # This part is crucial for Niri and Firefox to pick the right fonts
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ userSettings.font ];
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
