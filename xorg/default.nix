{ config, pkgs, ... }:

with pkgs; {
  imports = [ ./xfce.nix ./audio.nix ./nvidia.nix ];

  nixpkgs.config.allowUnfree = true; # [ discord minecraft zoom-us ];

  environment.systemPackages = [
    firefox
    tor-browser-bundle-bin

    discord
    zoom-us

    transmission-gtk

    minecraft
  ];

  fonts.fonts = [
    iosevka-bin

    noto-fonts
    noto-fonts-extra

    fira
    fira-mono
  ];

  services.xserver = {
    enable = true;

    xkbOptions = "ctrl:nocaps";
  };
}
