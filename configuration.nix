{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./security.nix
    ./state.nix
    ./matilde
    ./xorg
    ./network
    ./packages
    ./goes-16.nix
  ];

  system.stateVersion = "21.11";

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
