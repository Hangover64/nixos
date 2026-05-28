alias l := laptop
alias d := desktop
alias u := update

laptop:
  sudo nixos-rebuild switch --flake ~/nixos#laptop
  hyprctl reload

desktop:
  sudo nixos-rebuild switch --flake ~/nixos#desktop
  hyprctl reload

update:
  sudo nix flake update
