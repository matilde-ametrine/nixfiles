{ config, pkgs, ... }:

with pkgs; {
  imports = [ ./xfce.nix ./audio.nix ];

  nixpkgs.config.allowUnfree = true; # [ discord minecraft zoom-us ];

  environment.systemPackages = [
    celestia
    discord
    firefox
    gimp
    igv
    minecraft
    openscad
    redshift
    stellarium
    tor-browser-bundle-bin
    transmission-gtk
    zoom-us
  ];

  fonts.fonts = [ fira fira-mono iosevka-bin noto-fonts noto-fonts-extra ];

  services.xserver = {
    enable = true;

    xkbOptions = "ctrl:nocaps";
  };
}
