{
  description = "My first flake";

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    helium.url = "github:AlvaroParker/helium-nix";
    helium.inputs.nixpkgs.follows = "nixpkgs";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
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
        browser = "helium";
        editor = "emacs";
        term = "foot";
        theme = "gruvbox";
        font = "Insonsolata";
        fontPkg = pkgs.inconsolata;
      };

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${systemSettings.system};
    in
    {
      nixosConfigurations = {
        ${systemSettings.hostname} = lib.nixosSystem {
          system = systemSettings.system;
          modules = [ "${./.}/hosts/${systemSettings.host}/configuration.nix" ];
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
          modules = [ "${./.}/hosts/${systemSettings.host}/home.nix" ];

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
