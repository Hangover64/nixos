{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/43549131-039a-4410-b4e3-ecd4dc51c325";
    fsType = "xfs";
    options = [ "defaults" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/media" = {
    device = "/dev/disk/by-uuid/922C2CF22C2CD2D1";
    fsType = "ntfs-3g";
    options = [ "defaults" "x-systemd.automount" "noauto" "nofail" ];
  };

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
    trusted-users = [ "hendrikf" ];
        substituters = ["https://nix-citizen.cachix.org"];
        trusted-public-keys = ["nix-citizen.cachix.org-1:lPMkWc2X8XD4/7YPEEwXKKBg+SVbYTVrAaLA2wQTKCo="];
    };

  environment.systemPackages = with pkgs; [
      mesa
      vulkan-tools
      rocmPackages.rocm-smi
      razergenie
      razer-cli
      inputs.nix-citizen.packages.${system}.star-citizen
      inputs.nix-citizen.packages.${system}.wine-astral
      inputs.nix-citizen.packages.${system}.lug-helper
  ];
}
