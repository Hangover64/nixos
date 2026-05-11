{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
      ./mounts-pc.nix
  ];

# AMD GPU kernel params
  boot.kernelParams = [
    "amdgpu.ppfeaturemask=0xffffffff"
      "amdgpu.noretry=0"
      "amdgpu.freesync=0"
  ];

# GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      libva-utils
    ];
  };

  nix.settings = {
        substituters = ["https://nix-citizen.cachix.org"];
        trusted-public-keys = ["nix-citizen.cachix.org-1:lPMkWc2X8XD4/7YPEEwXKKBg+SVbYTVrAaLA2wQTKCo="];
    };

  environment.systemPackages = with pkgs; [
      mesa
      vulkan-tools
      rocmPackages.rocm-smi
      xfsprogs
      razergenie
      razer-cli
      inputs.nix-citizen.packages.${system}.star-citizen
      inputs.nix-citizen.packages.${system}.wine-astral
      inputs.nix-citizen.packages.${system}.rsi-launcher-umu
  ];


# Peripherals
  programs.coolercontrol.enable = true;
  services.ratbagd.enable = true;
}
