{ pkgs, ... }:
{
  programs.hyprlock.enable = true;
  programs.hyprland.enable = true;

  services.displayManager.cosmic-greeter = { 
    enable = true;
    };

  environment.systemPackages = with pkgs; [
      hyprpaper
      hyprshot
      hypridle
      brightnessctl
      hyprpicker
      playerctl
  ];

  environment.variables = {
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  };
}
