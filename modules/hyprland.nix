{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;

  services.displayManager.cosmic-greeter.enable = true;

  environment.systemPackages = with pkgs; [
      hyprpaper
      hyprshot
      hyprlock
      hypridle
      brightnessctl
      hyprpicker
      playerctl
      swaynotificationcenter
  ];

  environment.variables = {
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  };
}
