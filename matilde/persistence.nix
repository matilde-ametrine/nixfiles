{ config, pkgs, ... }:

let github = "/data/3.software/1.github";
in {
  imports = [ "${github}/nix-community/home-manager/nixos" ];

  home-manager = {
    useGlobalPkgs = true;

    users.matilde = {
      imports =
        [ "${github}/nix-community/impermanence/home-manager.nix" ];

      home.persistence."${github}/matilde-ametrine/dotfiles" = {
        directories = [
          ".cache"
          ".config/autostart"
          ".config/borg"
          ".config/dconf"
          ".config/discord"
          ".config/matplotlib"
          ".config/pulse"
          ".config/transmission"
          ".config/xfce4"
          ".gnupg"
          ".ipfs"
          ".local/bin"
          ".local/share/direnv"
          ".local/share/gvfs-metadata"
          ".local/share/tor-browser"
          ".minecraft"
          ".mozilla"
          ".secrets"
          ".ssh"
          ".vim"
        ];

        files = [
          ".config/git/config"
          ".config/user-dirs.conf"
          ".config/user-dirs.dirs"
          ".inputrc"
          ".tmux.conf"
          ".vimrc"
          ".xscreensaver"
          ".zshenv"
          ".zshrc"
        ];

        allowOther = true;
      };
    };
  };

  programs.fuse.userAllowOther = true;
}
