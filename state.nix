{ config, pkgs, ... }:

let
  makeBindMounts = attrs:
    builtins.mapAttrs (target: source: {
      device = source;
      options = [ "bind" ];
    }) attrs;
in {
  fileSystems = makeBindMounts {
    "/data" = "/nix/state/data";
    "/etc/nixos" = "/nix/state/nixos";
    "/glade" = "/nix/state/glade";
    "/tmp" = "/nix/.tmp";
    "/var/lib/bluetooth" = "/nix/state/bluetooth";
    "/var/lib/yggdrasil" = "/nix/state/yggdrasil";
    "/var/log" = "/nix/state/log";
  } // {
    "/var/lib/docker" = {
      device = "/nix/state/docker.img";
      fsType = "ext4";
      options = [ "loop" ];
    };
  };

  boot.cleanTmpDir = true;

  services.journald.extraConfig = "SystemMaxUse=512M";
}
