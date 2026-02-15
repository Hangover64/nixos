{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;

  services.displayManager.cosmic-greeter.enable = true;

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    hyprpaper
    hyprshot
    hyprlock
    hypridle
    wofi
    brightnessctl
  ];

  environment.variables = {
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  };
}
