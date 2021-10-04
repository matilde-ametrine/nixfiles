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

  environment.etc."ssh/ssh_host_rsa_key".source =
    "/nix/state/ssh/ssh_host_rsa_key";
  environment.etc."ssh/ssh_host_rsa_key.pub".source =
    "/nix/state/ssh/ssh_host_rsa_key.pub";
  environment.etc."ssh/ssh_host_ed25519_key".source =
    "/nix/state/ssh/ssh_host_ed25519_key";
  environment.etc."ssh/ssh_host_ed25519_key.pub".source =
    "/nix/state/ssh/ssh_host_ed25519_key.pub";

  boot.cleanTmpDir = true;

  services.journald.extraConfig = "SystemMaxUse=512M";
}
