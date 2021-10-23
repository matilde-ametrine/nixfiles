{ config, pkgs, ... }:

{
  services.ipfs = {
    enable = true;
    autoMount = true;

    dataDir = "/nix/persist/ipfs";
    enableGC = true;
  };

  users.users.matilde.extraGroups = [ "ipfs" ];
}
