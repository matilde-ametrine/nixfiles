{ config, pkgs, ... }:

let
  state = "/nix/state";
  makeBindMounts = attrs:
    builtins.mapAttrs (target: source: {
      device = source;
      options = [ "bind" ];
    }) attrs;
in {
  fileSystems = makeBindMounts {
    "/data" = "${state}/data";
    "/etc/nixos" = "${state}/data/3.software/1.github/matilde-ametrine/nixfiles";
    "/tmp" = "/nix/tmp";
    "/var/lib/bluetooth" = "${state}/bluetooth";
    "/var/lib/vnstat" = "${state}/vnstat";
    "/var/lib/yggdrasil" = "${state}/yggdrasil";
    "/var/log" = "${state}/log";
  } // {
    "/var/lib/docker" = {
      device = "${state}/docker.img";
      fsType = "ext4";
      options = [ "loop" ];
    };
  };

  environment.etc."ssh_host_rsa_key".source =
    "${state}/ssh/ssh_host_rsa_key";
  environment.etc."ssh/ssh_host_rsa_key.pub".source =
    "${state}/ssh/ssh_host_rsa_key.pub";
  environment.etc."ssh/ssh_host_ed25519_key".source =
    "${state}/ssh/ssh_host_ed25519_key";
  environment.etc."ssh/ssh_host_ed25519_key.pub".source =
    "${state}/ssh/ssh_host_ed25519_key.pub";

  boot.cleanTmpDir = true;

  services.journald.extraConfig = "SystemMaxUse=512M";
}
