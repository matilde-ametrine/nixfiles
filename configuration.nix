{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./security.nix
    ./persistence.nix
    ./matilde
    ./xorg
    ./network
    ./packages
    ./goes-16.nix
  ];

  system.stateVersion = "21.11";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [ pkgs.microcodeIntel ]; # Unfree.

  boot.loader = {
    systemd-boot = {
      enable = true;

      consoleMode = "max";
    };

    efi.canTouchEfiVariables = true;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };

    optimise.automatic = true;
  };

  time.timeZone = "US/Eastern";
}
