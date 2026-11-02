{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.caelestia-cli.follows = "caelestia-cli";
    };

    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.caelestia-shell.follows = "";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-citizen = {
      url = "github:LovingMelody/nix-citizen";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    creds = {
      url = "path:/home/hendrikf/Documents/nixos-secrets";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, caelestia-shell, creds, ... }@inputs:
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
          inherit creds;
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
          inherit creds;
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
