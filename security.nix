{ config, pkgs, ... }:

with pkgs; {
  environment.systemPackages = [ git-crypt gnupg john ];

  nix.allowedUsers = [ "@wheel" ];

  programs.gnupg.agent.enable = true;

  security.sudo = {
    execWheelOnly = true;
    # If an attacker gets a `wheel` shell on my system, then it's already over.
    wheelNeedsPassword = false;

    extraConfig = "Defaults lecture=never";
  };

  networking.firewall = {
    enable = true;

    allowPing = false;
  };

  services.openssh = {
    challengeResponseAuthentication = false;
    passwordAuthentication = false;
    permitRootLogin = "no";
  };
}
