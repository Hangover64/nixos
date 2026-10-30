{ config, pkgs, ... }:
let
  cosmicXkbConfig = pkgs.writeText "cosmic-xkb-config" ''
    (
        rules: "",
        model: "",
        layout: "de,us",
        variant: "",
        options: None,
        repeat_delay: 600,
        repeat_rate: 25,
    )
  '';
in
{
  programs.hyprlock.enable = true;
  programs.hyprland.enable = true;

  services.displayManager.cosmic-greeter = {
    enable = true;
  };

  # Required by cosmic-greeter (via xkb_data) to load the available XKB layouts list
  # when the full COSMIC desktop environment is not enabled.
  environment.sessionVariables = {
    X11_BASE_RULES_XML = "${config.services.xserver.xkb.dir}/rules/base.xml";
    X11_EXTRA_RULES_XML = "${config.services.xserver.xkb.dir}/rules/base.extras.xml";
  };

  # Configure XKB layouts (German default + US selectable) for cosmic-comp running cosmic-greeter
  systemd.tmpfiles.settings.cosmic-greeter = {
    "/var/lib/cosmic-greeter/.config".d = {
      user = "cosmic-greeter";
      group = "cosmic-greeter";
      mode = "0755";
    };
    "/var/lib/cosmic-greeter/.config/cosmic".d = {
      user = "cosmic-greeter";
      group = "cosmic-greeter";
      mode = "0755";
    };
    "/var/lib/cosmic-greeter/.config/cosmic/com.system76.CosmicComp".d = {
      user = "cosmic-greeter";
      group = "cosmic-greeter";
      mode = "0755";
    };
    "/var/lib/cosmic-greeter/.config/cosmic/com.system76.CosmicComp/v1".d = {
      user = "cosmic-greeter";
      group = "cosmic-greeter";
      mode = "0755";
    };
    "/var/lib/cosmic-greeter/.config/cosmic/com.system76.CosmicComp/v1/xkb_config"."L+" = {
      argument = "${cosmicXkbConfig}";
    };
  };

  # Provide the same XKB config in the user home so cosmic-greeter-daemon populates
  # the keyboard layout selector dropdown for the user on the login screen.
  home-manager.users.hendrikf.xdg.configFile."cosmic/com.system76.CosmicComp/v1/xkb_config".source = cosmicXkbConfig;

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
