{ config, pkgs, inputs, hostSettings, ... }:
{
  home.username = "hendrikf";
  home.homeDirectory = "/home/hendrikf";

  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./hyprland.nix
    ./hypr-extras.nix
  ];

  # Unfree
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Shell
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
    '';
  };

  programs.alacritty.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      lualine-nvim
      presence-nvim
    ];
  };

  # Caelestia Shell
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      performance = {
        keepAlive = true;
        preloadWidgets = true;
      };
      dashboard.mediaUpdateInterval = 1000;
      bar = {
        margins = 0;
        padding = 0;
        width = 10;
        offset = 0;
        status.showBattery = hostSettings.showBattery;
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers";
      launcher.maxWallpapers = 9;
      theme.scheme = "dynamic";
    };
    cli = {
      enable = true;
      settings.theme.enableGtk = false;
    };
  };

  # Dotfiles
  xdg.configFile."nvim".source = ../dotfiles/nvim;
  xdg.configFile."fastfetch".source = ../dotfiles/fastfetch;
  xdg.configFile."alacritty".source = ../dotfiles/alacritty;
  xdg.configFile."zed".source = ../dotfiles/zed;
  xdg.configFile."waybar".source = ../dotfiles/waybar;
  xdg.configFile."fish".source = ../dotfiles/fish;
  xdg.configFile."swaync".source = ../dotfiles/swaync;
  xdg.configFile."yazi".source = ../dotfiles/yazi;
  xdg.configFile."wofi".source = ../dotfiles/wofi;

  # Starship
  programs.starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ../dotfiles/starship/starship.toml);
  };

  # Git
  programs.git = {
    enable = true;
    settings = {
    userName = "Hangover64";
    userEmail = "hendrikfarnkopf@pm.me";
    };
  };

  # Packages
  home.packages = with pkgs; [
    htop
    btop
    fastfetch
    tree
    file
    dysk
    gnumake
    imagemagick
    yazi
    ueberzugpp
    python3

    # GUI Apps
    zed-editor
    okteta
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.kwin
    kdePackages.spectacle
    obsidian
    spotify
    discord
    vivaldi
    tor-browser
    libreoffice
    pavucontrol
    networkmanagerapplet
    lunar-client

    # Hyprland tools
    swaynotificationcenter
    playerctl
    hyprpicker
    foot

    # Peripherals
    piper
    libratbag
    spicetify-cli

    # Misc
    antigravity
    coolercontrol.coolercontrold
    coolercontrol.coolercontrol-gui
    coolercontrol.coolercontrol-ui-data

    #Jetbrains
    jetbrains.idea
    jetbrains.rust-rover
    jetbrains.ruby-mine
    jetbrains.webstorm
  ];

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
