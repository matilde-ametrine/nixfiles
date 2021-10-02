{ config, pkgs, lib, ... }:

{
  imports = [ ./python.nix ./cesm.nix ];

  environment.systemPackages = with pkgs; [
    any-nix-shell
    nix-index

    borgbackup
    file
    tree
    moreutils
    unzip

    git
    direnv
    nixfmt
    nixpkgs-fmt
    shellcheck

    psmisc
    htop
    cpufrequtils

    clac
    rink
    units
    pcalc
    dateutils

    texlive.combined.scheme-full
    graphviz
    imagemagick

    man-pages
    nix-doc
  ];

  programs = {
    zsh.enable = true;
    command-not-found.enable = true;

    vim.defaultEditor = true;

    tmux.enable = true;
  };

  services.lorri.enable = true;
}
