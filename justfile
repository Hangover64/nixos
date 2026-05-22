alias l := laptop
alias d := desktop
alias u := update

laptop:
  sudo nixos-rebuild switch --flake ~/nixos#laptop

desktop:
  sudo nixos-rebuild switch --flake ~/nixos#desktop

update:
  sudo nix flake update
