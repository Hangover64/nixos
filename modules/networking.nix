{ pkgs, ... }:
{
  networking = {
    networkmanager.enable = true;
    nftables.enable = true;
    firewall.allowedTCPPorts = [9757];
    firewall.allowedUDPPorts = [9757];
  };

  programs.wireshark = {
    enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.firewalld.enable = true;
  services.mullvad-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    nftables
      mullvad-vpn
      nmgui
  ];
}
