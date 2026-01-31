{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-doom-emacs-unstraightened.url =
      "github:marienz/nix-doom-emacs-unstraightened";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "HP630-G1";
        host = "laptop";
        timeZone = "Africa/Tripoli";
      };
      userSettings = {
        username = "sylvester";
        dotFilesDir = "/home/sylvester/nixos-config";
        wm = "niri";
        launcher = "wofi";
        appLauncher = "wofi --show drun";
        lock = "hyprlock";
        browser = "brave";
        editor = "emacs";
        term = "foot";
        theme = "twilight";
        font = "Insonsolata";
        fontPkg = pkgs.inconsolata;
      };

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${systemSettings.system};
    in {
      nixosConfigurations = {
        ${systemSettings.hostname} = lib.nixosSystem {
          system = systemSettings.system;
          modules = [
            (./. + "/hosts" + ("/" + systemSettings.host)
              + "/configuration.nix")
          ];
          specialArgs = {
            # pass config variables from above
            inherit systemSettings;
            inherit userSettings;
            inherit pkgs-unstable;
            inherit inputs;
          };
        };
      };
      homeConfigurations = {
        sylvester = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules =
            [ (./. + "/hosts" + ("/" + systemSettings.host) + "/home.nix") ];

          extraSpecialArgs = {
            # pass config variables from above
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
            inherit pkgs-unstable;
          };
        };
      };
    };
}
