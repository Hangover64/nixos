{ config, pkgs, inputs, hostSettings, ... }:
{
  home.username = "hendrikf";
  home.homeDirectory = "/home/hendrikf";

  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./hyprland.nix
    ./hypr-extras.nix
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

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      background_opacity = "0.6";
      dynamic_background_opacity = true;
    };
  };

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
      launcher = {
        maxWallpapers = 9;
        };
    };
      cli = {
        enable = true;
        settings.theme.enableGtk = false;
      };
  };

  # Dotfiles
  xdg.configFile."nvim".source = ../dotfiles/nvim;
  xdg.configFile."fastfetch".source = ../dotfiles/fastfetch;
  xdg.configFile."yazi".source = ../dotfiles/yazi;
  xdg.configFile."niri".source = ../dotfiles/niri;
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
    # GUI Apps
    okteta
    proton-pass
    obsidian
    spotify
    discord
    kdePackages.dolphin
    (vivaldi.override {
      proprietaryCodecs = true;
    })
    vivaldi-ffmpeg-codecs
    tor-browser
    libreoffice
    pavucontrol
    networkmanagerapplet
    lunar-client
    qalculate-gtk
    insomnia
    localsend
    qbittorrent
    wireshark
    brave
    telegram-desktop
    winboat

    # Misc
    steamcmd
    antigravity

    #Jetbrains
    jetbrains.idea
    jetbrains.rust-rover
    jetbrains.ruby-mine
    jetbrains.webstorm
    jetbrains.clion

    #cli
    ani-cli
    qt6.qtbase
    zathura
    mommy
    jdk21
    (lib.lowPrio jdk25)
    gvfs
    gnome-keyring
    stress-ng
    powerstat
    shadowsocks-rust
    cava
    rpi-imager

    #Developement
    android-tools
    scrcpy
    jmtpfs
    lua-language-server
  ];

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}

