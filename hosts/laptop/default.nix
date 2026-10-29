{ pkgs, ... }:
let
  # Samsung Galaxy Book 3 Pro fingerprint sensor (1c7a:05a1, EgisTec/LighTuning ETU905A80-E)
  # requires Microsoft SDCP (Secure Device Connection Protocol) support in libfprint's
  # egismoc driver so that enrolled fingerprints are committed to the sensor's on-chip storage.
  libfprint-egismoc-sdcp = pkgs.libfprint.overrideAttrs (old: {
    version = "1.95.2-egismoc-sdcp-unstable-2026-10-25";
    src = pkgs.fetchFromGitHub {
      owner = "abdallah-alkanani";
      repo = "libfprint-egismoc-sdcp";
      rev = "3b0ee1f40fececc78ca44b218ea094390df6f58a";
      hash = "sha256-GqUvSKHcrxyQqrJj3Q+v2uT1MwgI3yvJURQMy4DZnjE=";
    };
    mesonFlags = (old.mesonFlags or [ ]) ++ [
      "-Dtod=false"
    ];
    postPatch = ''
      patchShebangs \
        tests/*.py \
        tests/*.sh \
        libfprint/sdcp/generate-gresource.py
    '';
  });
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.fprintd = {
    enable = true;
    package = pkgs.fprintd.override {
      libfprint = libfprint-egismoc-sdcp;
    };
  };

  services.udev.packages = [
    libfprint-egismoc-sdcp
  ];

  environment.systemPackages = with pkgs; [
    intel-media-driver
  ];
}
