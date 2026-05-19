alias l := laptop
alias d := desktop

laptop:
  sudo nixos-rebuild switch --flake ~/nixos#laptop

desktop:
  sudo nixos-rebuild switch --flake ~/nixos#desktop
