{ config, pkgs, ... }:

with pkgs; {
  imports = [ ./xfce.nix ./audio.nix ./nvidia.nix ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    celestia
    discord # Unfree.
    firefox
    gimp
    igv
    minecraft # Unfree.
    openscad
    redshift
    stellarium
    tor-browser-bundle-bin
    transmission-gtk
    zoom-us # Unfree.
  ];

  fonts.fonts = [ fira fira-mono iosevka-bin noto-fonts noto-fonts-extra ];

  services.xserver = {
    enable = true;

    xkbOptions = "ctrl:nocaps";
  };
}
