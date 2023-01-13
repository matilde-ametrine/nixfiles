{ config, pkgs, ... }:

{
  networking.domain = "ametrine.name";

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  security = {
    apparmor.enable = true;
    doas.enable = true;
    sudo.enable = false;
  };

  services.openssh = {
    kbdInteractiveAuthentication = false;
    passwordAuthentication = false;
    permitRootLogin = "no";

    knownHosts = {
      # TODO: Finish this when you have persistent host keys.
    };
  };
}
