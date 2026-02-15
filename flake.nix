{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, caelestia-shell, ... }@inputs:
  let
    commonModules = [
      ./modules/common.nix
      ./modules/hyprland.nix
      ./modules/audio.nix
      ./modules/networking.nix
      ./modules/packages.nix
      inputs.home-manager.nixosModules.default
    ];
  in {
    nixosConfigurations = {

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostSettings = {
            hostname = "nixos-desktop";
            monitorConfig = ",preferred,auto,1";
            showBattery = false;
          };
        };
        modules = commonModules ++ [ ./hosts/desktop ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostSettings = {
            hostname = "nixos-laptop";
            monitorConfig = ",preferred,auto,1.5";
            showBattery = true;
          };
        };
        modules = commonModules ++ [ ./hosts/laptop ];
      };

    };
  };
}
