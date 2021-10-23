{ config, pkgs, ... }:

let
  persist = "/nix/persist";
  makeBindMounts = attrs:
    builtins.mapAttrs (target: source: {
      device = source;
      options = [ "bind" ];
    }) attrs;
in {
  fileSystems = makeBindMounts {
    "/data" = "${persist}/data";
    # TODO: Remove `/etc/nixos` bind mount after switching to flakes.
    "/etc/nixos" =
      "${persist}/data/3.software/1.github/matilde-ametrine/nixfiles";
    "/tmp" = "/nix/tmp";
    "/var/lib/bluetooth" = "${persist}/bluetooth";
    "/var/log" = "${persist}/log";
  } // {
    "/var/lib/docker" = {
      device = "${persist}/docker.img";
      fsType = "ext4";
      options = [ "loop" ];
    };
  };

  environment.etc."ssh_host_rsa_key".source = "${persist}/ssh/ssh_host_rsa_key";
  environment.etc."ssh/ssh_host_rsa_key.pub".source =
    "${persist}/ssh/ssh_host_rsa_key.pub";
  environment.etc."ssh/ssh_host_ed25519_key".source =
    "${persist}/ssh/ssh_host_ed25519_key";
  environment.etc."ssh/ssh_host_ed25519_key.pub".source =
    "${persist}/ssh/ssh_host_ed25519_key.pub";

  boot.cleanTmpDir = true;

  services.journald.extraConfig = "SystemMaxUse=512M";
}
