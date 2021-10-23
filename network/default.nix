{ config, pkgs, ... }:

with pkgs; {
  imports = [
    ./login.nix
    ./802.11.nix
    ./overlay.nix
    ./ipfs.nix
    ./kiwix-serve.nix
    ./nginx.nix
  ];

  environment.systemPackages = [
    aircrack-ng
    bind
    inetutils
    ipcalc
    ipv6calc
    kismet
    lftp
    macchanger
    netcat-gnu
    nethogs
    nmap
    reaverwps-t6x
    ssh-tools
    sshfs
    w3m
    weather
    wget
    youtube-dl
  ];

  networking = {
    hostName = "angband";
    domain = "y.diffyq.xyz";

    interfaces.enp3s0.useDHCP = true;
  };
}
