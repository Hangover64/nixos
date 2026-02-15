{ pkgs, inputs, hostSettings, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = hostSettings.hostname;

  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  console.keyMap = "de-latin1-nodeadkeys";

  users.users.hendrikf = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Hendrikf";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs hostSettings; };
    users."hendrikf" = import ../home;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];

  services.printing.enable = true;
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.11";
}
