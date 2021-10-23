{ config, pkgs, lib, ... }:

{
  imports = [ ./python.nix ./cesm-lab.nix ];

  environment.systemPackages = with pkgs; [
    (hiPrio parallel)
    angband
    any-nix-shell
    borgbackup
    cdo
    clac
    crunch
    dateutils
    direnv
    file
    gdb
    git
    git-crypt
    graphviz
    htop
    imagemagick
    man-pages
    maxima
    mitscheme
    moreutils
    nco
    netcdf
    nix-diff
    nix-doc
    nix-index
    nixfmt
    nixpkgs-fmt
    optipng
    pcalc
    psmisc
    racket
    rink
    sage
    samtools
    smartmontools
    texlive.combined.scheme-full
    tree
    units
    unzip
    valgrind
    vcftools
  ];

  programs = {
    zsh.enable = true;
    command-not-found.enable = true;

    vim.defaultEditor = true;

    tmux.enable = true;
  };

  services.lorri.enable = true;
}
