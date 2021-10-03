{ config, pkgs, ... }:

{
  imports = [ "/home/matilde/projects/home-manager/nixos" ];

  home-manager = {
    useGlobalPkgs = true;

    users.matilde = {
      imports = [ "/home/matilde/projects/impermanence/home-manager.nix" ];

      home.persistence."/nix/state/home" = {
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
          "documents"
          "downloads"
          "music"
          "pictures"
          "projects"
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
