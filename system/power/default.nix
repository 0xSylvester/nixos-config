{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.power;
in
{
  options.systemSettings.power = {
    enable = lib.mkEnableOption "Enable Power Config";
  };

  config = lib.mkIf cfg.enable {
    services.tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 85;
        STOP_CHARGE_THRESH_BAT0 = 90;
      };
    };

    services.upower.enable = true;

    environment.systemPackages = with pkgs; [
      acpi
      lm_sensors
    ];
  };
}
