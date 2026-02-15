{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    # ./mounts-pc.nix  # Uncomment when mounts file exists
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
  };

  environment.systemPackages = with pkgs; [
    mesa
    vulkan-tools
    rocmPackages.rocm-smi
    xfsprogs
    razergenie
    razer-cli
  ];

  # VirtualBox
  boot.kernelModules = [ "vboxdrv" "vboxnetadp" "vboxnetflt" ];
  virtualisation.virtualbox.host.enable = true;

  # Peripherals
  programs.coolercontrol.enable = true;
  services.ratbagd.enable = true;
}
