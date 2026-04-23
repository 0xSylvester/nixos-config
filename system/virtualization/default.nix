{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.systemSettings.virtualization;
in
{
  options.systemSettings.virtualization = {
    enable = lib.mkEnableOption "Enable virtualization via Qemu and virt-manager";

  };

  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
      };
    };
    programs.virt-manager.enable = true;
  };
}
