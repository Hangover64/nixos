{ config, pkgs, inputs, hostSettings, ... }:
{
  home.username = "hendrikf";
  home.homeDirectory = "/home/hendrikf";

  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./hyprland.nix
    ./hypr-extras.nix
    ../hosts/laptop/monitors.nix
    ../hosts/desktop/monitors.nix
  ];

  # Shell
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
      '';
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      fish_config theme choose "Dracula Official"
      '';
    functions = {
      fish_right_prompt = {
        body = ''
          mommy -1 -s $status
          '';
      };
    };
  };

  programs.alacritty.enable = true;

  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
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
      paths = {
        wallpaperDir = "~/Pictures/Wallpapers";
      };
      notifs = {
        clearThreshold = 0.3;
        defaultExpireTimeout = 5000;
        expandThreshold = 20;
        openExpanded = false;
        actionOnClick = false;
        expire = true;
      };
      dashboard.mediaUpdateInterval = 1000;
      bar = {
        status = {
          showBattery = hostSettings.showBattery;
          showMicrophone = true;
        };
        workspaces = {
          activeIndicator = true;
          perMonitorWorkspaces = false;
        };
        clock.showDate = true;
      };
      launcher.maxWallpapers = 9;
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
  xdg.configFile."swaync".source = ../dotfiles/swaync;
  xdg.configFile."yazi".source = ../dotfiles/yazi;
  xdg.configFile."wofi".source = ../dotfiles/wofi;
  xdg.configFile."fish/themes/Dracula Official.theme".source = ../dotfiles/fish/themes/dracula;

  # Starship
  programs.starship = {
    enable = true;
    settings = builtins.fromTOML  (builtins.readFile ../dotfiles/starship/starship.toml);
  };

  # Git
  programs.git = {
    enable = true;
    settings = {
      user = {
      name = "Hangover64";
      email = "hendrikfarnkopf@pm.me";
      };
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
    python313Packages.pydbus
    python313Packages.dbus-python
    python3Packages.dbus-python
    
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
    vencord
    vivaldi
    tor-browser
    libreoffice
    pavucontrol
    networkmanagerapplet
    lunar-client
    qalculate-gtk
    insomnia
    logisim
    localsend
    qbittorrent
    wireshark

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

    #cli
    ani-cli
    qt6.qtbase
    zathura
    mommy
    rquickshare
    jdk21
    (lib.lowPrio jdk25)
    gvfs
    jmtpfs
    gnome-keyring
    stress-ng
    powerstat
  ];

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}

