{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-citizen = {
      url = "github:LovingMelody/nix-citizen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, caelestia-shell, ... }@inputs:
    let
    commonModules = [
      ./modules
      inputs.home-manager.nixosModules.default
    ];
  in {
    nixosConfigurations = {

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostSettings = {
            hostname = "nixos-desktop";
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
            showBattery = true;
          };
        };
        modules = commonModules ++ [ ./hosts/laptop ];
      };

    };
  };
}
