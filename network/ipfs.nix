{ config, pkgs, ... }:

{
  services.ipfs = {
    enable = true;
    autoMount = true;

    dataDir = "/nix/state/ipfs";
    enableGC = true;
  };

  users.users.matilde.extraGroups = [ "ipfs" ];
}
