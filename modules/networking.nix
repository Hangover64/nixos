{ pkgs, ... }:
{
  networking = {
    networkmanager.enable = true;
    nftables.enable = true;
  };

  services.firewalld.enable = true;
  services.mullvad-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    nftables
    mullvad-vpn
    nmgui
  ];
}
