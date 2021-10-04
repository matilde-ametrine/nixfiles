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
    bind
    inetutils
    netcat-gnu
    ssh-tools
    nethogs

    ipcalc
    ipv6calc

    wget
    youtube-dl

    nmap
    aircrack-ng
    kismet
  ];

  networking = {
    hostName = "angband";
    domain = "y.diffyq.xyz";

    interfaces.enp3s0.useDHCP = true;
  };

  services.vnstat.enable = true;
}
