{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio-space-age.override {
      username = "Hangover256";
      token = "527bc4bd57a45336fffae66799318e";
    };
  };
  users.users.hendrikf.packages = with pkgs; [ factorio-space-age ];

}

