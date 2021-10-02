{ config, pkgs, ... }:

{
  programs.mosh.enable = true;
  services.openssh.enable = true;

  environment.etc."ssh/ssh_host_rsa_key".source =
    "/nix/state/ssh/ssh_host_rsa_key";
  environment.etc."ssh/ssh_host_rsa_key.pub".source =
    "/nix/state/ssh/ssh_host_rsa_key.pub";
  environment.etc."ssh/ssh_host_ed25519_key".source =
    "/nix/state/ssh/ssh_host_ed25519_key";
  environment.etc."ssh/ssh_host_ed25519_key.pub".source =
    "/nix/state/ssh/ssh_host_ed25519_key.pub";

  users.users.matilde.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG/JvUSThR7+q3KwMnk1SCBx3T3+JbxR7lg3LNBCGZ85 angband"
  ];
}
